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
