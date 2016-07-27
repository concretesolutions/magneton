#!/usr/bin/env ruby
# encoding: UTF-8

def create_feature_file(name)
  # options used to generate the file in the template function
  opts = { name: camelize(name) }

  # Feature
  file_path = File.join(FileUtils.pwd, 'features', 'specifications', "#{name.downcase}.feature")

  # Thor creates a file based on the templates/feature.tt template
  template('feature', file_path, opts)
end

def create_steps_file(name)
  # options used to generate the file in the template function
  opts = { name: camelize(name) }

  # Step
    file_path = File.join(
      FileUtils.pwd, 'features', 'steps_definitions',
      "#{name.downcase}_steps.rb"
    )

  # Thor creates a file based on the templates/steps.tt template
  template('steps', file_path, opts)
end

def create_page_file(name)
  # options used to generate the file in the template function
  opts = { name: camelize(name) }

  # Thor creates a file based on the templates/page.tt template
  template('page',
           File.join(
             FileUtils.pwd, 'features', 'pages',
             "#{name.downcase}_page.rb"),
           opts)
end

def camelize(string)
  camelized = ''

  string.split('_').each do |s|
    camelized += s.capitalize
  end

  camelized
end

def in_root_project_folder?
  # Looks if the user is in the root folder of the project
  if !Dir.exist?(File.join(FileUtils.pwd, 'features', 'specifications'))
    puts 'Please run this command on the root folder of the project'
    exit 1
  end

  true
end
