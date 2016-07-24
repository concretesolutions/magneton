## Getting Started ##

### Installing rbenv ###
Run this:
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
Run this:
```shell
gem install bundler
```

### Installing gems ###
Run this:
```shell
bundle install
```

### Drivers: ###
Install [chromedriver](https://sites.google.com/a/chromium.org/chromedriver/) and [phantomjs](http://phantomjs.org/).
Remenber include in the PATH.

### Run tests in DEV with Chrome###
Run this in the tests folder:
```shell
bundle exec cucumber
```

### Run tests in DEV with Firefox###
Run this in the tests folder:
```shell
bundle exec cucumber -p firefox -p dev
```

### Run tests in DEV with Poltergeist###
Run this in the tests folder:
```shell
bundle exec cucumber -p poltergeist -p dev
```

### Run tests in HMG with Chrome###
Run this in the tests folder:
```shell
bundle exec cucumber -p chrome -p hmg
```

### Run tests in HMG with Firefox###
Run this in the tests folder:
```shell
bundle exec cucumber -p firefox -p hmg
```
### Run tests in HMG with Poltergeist###
Run this in the tests folder:
```shell
bundle exec cucumber -p poltergeist -p hmg
```

### HTML Report###
Run this in the tests folder:
```shell
bundle exec cucumber -p html_report
```

### Run with tags###
Run this in the tests folder:
```shell
bundle exec cucumber --tags @run
```
