# Configurando um novo repositório com Python, Poetry e asdf

```
meu_projeto/
├── scripts/
│   ├── 01_configurar_ambiente.sh
│   ├── 02_instalar_plugins_asdf.sh
│   ├── 03_instalar_dependencias_projeto.sh
│   ├── desinstalar_ambiente.sh
├── pyproject.toml
├── .tool-versions
```

### scripts/01_configurar_ambiente.sh
Este script configura o ambiente, instala as ferramentas essenciais, instala as dependências Python e configura o asdf. 

```bash
#!/bin/bash

# Atualiza e atualiza as dependências
echo 'Atualizando o sistema e as dependências...'
sudo apt update
sudo apt upgrade -y
sudo apt autoremove -y
sudo apt autoclean

# Instalação de ferramentas essenciais
echo 'Instalando ferramentas essenciais...'
sudo apt install curl wget openssh-server openssh-client git tar silversearcher-ag unzip -y

# Instalação de dependências para Python
echo 'Instalando dependências para Python...'
sudo apt-get update
sudo apt-get install --no-install-recommends -y make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev
sudo apt-get install -y gcc make zlib1g-dev libreadline8 sqlite3 python-tk python3-tk tk-dev

# Instalação do asdf (gerenciador de versões)
echo 'Instalando asdf...'
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.13.1
echo '. $HOME/.asdf/asdf.sh' >> ~/.bashrc
echo '. $HOME/.asdf/completions/asdf.bash' >> ~/.bashrc

# Reinicie o terminal ou execute "source ~/.bashrc" para carregar as configurações
echo 'Por favor, reinicie o terminal ou execute "source ~/.bashrc" para carregar as configurações.'
```

### scripts/02_instalar_plugins_asdf.sh
Este script instala os plugins Python e Poetry para o asdf, conforme definido no arquivo `.tool-versions`. Certifique-se de que o arquivo `.tool-versions` com as versões desejadas esteja na raiz do repositório.

Exemplo de .tool-versions:
``` bash
python 3.11.5
poetry 1.6.1
```

scripts/02_instalar_plugins_asdf.sh:
```bash
#!/bin/bash

# Instalação do plugin Python para asdf
echo 'Instalando o plugin Python para asdf...'
asdf plugin add python

# Instalação do plugin Poetry para asdf
echo 'Instalando o plugin Poetry para asdf...'
asdf plugin-add poetry https://github.com/asdf-community/asdf-poetry.git

# Leitura das versões do Python e do Poetry do arquivo .tool-versions
python_version=$(grep python .tool-versions | awk '{print $2}')
poetry_version=$(grep poetry .tool-versions | awk '{print $2}')

# Instalação das versões do Python e do Poetry especificadas no arquivo .tool-versions
echo "Instalando Python $python_version..."
asdf install python $python_version
asdf local python $python_version

echo "Instalando Poetry $poetry_version..."
asdf install poetry $poetry_version
asdf local poetry $poetry_version
```

### scripts/03_instalar_dependencias_projeto.sh
Este script é responsável por criar o arquivo `pyproject.toml` se ele não existir e, em seguida, instala as dependências do projeto e configura o pre-commit.

```bash
#!/bin/bash

if [ ! -f pyproject.toml ]; then
    echo 'Creating pyproject.toml ...'
    poetry init
fi

echo 'Installing dependencies and pre-commit ...'
poetry install
poetry run pre-commit install
```

Dessa forma, você tem uma estrutura de diretórios organizada e scripts com nomes significativos que indicam claramente suas responsabilidades. Você pode executar esses scripts na ordem apropriada para configurar o ambiente e instalar as dependências do projeto. Para rodar os scripts você pode rodar no terminal: `bash scripts/nome_do_script.sh`.

### scripts/desinstalar_ambiente.sh
``` bash
#!/bin/bash

# Remova o ambiente virtual do projeto atual
echo 'Removendo o ambiente virtual do projeto atual...'
poetry env remove $(poetry run which python)

echo 'Concluído. O ambiente virtual do projeto atual foi removido.'
```

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
