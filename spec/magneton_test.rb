describe MAGNETON do

  before(:each) do
    @project_name = 'web_automator'
  end

  after(:each) do
    FileUtils.rm_rf(@project_name)
  end

  describe 'Magneton gem commands test' do
    context 'Create new project using default command' do
      it 'Returns project created with all files' do
        system "magneton new #{@project_name}"

        expect(Dir.entries(@project_name)).to include('.gitignore', 'Gemfile', 'README.md', 'cucumber.yml', 'features', 'readme_img')
        expect(Dir.entries("#{@project_name}/features")).to include('pages', 'specifications', 'steps_definitions', 'support')
        expect(Dir.entries("#{@project_name}/features/pages")).to include('.gitkeep')
        expect(Dir.entries("#{@project_name}/features/specifications")).to include('.gitkeep')
        expect(Dir.entries("#{@project_name}/features/steps_definitions")).to include('.gitkeep')
        expect(Dir.entries("#{@project_name}/features/support")).to include('config', 'env.rb', 'helper.rb', 'hooks.rb', 'matchers')
        expect(Dir.entries("#{@project_name}/features/support/config")).to include('dev.yaml', 'hmg.yaml')
        expect(Dir.entries("#{@project_name}/features/support/matchers")).to include('custom.rb')
      end
    end

    context 'Try creates new project with a invalid argument' do
      it 'Project will not be generated' do
        system "magneton new '#{@project_name}' invalid argument"

        expect(Dir.entries(".")).not_to include("#{@project_name}")
      end
    end

    context 'Should return the latest version of magneton' do
      it 'Returns the latest version' do
        system "magneton version"
        version = "#{MAGNETON::VERSION}"

        expect(version).to end_with('0.1.0')
      end
    end

    context 'Using I18n to translate files' do
      it 'Generates a feature using I18n to portuguese language' do
        system "magneton new '#{@project_name}'"

        feature_name = 'magneton'

        Dir.chdir(@project_name)

        system "magneton generate feature '#{feature_name}' --lang=pt"

        Dir.chdir('../')

        expect(File.readlines("#{@project_name}/features/specifications/#{feature_name}.feature")).
            to include("# language: pt\n", "Funcionalidade: #{feature_name.capitalize}\n", "\n", "  Contexto:\n", "    # Insira os passos\n", "\n", "  Cenário: Primeiro Cenário\n", "    # Insira os passos\n")
        expect(File.readlines("#{@project_name}/features/steps_definitions/#{feature_name}_steps.rb")).
            to include("######### DADO #########\n", "\n", "######### QUANDO #########\n", "\n", "######### ENTãO #########\n")
      end

      it 'Generates a feature using english language' do
        system "magneton new '#{@project_name}'"

        feature_name = 'magneton'

        Dir.chdir(@project_name)

        system "magneton generate feature '#{feature_name}'"

        Dir.chdir('../')

        expect(File.readlines("#{@project_name}/features/specifications/#{feature_name}.feature")).
            to include("# language: en\n", "Feature: #{feature_name.capitalize}\n", "\n", "  Background:\n", "    # Insert steps\n", "\n", "  Scenario: First Scenario\n", "    # Insert steps\n")
        expect(File.readlines("#{@project_name}/features/steps_definitions/#{feature_name}_steps.rb")).
            to include("######### GIVEN #########\n", "\n", "######### WHEN #########\n", "\n", "######### THEN #########\n")
      end
    end

    context 'This command should generates a Feature(all files)' do
      it 'Generate a feature' do
        system "magneton new '#{@project_name}'"

        Dir.chdir(@project_name)

        feature_name = 'magneton'

        system "magneton generate feature '#{feature_name}'"

        Dir.chdir('../')

        expect(Dir.entries("#{@project_name}/features/specifications")).to include("#{feature_name}.feature")
        expect(Dir.entries("#{@project_name}/features/steps_definitions")).to include("#{feature_name}_steps.rb")
        expect(Dir.entries("#{@project_name}/features/pages")).to include("#{feature_name}_page.rb")
      end
    end

    context 'Try Generates a feature with a invalid argument' do
      it 'Feature will be not created' do
        system "magneton new '#{@project_name}'"

        feature_name = 'magneton'

        Dir.chdir(@project_name)

        system "magneton generate feature '#{feature_name}' invalid_argument"

        Dir.chdir('../')

        expect(Dir.entries("#{@project_name}/features/specifications")).not_to include("#{feature_name}.feature")
        expect(Dir.entries("#{@project_name}/features/steps_definitions")).not_to include("#{feature_name}_steps.rb")
        expect(Dir.entries("#{@project_name}/features/pages")).not_to include("#{feature_name}_page.rb")
      end
    end

    context 'Generates a page' do
      it 'Comamand cant generates .feature and steps_definition files ' do
        system "magneton new #{@project_name}"

        feature_name = 'magneton'

        Dir.chdir(@project_name)

        system "magneton generate page #{feature_name}"

        Dir.chdir('../')

        expect(Dir.entries("#{@project_name}/features/specifications")).not_to include("#{feature_name}.feature")
        expect(Dir.entries("#{@project_name}/features/steps_definitions")).not_to include("#{feature_name}_steps.rb")
      end
    end

    context 'Try Generates a feature with a invalid argument' do
      it 'Page will be not created' do
        system "magneton new #{@project_name}"

        feature_name = 'magneton'

        Dir.chdir(@project_name)

        system "magneton generate page #{feature_name} invalid_argument"

        Dir.chdir('../')

        expect(Dir.entries("#{@project_name}/features/pages")).not_to include("#{feature_name}_page.rb")
      end
    end

    context 'Generates a step definition' do
      it 'Comamand cant generates .feature and page files ' do
        system "magneton new #{@project_name}"

        feature_name = 'magneton'

        Dir.chdir(@project_name)

        system "magneton generate step #{feature_name}"

        Dir.chdir('../')

        expect(Dir.entries("#{@project_name}/features/specifications")).not_to include("#{feature_name}.feature")
        expect(Dir.entries("#{@project_name}/features/pages")).not_to include("#{feature_name}_page.rb")
      end
    end

    context 'Try Generates a step with a invalid argument' do
      it 'Step will be not created' do
        system "magneton new #{@project_name}"

        feature_name = 'magneton'

        Dir.chdir(@project_name)

        system "magneton generate step #{feature_name} invalid_argument"

        Dir.chdir('../')

        expect(Dir.entries("#{@project_name}/features/steps_definitions")).not_to include("#{feature_name}_steps.rb")
      end
    end
  end
end
