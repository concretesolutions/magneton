require_relative 'helper.rb'

Before do |_feature|
  ## variable which loads the data file according to the environment
  CONFIG ||= YAML.load_file(File.dirname(__FILE__) + "/config/#{ENVIRONMENT_TYPE}.yaml")

  I18n.config.available_locales = :en

  ## configure the chosen browser
  Capybara.configure do |config|
    config.default_driver = :selenium
  end

  ## set default max wait and maximize browser
  Capybara.default_max_wait_time = 60
  unless BROWSER.eql?('poltergeist')
    Capybara.current_session.driver.browser.manage.window.maximize
  end
end

After do |scenario|
  @helper = Helper.new
  ## take screenshot if scenario fail
  if scenario.failed?
    @helper.take_screenshot(scenario.name, 'screenshots/test_failed')
    include AllureCucumber::DSL
    embed(File.open("screenshots/test_failed/" + scenario.name + ".png"),'image/png', scenario.name + ".png")
  end
end

After('@create_baseline_image') do |scenario|
  # Add screenshot to baseline folder.
  @helper = Helper.new
  @helper.take_screenshot(scenario.name, 'screenshots/baseline')
end
