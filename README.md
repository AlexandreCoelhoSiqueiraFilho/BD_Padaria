# BD_Padaria

![SQL](https://img.shields.io/badge/SQL-4479A1?style=for-the-badge&logo=mysql&logoColor=white)


# Sistema de Gerenciamento de Padaria

Um projeto de banco de dados relacional para gerenciamento de uma padaria, desenvolvido em SQL.

## Conceitos de Banco de Dados Utilizados

### **1. Modelagem Relacional**
- **Tabelas**: `produto`, `cliente`, `fornecedora`, `padaria`, `funcionario`, `fatura`, `itensFatura`
- **Chaves Primárias**: Identificadores únicos para cada registro (CPF, CNPJ, código)
- **Chaves Estrangeiras**: Relacionamentos entre tabelas

### **2. Normalização**
- Dados organizados em tabelas específicas para evitar redundância
- Cada tabela tem uma responsabilidade única

### **3. Relacionamentos**
- **1:N** (Um para Muitos): Padaria → Funcionários
- **1:N** (Um para Muitos): Cliente → Faturas
- **N:M** (Muitos para Muitos): Produto ↔ Fatura (resolvido com tabela associativa `itensFatura`)

### **4. Constraints de Integridade**
- `PRIMARY KEY`: Garante unicidade dos registros
- `FOREIGN KEY`: Mantém a integridade referencial entre tabelas
- `NOT NULL`: Campos obrigatórios

## Estrutura do Banco

### **Tabelas Principais:**

- **`produto`**: Cadastro de produtos (código, nome, validade, preço, quantidade)
- **`cliente`**: Dados dos clientes (CPF, nome, idade, sexo)
- **`fornecedora`**: Informações dos fornecedores (CNPJ, nome, produto, endereço)
- **`padaria`**: Dados das unidades (CNPJ, nome, endereço)
- **`funcionario`**: Cadastro de funcionários (CPF, nome, idade, sexo, vínculo com padaria)
- **`fatura`**: Registro de vendas (pedido, data, valor total, cliente, funcionário)
- **`itensFatura`**: Itens de cada venda (produtos, quantidades, valores)

## Funcionalidades Implementadas

### **Operações CRUD:**
- **CREATE**: `INSERT` para popular todas as tabelas
- **READ**: `SELECT` com filtros, ordenação e operadores lógicos
- **UPDATE**: `UPDATE` para modificar endereços e aplicar descontos
- **DELETE**: `DELETE` para remover itens específicos

### **Consultas Avançadas:**
- **JOIN implícito**: Relacionamento entre tabelas
- **WHERE com BETWEEN**: Filtros por intervalo de valores
- **LIKE**: Busca por padrões em textos
- **ORDER BY**: Ordenação de resultados
- **DISTINCT**: Valores únicos

## Como Usar

1. Execute o script SQL para criar o banco e tabelas
2. Os dados de exemplo já estão incluídos via INSERT
3. Execute as consultas para testar as funcionalidades

## Exemplos de Consultas

```sql
-- Clientes com "ra" no nome
SELECT nome FROM cliente WHERE nome LIKE '%ra%';

-- Faturas entre R$50 e R$200
SELECT * FROM fatura WHERE valor_total BETWEEN 50.00 AND 200.00;

-- Funcionários por padaria com ordenação por idade
SELECT P.nome, P.endereco, F.nome, F.idade 
FROM padaria P, funcionario F 
WHERE P.cnpj = F.padaria_cnpj 
ORDER BY idade;
