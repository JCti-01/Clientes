# Projeto Rails com UUID e Devise 

Este projeto é uma aplicação Ruby on Rails para Gerenciamento de Clientes e seus endereços, configurada para usar PostgreSQL, UUID como chave primária nas tabelas, autenticação com Devise, Tailwind para um css moderno, stimulus para um js mais avançado e clean.

---

## 🛠️ Requisitos

- Ruby `3.0.0 +`
- Rails `~> 8.0.2`
- PostgreSQL (Utilize o pgAdmin4 para melhor visualização) 
- Node.js e Yarn (para assets no Rails 7 com Importmap, esbuild ou propshaft)
- Tailwind

---

### Adicionando o Projeto
Clone o repositório e acesse a pasta

Execute o comando:

    bundle install

Crie o banco de dados com:

    rails db:create 

Rode as migrações com:

    rails db:migrate


Inicie o servidor:

    bin/dev
