# Meu App Flutter 🚀

## 📌 Descrição
Este é um aplicativo Flutter estruturado com a arquitetura Clean Architecture, utilizando **Cubit** para gerenciamento de estado, **GetIt** para injeção de dependências, **Http** para requisições REST, **Logger** para logs das requisições e **Mocktail** para testes automatizados.

## 🛠️ Arquitetura Utilizada
O projeto segue a estrutura TDD:

```
lib
|____core
| |____core.dart
| |____theme
| |____extensions
| |____infra
| | |____di
| | |____errors
| | |____http
| |____widgets
| | |____<shared widgets>
|____features
| |____<FEATURE NAME>
| | |____data
| | | |____datasources
| | | | |____<datasource class>.dart
| | | |____mappers
| | | | |____<mapper class>.dart
| | | |____models
| | | | |____<model class>.dart
| | | |____repositories
| | | | |____<repository impl>.dart
| | |____domain
| | | |____entities
| | | | |____<entity class>.dart
| | | |____repositories
| | | | |____<repository interface>.dart
| | | |____usecases
| | | | |____<usecase class>.dart
| | |____presentation
| | | |____cubit
| | | | |____<cubit class>.dart
| | | |____pages
| | | | |____<page class>.dart
| | | |____widgets
| | | | |____<widget class>.dart
|____main.dart

test
|____features
| |____<FEATURE NAME>
| | |____data
| | |____domain  
| | |____presentation
|____mocks
|____fixtures

```

## 🚀 Como rodar o projeto?

1. **Clone o repositório:**
   ```sh
   git clone https://github.com/leocarminatti/suite_finder.git
   cd suite_finder
   ```

2. **Instale as dependências:**
   ```sh
   flutter pub get
   ```

3. **Execute o aplicativo:**
   ```sh
   flutter run
   ```

## 📦 Tecnologias e Dependências
O projeto utiliza as seguintes bibliotecas externas:

```yaml
dependencies:
  http: ^1.3.0
  flutter_bloc: ^9.0.0
  get_it: ^8.0.3
  logger: ^2.5.0
  carousel_slider: ^5.0.0
  intl: ^0.20.2

dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^5.0.0
  mocktail: ^1.0.4
  mocktail_image_network: ^1.2.0
```

## 🏗️ Estrutura do Código
O código está dividido em **camadas** seguindo o DDD:
- **Presentation:** Contém as telas e widgets reutilizáveis e gerenciamento de estado com Cubit.
- **Domain:** Contém modelos que representam os dados da aplicação.
- **Data:** Camada responsável pelo acesso a repositórios, serviços e comunicação com API/local storage.
- **Core:** Camada responsável pela configuração do projeto, como injeção de dependências, configurações de tema, extensões e infra.

## 🧪 Testes Automatizados
O projeto utiliza **Mocktail** para testes unitários e **bloc_test** para testar a lógica de estado.

📌 **Executar todos os testes:**
```sh
flutter test
```

📌 **Habilitar a Cobertura de Testes:**
```sh
flutter test --coverage
```

📌 **Visualizar a Cobertura no Terminal('lib/core/*' para ignorar a cobertura da camada core para garantir que a cobertura seja correta para as features):**
```sh
genhtml coverage/lcov.info -o coverage/html --exclude 'lib/core/*'
```

📌 **Abrir o Relatório de Cobertura:**
```sh
open coverage/html/index.html # macOS
xdg-open coverage/html/index.html # Linux
start coverage/html/index.html # Windows
```

### Demonstração do App

[![Demonstração do App](https://drive.google.com/file/d/1jV9OwAFxgF-B0w0xM-Q0dMJfYCCMzpLN/view?usp=sharing)

Clique na imagem para assistir ao vídeo.


## 📜 Licença
Este projeto está sob a licença MIT.