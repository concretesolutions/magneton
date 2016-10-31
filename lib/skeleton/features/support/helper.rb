# encoding: utf-8
# !/usr/bin/env ruby
class Helper
  def mouse_over(element_selector)
    element = Capybara.page.driver.browser.find_element(:css, element_selector)
    Capybara.page.driver.browser.mouse.move_to element
  end

  def take_screenshot(name_file, folder = 'screenshots/test_screens')
    file = "#{folder}/#{name_file}.png"
    FileUtils.mkdir_p(folder) unless File.exist?(folder)
    if BROWSER.eql?('poltergeist')
      Capybara.page.save_screenshot(file)
    elsif BROWSER.eql?('chrome')
      # zoom to screenshot all page
      Capybara.page.driver.browser.execute_script("document.body.style.zoom=(top.window.screen.height-70)/Math.max(document.body.scrollHeight, document.body.offsetHeight, document.documentElement.clientHeight, document.documentElement.scrollHeight, document.documentElement.offsetHeight);")
      Capybara.page.driver.browser.save_screenshot(file)
    else
      Capybara.page.driver.browser.save_screenshot(file)
    end
  end

  def take_screenshot_and_crop(name_file, folder = 'screenshots/croped_files', css_element_crop)
    file = "#{folder}/#{name_file}.png"
    FileUtils.mkdir_p(folder) unless File.exist?(folder)
    #scroll to element
    element = Capybara.page.driver.browser.find_element(:css, css_element_crop)
    element.location_once_scrolled_into_view

    # get location and size of element
    location = element.location
    size = element.size

    # take original screenshot
    take_screenshot('image_to_crop')

    # read original screenshot
    image = ChunkyPNG::Image.from_file('screenshots/test_screens/image_to_crop.png')

    # get X, Y, width and height
    left = location['x'] * 2
    top = location['y'] * 2
    right = size['width'] * 2
    bottom = size['height'] * 2

    # crop original image and save
    # crop original image
    if OS.mac?
      image.crop!(left * 2 , top * 2, right * 2, bottom * 2)
    else
      image.crop!(left , top, right, bottom)
    end
    image.save(file)
  end
end
