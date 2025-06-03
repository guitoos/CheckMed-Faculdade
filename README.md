# 🏥 CheckMed - Sistema de Gerenciamento Médico

O **CheckMed** é um sistema de linha de comando, desenvolvido em **Python**, para gerenciar pacientes, médicos, consultas e prontuários em clínicas médicas. Ele se conecta a um banco de dados MySQL para armazenar e recuperar informações essenciais.

## ⚙️ Funcionalidades

- Cadastro e listagem de pacientes
- Busca de paciente por CPF
- Agendamento e listagem de consultas
- Confirmação de presença em consultas
- Cadastro e listagem de médicos
- Registro e visualização de prontuários médicos

## 🛠️ Tecnologias Utilizadas

- Python 3.x
- MySQL
- Biblioteca `mysql-connector-python`

## 🧩 Estrutura do Banco de Dados

O projeto espera que existam as seguintes tabelas no banco de dados `checkmed`:

- `tbl_pacientes`
- `tbl_medicos`
- `tbl_consultas`
- `tbl_status_consultas`
- `tbl_prontuarios`

> **Atenção**: Certifique-se de que essas tabelas estejam corretamente criadas antes de rodar o sistema.

## 🚀 Como Executar

1. Clone o repositório:

```bash
git clone https://github.com/seu-usuario/checkmed.git
cd checkmed
