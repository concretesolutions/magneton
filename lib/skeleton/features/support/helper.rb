# encoding: utf-8
# !/usr/bin/env ruby
require 'fileutils'
class Helper
  def mouse_over(element_selector)
    element = Capybara.page.driver.browser.find_element(:css, element_selector)
    Capybara.page.driver.browser.mouse.move_to element
  end

  def take_screenshot(name_file, folder='screenshots/test_screens')
   file = "#{folder}/#{name_file}.png"
   FileUtils.mkdir_p(folder) unless File.exists?(folder)
   if BROWSER.eql?('poltergeist')
     Capybara.page.save_screenshot(file)
   else
     Capybara.page.driver.browser.save_screenshot(file)
   end
 end
end
