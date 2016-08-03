require_relative 'helper.rb'

Before do |feature|
  ## variable which loads the data file according to the environment
  CONFIG = YAML.load_file(File.dirname(__FILE__) + "/config/#{ENVIRONMENT_TYPE}.yaml")

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
  end
  ## if the browser is different from poltergeist, kills instance
  unless BROWSER.eql?('poltergeist')
    Capybara.current_session.driver.quit
  end
end
