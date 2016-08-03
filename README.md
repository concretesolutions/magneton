# CS::WEBAUTOMATOR

A simple gem to generate web automation project with:

> Cucumber [(link)](https://cucumber.io/)

> Capybara [(link)](https://github.com/jnicklas/capybara)

> SitePrism [(link)](https://github.com/natritmeyer/site_prism)

> Selenium Webdriver [(link)](http://www.seleniumhq.org/)

 The structure is based on three layers: features, steps and pages.

1. Features: Contains all the features of the project;
2. Steps: Contains all the steps implementations;
3. Pages: Contains all the pages in the website. A page must contain the declaration of all the elements of the page and the declaration of its actions.

## Instalation

Install it as:

    $ gem install cs-webautomator

## Usage

In the terminal, type for help:

```
  cs-webautomator
  cs-webautomator generate
```

To see the gem version type:

```
  cs-webautomator version
```

To generate a project type:

```
  cs-webautomator new ProjectName
```

### Windows Caveats

##### If you face encoding problems, type: #####
```
[HKEY_CURRENT_USER\Software\Microsoft\Command Processor] "AutoRun"="chcp 65001"
```
This command will ensure your terminal is always using Unicode.

##### Preparing Internet Explorer #####

1. Check zoom level. It must be configured to 100%:

     ![Step 1](readme_img/step_1.png?raw=true "Check zoom level")

2. Disable 'Protected Mode' for all zones on Internet Options > Security:

    ![Step 2](readme_img/step_2.png?raw=true "Disable 'Protected Mode'")

#### Localized Project Generation
This command will create a folder named ProjectName in the current directory and will create all the needed files. This gem support localizations. To create a localized project, in Portuguese, type:

```
  cs-webautomator new ProjectName --lang=pt
```

> The default language is English ('en'). The elements of Gherkin such as Given, When, Then, And, Scenario will be translated to all Gherkin supported languages, but this gem has just a few translation files (see that in folder: `lib/cs/webautomator/locales`).

  > **CS-WEBAUTOMATOR doesn't support your mother language?** No problem. Fork it, create your yml translation file, uses the en.yml file as a template. Translate it and make a pull request. There are only 15 lines to be translated, this will take no time.

  > **Want to know how to name your translation yml file?** See the Gherkin supported languages [here](https://github.com/cucumber/gherkin/blob/master/lib/gherkin/i18n.json) for reference.

Once the project is created, open its folder (`cd ProjectName`) and run `bundle install`

There are three generators that are responsible to create the templates for Features, Step definitions and Pages.

**The generators commands ONLY WORK in the ROOT FOLDER of the project.**

#### Features

```
  cs-webautomator generate feature FeatureName
```
The feature generator will create a feature and its files. So this command will create the FeatureName.feature file inside the folder `features/specifications`, the file FeatureName_steps.rb inside the folder `features/step_definitions`, the files FeatureName_page.rb inside the folder `features/pages`.

#### Steps

```
  cs-webautomator generate step StepName
```
The step generator will create a step file named StepName_steps.rb in the folder  `features/step_definitions`


#### Pages

```
  cs-webautomator generate page PageName
```

The screen generator will create both Platform dependent screens in the folder `features/pages`

## TODO

1. Run tests in Remote Server
2. Add more base methods using Selenium

## Contributing

1. Fork it ( https://github.com/samycici/cs-webautomator/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
