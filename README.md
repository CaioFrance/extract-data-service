# Extração de dados de API REST
<hr/>

## Sobre o projeto

<p>Trata-se da Extração de Dados de uma API REST e salvar os dados 
em um banco de dados PostgreSQL.</p>

## Requisitos

<h4>Requisitos para ambiente local</h4>
- <a href="https://www.ruby-lang.org/pt/">Ruby 3.0.0</a>
- <a href="https://www.postgresql.org/">PostgreSQL</a>
- Utilizar um orquestrador de container (Ex: Docker-compose)

## Baixando o projeto e suas dependências
```
    git clone git@github.com:CaioFrance/extract-service.git
    cd /home/seu-caminho/extract-service
    
    bundler install
```
## Preparação
<p>
    A raiz do projeto possui um arquivo ".env.example", duplique este arquivo
    e renomeie para ".env" e preencha as variáveis.
    O banco de dados irá rodar em um container no qual ficará recebendo os dados
    da API. <br>
    No arquivo <strong>Rakefile</strong> você preenche as credenciais do banco de dados,
    e nos arquivos de testes (./spec/extract_data/)<br>
    Este projeto utiliza o <a href="https://github.com/ruby/rake">Rake</a> para rodar o script. <br>
    Após ter preenchido o arquivo de variáveis ambiente, rode o comando abaixo e seja feliz.
</p>

```
    rake extract
```

<p>Para testar o script bastar digitar o seguinte comando.</p>

```
    rake test
```

## Agradecimentos

<p>Foi um baita desafio, quero agradecer a todos que leram até aqui e a oportunidade de resolver esse desafio, Obrigado! :).</p>
