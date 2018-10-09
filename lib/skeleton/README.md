## Getting Started ##

### Installing rbenv ###
To install rbenv type:
```shell
brew install rbenv
```

Add to ~/.bash_profile:
```shell
eval "$(rbenv init -)"
```

List all available versions:
```shell
rbenv install -l
```

Install a Ruby version:
```shell
rbenv install 2.3.1
```

Sets a local application-specific Ruby 2.3.1:
```shell
rbenv local 2.3.1
```

### Installing bundler ###
To install bundler type:
```shell
gem install bundler
```

### Windows Caveats ###

##### Preparing Internet Explorer #####

1. Check zoom level. It must be configured to 100%:

     ![Step 1](readme_img/step_1.png?raw=true "Check zoom level")

2. Disable 'Protected Mode' for all zones on Internet Options > Security:

    ![Step 2](readme_img/step_2.png?raw=true "Disable 'Protected Mode'")

##### Install FFI #####

To install FFI package type:
```shell
bundle install ffi --platform ruby
```

### Installing gems ###
To install gems type:
```shell
bundle install
```

### Installing Xvfb in Linux ###
If you run tests with xvfb, its necessary install:
```shell
apt-get install xvfb firefox  
```

or
```shell
yum install xvfb firefox
```

### Using Selenium Grid for remote browser ###
Use https://github.com/zalando/zalenium or http://www.seleniumhq.org/projects/grid/


### Drivers: ###
Install and include in PATH
- [chromedriver](https://sites.google.com/a/chromium.org/chromedriver/)
- [phantomjs](http://phantomjs.org/)
- [internetExplorerDriver](http://www.seleniumhq.org/download/)
- [Firefox Geckodriver](https://developer.mozilla.org/en-US/docs/Mozilla/QA/Marionette/WebDriver)

- Install [Webdriver Safari extension](http://selenium-release.storage.googleapis.com/2.48/SafariDriver.safariextz).
- Install [Allure Report](https://docs.qameta.io/allure/#_installation_11)


### Run tests in DEV with Chrome ###
Type this in the tests folder:
```shell
bundle exec cucumber
```

### Run tests in DEV with Firefox ###
Type this in the tests folder:
```shell
bundle exec cucumber -p firefox -p dev
```

### Run tests in DEV with Safari ###
Type this in the tests folder:
```shell
bundle exec cucumber -p safari -p dev
```

### Run tests in DEV with Poltergeist ###
Type this in the tests folder:
```shell
bundle exec cucumber -p poltergeist -p dev
```

### Run tests in DEV with headless xvfb ###
Type this in the tests folder:
```shell
bundle exec cucumber -p headless_xvfb -p dev
```
### Run tests in DEV with remote browser ###
Type this in the tests folder:
```shell
bundle exec cucumber -p remote_browser -p dev
```

### HTML Report ###
Type this in the tests folder:
```shell
bundle exec cucumber -p html_report
```

### Run with tags ###
Type this in the tests folder:
```shell
bundle exec cucumber --tags @run
```

### Allure Report ###
In the cucumber.yml file change the value of html_report
```shell
html_report: --format AllureCucumber::Formatter --out
```
To generate the report from existing Allure results you can use the following command:
```shell
allure generate <directory-with-results>
```
The report will be generated to allure-report folder. You can change the destination folder using -o flag:
```shell
allure generate <directory-with-results> -o <directory-with-report>
```

The report will be generated to allure-report folder. You can change the destination folder using -o flag:
```shell
allure open <directory-with-report>
```
More information read item 13.1.2 of the [Allure documentation](https://docs.qameta.io/allure/#_configuration_3)
