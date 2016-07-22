# CS::WEBAUTOMATOR

## Instalação

Executar:

    $ gem install cs-webautomator

## Uso

No terminal, para acessar o help:

```
  cs-webautomator
  cs-webautomator generate
```

Ver a versão da gem:

```
  cs-webautomator version
```

Gerar o projeto:

```
  cs-webautomator new Projeto
```

Esse comando vai criar uma pasta com o nome Projeto no diretório corrente e criar os arquivos padrões. Projeto gerado em português por default.

**Os comandos generate só funcionam dentro da raiz do projeto**.

####Features

```
  cs-webautomator generate feature NomeFeature
```

Esse comando vai criar um arquivo NomeFeature.feature dentro de `features/specifications`, NomeFeature_steps.rb dentro de `features/step_definitions` e FeatureName_page.rb dentro de `features/pages`.

####Steps

```
  cs-webautomator generate step NomeStep
```
Esse comando vai criar um arquivo NomeStep_steps.rb na pasta `features/step_definitions`


####Pages

```
  cs-webautomator generate page PageName
```

Esse comando vai criar um arquivo NomeStep_page.rb na pasta `features/pages`
