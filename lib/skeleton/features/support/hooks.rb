Before do |feature|
  ## variable which loads the data file according to the environment
  CONFIG = YAML.load_file(File.dirname(__FILE__) + "/config/#{ENVIRONMENT_TYPE}.yaml")

  ## configure the chosen browser
  Capybara.configure do |config|
    config.default_driver = :selenium
  end

  ## set default max wait and maximize browser
  Capybara.default_max_wait_time = 20
  Capybara.current_session.driver.browser.manage.window.maximize
end

After do |scenario|

  ## take screenshot if scenario fail
  if scenario.failed?
    folder = 'screenshots'
    file = "#{folder}/#{scenario.name}.png"
    Dir.mkdir(folder) unless File.exist?(folder)
    if BROWSER.eql?('poltergeist')
      Capybara.page.save_screenshot(file)
    else
      Capybara.page.driver.browser.save_screenshot(file)
    end
  end

  ## if the browser is different from poltergeist, kills instance
  unless BROWSER.eql?('poltergeist')
    Capybara.current_session.driver.quit
  end
end
