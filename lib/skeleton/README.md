## Configurando o ambiente ##

### Instalar rbenv ###
Execute o seguinte comando:
```shell
brew install rbenv
```

Inclua no ~/.bash_profile:
```shell
eval "$(rbenv init -)"
```

Listar as versões disponíveis:
```shell
rbenv install -l
```

Instalar uma versão:
```shell
rbenv install 2.3.1
```

### Ativar rbenv 2.3.1 ###
Navegar para pasta desejada e executar o seguinte comando:
```shell
rbenv local 2.3.1
```

### Instalando o bundler ###
Navegar para pasta desejada e executar o seguinte comando:
```shell
gem install bundler
```

### Instalando as gems ###
Execute o seguinte comando dentro da raiz do projeto:
```shell
bundle install
```

### Drivers necessários: ###
Instalar [chromedriver](https://sites.google.com/a/chromium.org/chromedriver/) e [phantomjs](http://phantomjs.org/) e adicionar ao PATH

### Executando os testes em DEV usando Chrome###
Execute o seguinte comando dentro da raiz do projeto:
```shell
bundle exec cucumber
```

### Executando os testes em DEV usando Firefox###
Execute o seguinte comando dentro da raiz do projeto:
```shell
bundle exec cucumber -p firefox -p dev
```

### Executando os testes em DEV usando Poltergeist###
Execute o seguinte comando dentro da raiz do projeto:
```shell
bundle exec cucumber -p poltergeist -p dev
```

### Executando os testes em HMG usando Chrome###
Execute o seguinte comando dentro da raiz do projeto:
```shell
bundle exec cucumber -p chrome -p hmg
```

### Executando os testes em HMG usando Firefox###
Execute o seguinte comando dentro da raiz do projeto:
```shell
bundle exec cucumber -p firefox -p hmg
```
### Executando os testes em HMG usando Poltergeist###
Execute o seguinte comando dentro da raiz do projeto:
```shell
bundle exec cucumber -p poltergeist -p hmg
```

### Gerando relatório HTML###
Execute o seguinte comando dentro da raiz do projeto:
```shell
bundle exec cucumber -p html_report
```

### Executando tags###
Execute o seguinte comando dentro da raiz do projeto:
```shell
bundle exec cucumber --tags @run
```

### Rodados specs de TDD###
Execute o seguinte comando dentro de TDD:
```shell
bundle exec rspec
```
