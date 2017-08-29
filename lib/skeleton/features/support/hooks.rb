require_relative 'helper.rb'
## variable which loads the data file according to the environment
CONFIG = YAML.load_file(File.dirname(__FILE__) + "/config/#{ENVIRONMENT_TYPE}.yaml")

Before do |_feature|
  ## variable which loads the data file according to the environment
  CONFIG = YAML.load_file(File.dirname(__FILE__) + "/config/#{ENVIRONMENT_TYPE}.yaml")

  I18n.config.available_locales = :en

  ## configure the chosen browser
  Capybara.configure do |config|
    config.default_driver = :selenium
  end

  ## set default max wait
  Capybara.default_max_wait_time = 60

  ## maximize browser
  unless BROWSER.eql?('poltergeist')
    screen_width = Capybara.page.execute_script("return screen.width;")
    screen_height = Capybara.page.execute_script("return screen.height;")
    Capybara.current_session.driver.browser.manage.window.resize_to(screen_width,screen_height)
  end
end

After do |scenario|
  @helper = Helper.new
  ## take screenshot if scenario fail
  if scenario.failed?
    @helper.take_screenshot(scenario.name, 'screenshots/test_failed')
  end
end

After('@create_baseline_image') do |scenario|
  # Add screenshot to baseline folder.
  @helper = Helper.new
  @helper.take_screenshot(scenario.name, 'screenshots/baseline')
end
