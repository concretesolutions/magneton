# CS::WEBAUTOMATOR

## Installation

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

To generate a project that support both Android and iOS features type:

```
  cs-webautomator new ProjectName
```

This command will create a folder named ProjectName in the current directory and will create all the needed files. This gem support localizations. To create a localized project, in Portuguese, type:

```
  cs-webautomator new ProjectName --lang=pt
```

  > The default language is English ('en'). The elements of Gherkin such as Given, When, Then, And, Scenario will be translated to all Gherkin supported languages, but this gem has just a few translation files (see that in folder: `lib/cs/webautomator/locales`).

  > **CS-BDD doesn't support your mother language?** No problem. Fork it, create your yml translation file, uses the en.yml file as a template. Translate it and make a pull request. There are only 15 lines to be translated, this will take no time.

  > **Want to know how to name your translation yml file?** See the Gherkin supported languages [here](https://github.com/cucumber/gherkin/blob/master/lib/gherkin/i18n.json) for reference.

Once the project is created, open its folder (`cd ProjectName`) and run `bundle install`

  > This project supports both Android and iOS, so if you are on a PC you will not need the gems that are only for Macs, so you can run the command `bundle install --without mac_os`

  > Remember to fix the calabash-cucumber version on the Gemfile. When updating the calabash-cucumber gem version you need to update the Calabash framework that was embedded on your iOS code. So, my suggestion is to update it manually. [In this page](https://github.com/calabash/calabash-ios/wiki/B1-Updating-your-Calabash-iOS-version) you can find more information on how to update the Calabash framework.


There are nine generators that are responsible to create the templates for Features, Step definitions and Screens.

**The generators commands ONLY WORK in the ROOT FOLDER of the project**.

####Features

```
  cs-webautomator generate feature FeatureName
```
The feature generator will create a Platform independent feature and its files. So this command will create the FeatureName.feature file inside the folder `feature`, the file FeatureName_steps.rb inside the folder `features/step_definitions`, the file FeatureName_page.rb inside the folder `features/pages`.


Don't forget about internationalization. All the generators accept the option `--lang=pt` or with some other language.

####Steps

```
  cs-webautomator generate step StepName
```
The step generator will create a Platform independent step file named StepName_steps.rb in the folder `features/step_definitions`


####Pages

```
  cs-webautomator generate page PageName
```
The step generator will create a Platform independent page file named StepName_page.rb in the folder `features/pages`


## Continuous Integration (CI)

The project contains a lot of scripts that will help you to configure you CI server.

> Documentation under development.

## Contributing

1. Fork it ( https://github.com/samycici/cs-webautomator )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
