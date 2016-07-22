Before do |feature|
  CONFIG = YAML.load_file(File.dirname(__FILE__) + "/config/#{AMBIENTE}.yaml")
  Capybara.configure do |config|
    config.default_driver = :selenium
  end
  Capybara.default_max_wait_time = 20
end

After do |scenario|
  if scenario.failed?
    diretorio = 'screenshots'
    arquivo = "#{diretorio}/#{scenario.name}.png"
    Dir.mkdir(diretorio) unless File.exist?(diretorio)
    if BROWSER.eql?('poltergeist')
      Capybara.page.save_screenshot(arquivo)
    else
      Capybara.page.driver.browser.save_screenshot(arquivo)
    end
  end
  unless BROWSER.eql?('poltergeist')
    Capybara.current_session.driver.quit
  end
end
