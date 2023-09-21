# Configurando um novo repositório com Python, Poetry e asdf

```
meu_projeto/
├── scripts/
│   ├── 01_configurar_ambiente.sh
│   ├── 02_instalar_plugins_asdf.sh
│   ├── 03_instalar_dependencias_projeto.sh
│   ├── desinstalar_ambiente.sh
├── .pre-commit-config.yaml
├── pyproject.toml
├── .tool-versions
```

## Configurando o projeto:
Basta rodar os scripts `01_configurar_ambiente.sh`, `02_instalar_plugins_asdf.sh`, `03_instalar_dependencias_projeto.sh` em ordem na raiz do repositório e fazendo o que é orientado no terminal: 
`bash scripts/nome_do_script.sh`. Caso alguém precise clonar o respositório e fazer testes, o procedimento é o mesmo, mas no seu repositório, então coloque no readme como o usuário pode configurar.

# Como Usar o Poetry para Gerenciar Dependências

1. **Criar um novo projeto Python:**

   Se você ainda não possui um projeto Python existente, pode usar o comando `poetry new` para criar um novo projeto. Por exemplo:

   ```bash
   poetry new meu_projeto
   ```

   Isso criará uma estrutura de diretório básica para o seu projeto e um arquivo `pyproject.toml` inicial.

2. **Editar o `pyproject.toml`:**

   Abra o arquivo `pyproject.toml` com seu editor de texto preferido e adicione as dependências do seu projeto sob a seção `[tool.poetry.dependencies]`. Por exemplo:

   ```toml
   [tool.poetry.dependencies]
   python = "^3.11"
   requests = "^2.26.0"
   ```

   Isso define a versão mínima do Python e adiciona a biblioteca "requests" como uma dependência.

3. **Instalar Dependências do Projeto:**

   Para instalar as dependências do projeto definidas em `pyproject.toml`, execute o seguinte comando na raiz do seu projeto:

   ```bash
   poetry install
   ```

   Isso criará um ambiente virtual e instalará as dependências do projeto nele.

4. **Executar Comandos no Ambiente Virtual:**

   Para executar comandos no contexto do ambiente virtual criado pelo Poetry, você pode usar o seguinte comando:

   ```bash
   poetry run <seu_comando_aqui>
   ```

   Por exemplo, se você quiser executar um script Python:

   ```bash
   poetry run python meu_script.py
   ```

5. **Gerenciar Dependências com o Poetry:**

   - Adicionar uma nova dependência:

     ```bash
     poetry add <pacote>
     ```

   - Remover uma dependência:

     ```bash
     poetry remove <pacote>
     ```

   - Atualizar dependências:

     ```bash
     poetry update
     ```

6. **Pre-commit Hooks:**

   Se você configurou o pre-commit no seu projeto usando o script `03_instalar_dependencias_projeto.sh`, os githooks serão configurados automaticamente. Isso significa que as verificações de estilo, formatação de código, entre outras, serão executadas antes de cada commit. Certifique-se de corrigir quaisquer problemas indicados pelo pre-commit antes de confirmar suas alterações.

Agora você está pronto para desenvolver seu projeto Python com Poetry. Lembre-se de que o Poetry gerencia suas dependências de forma eficiente e facilita a criação de ambientes virtuais isolados para seus projetos.
