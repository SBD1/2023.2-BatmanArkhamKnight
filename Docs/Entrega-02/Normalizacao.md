# Normalização - Batman Arkham Knight

## Introdução
A normalização em bancos de dados é um processo essencial para organizar dados de maneira eficiente, reduzindo a redundância e mantendo a consistência. As formas normais são etapas ou níveis desse processo de normalização, cada uma trazendo requisitos específicos para a organização dos dados, entre elas temos: 

- 1ª Forma Normal (1FN): A 1FN exige que cada coluna em uma tabela contenha valores atômicos e não repetidos. Isso significa que cada célula na tabela deve conter um único valor, não sendo possível ter múltiplos valores separados por vírgula, por exemplo. Isso ajuda a eliminar a repetição de dados.

- 2ª Forma Normal (2FN): Na 2FN, a tabela precisa atender aos requisitos da 1FN e, adicionalmente, todos os campos não-chave devem depender completamente da chave primária. Isso significa que os campos que não são chaves devem ser dependentes da chave primária, evitando dependências parciais.

- 3ª Forma Normal (3FN): A 3FN estabelece que uma tabela deve estar na 2FN e, além disso, não pode ter dependências transitivas. Isso significa que os campos que não são chave não devem depender uns dos outros. Se um campo depende de outro que, por sua vez, depende da chave primária, é necessária uma reformulação para remover essa dependência transitiva.

- 4ª Forma Normal (4FN): A 4FN vai além das formas normais anteriores, focando na decomposição de multi-valorados e dependências multi-valoradas. Ela lida com situações em que um conjunto de dados pode ter múltiplas dependências entre subconjuntos dos atributos, garantindo uma estrutura ainda mais refinada e minimizando a redundância.

- Forma Normal de Boyce-Codd (FNBC): A Forma Normal de Boyce-Codd se concentra em eliminar anomalias associadas a dependências funcionais e preserva a integridade do banco de dados.

### Tabela Mapa - Normalização feita até a 3ª Forma Normal (3NF)

**1ª Forma Normal (1FN):** Não existem atributos que são multivalorados, portanto além dos atributos serem atômicos, a tabela já estava na 1FN. A chave primária é "**id**"

**2ª Forma Normal (2FN):** Como não existem chaves primárias compostas e os atributos comuns não dependem parcialmente de qualquer chave, a 2FN não se aplica a esta tabela.

**3ª Forma Normal (3FN):** A tabela está na 3FN, ja que os atributos comuns não dependem transitivamente de qualquer superchave.

Não existem dependências funcionais complementares mais, portanto não é necessário a 4ª Forma Normal (FN) e nem a Forma normal de Boyce-Codd(FNBC)

### Tabela Região - Normalização feita até a 3ª Forma Normal (3NF)

**1ª Forma Normal (1FN):** Não existem atributos que são multivalorados, portanto além dos atributos serem atômicos, a tabela já estava na 1FN. A chave primária é "**id**"

**2ª Forma Normal (2FN):** Como não existem chaves primárias compostas e os atributos comuns não dependem parcialmente de qualquer chave, a 2FN não se aplica a esta tabela.

**3ª Forma Normal (3FN):** A tabela está na 3FN, ja que os atributos comuns não dependem transitivamente de qualquer superchave.

Não existem dependências funcionais complementares mais, portanto não é necessário a 4ª Forma Normal (FN) e nem a Forma normal de Boyce-Codd(FNBC)

### Tabela Local - Normalização feita até a 3ª Forma Normal (3NF)

**1ª Forma Normal (1FN):** Não existem atributos que são multivalorados, portanto além dos atributos serem atômicos, a tabela já estava na 1FN.

**2ª Forma Normal (2FN):** Como não existem chaves primárias compostas e os atributos comuns não dependem parcialmente de qualquer chave, a 2FN não se aplica a esta tabela.

**3ª Forma Normal (3FN):** A tabela está na 3FN, ja que os atributos comuns não dependem transitivamente de qualquer superchave.

Não existem dependências funcionais complementares mais, portanto não é necessário a 4ª Forma Normal (FN) e nem a Forma normal de Boyce-Codd(FNBC)

### Tabela Quadra - Normalização feita até a 3ª Forma Normal (3NF)

**1ª Forma Normal (1FN):** Não existem atributos que são multivalorados, portanto além dos atributos serem atômicos, a tabela já estava na 1FN. A chave primária é "**id**"

**2ª Forma Normal (2FN):** Como não existem chaves primárias compostas e os atributos comuns não dependem parcialmente de qualquer chave, a 2FN não se aplica a esta tabela.

**3ª Forma Normal (3FN):** A tabela está na 3FN, ja que os atributos comuns não dependem transitivamente de qualquer superchave.

Não existem dependências funcionais complementares mais, portanto não é necessário a 4ª Forma Normal (FN) e nem a Forma normal de Boyce-Codd(FNBC)

### Tabela NPC - Normalização feita até a 3ª Forma Normal (3NF)

**1ª Forma Normal (1FN):** Não existem atributos que são multivalorados, portanto além dos atributos serem atômicos,  a tabela já estava na 1FN. A chave primária é "**person_id**"

**2ª Forma Normal (2FN):** Como não existem chaves primárias compostas e os atributos comuns não dependem parcialmente de qualquer chave, a 2FN não se aplica a esta tabela.

**3ª Forma Normal (3FN):** A tabela está na 3FN, ja que os atributos comuns não dependem transitivamente de qualquer superchave.

Não existem dependências funcionais complementares mais, portanto não é necessário a 4ª Forma Normal (FN) e nem a Forma normal de Boyce-Codd(FNBC)

### Tabela PC - Normalização feita até a 3ª Forma Normal (3NF)

**1ª Forma Normal (1FN):** Não existem atributos que são multivalorados, portanto além dos atributos serem atômicos, a tabela já estava na 1FN. A chave primária é "**person_id**"

**2ª Forma Normal (2FN):** Como não existem chaves primárias compostas e os atributos comuns não dependem parcialmente de qualquer chave, a 2FN não se aplica a esta tabela.

**3ª Forma Normal (3FN):** A tabela está na 3FN, ja que os atributos comuns não dependem transitivamente de qualquer superchave.

Não existem dependências funcionais complementares mais, portanto não é necessário a 4ª Forma Normal (FN) e nem a Forma normal de Boyce-Codd(FNBC)

### Tabela Personagem - Normalização feita até a 3ª Forma Normal (3NF)

**1ª Forma Normal (1FN):** Não existem atributos que são multivalorados, portanto além dos atributos serem atômicos, a tabela já estava na 1FN. A chave primária é "**id**"

**2ª Forma Normal (2FN):** Como não existem chaves primárias compostas e os atributos comuns não dependem parcialmente de qualquer chave, a 2FN não se aplica a esta tabela.

**3ª Forma Normal (3FN):** A tabela está na 3FN, ja que os atributos comuns não dependem transitivamente de qualquer superchave.

Não existem dependências funcionais complementares mais, portanto não é necessário a 4ª Forma Normal (FN) e nem a Forma normal de Boyce-Codd(FNBC)

### Tabela Missão - Normalização feita até a 3ª Forma Normal (3NF)

**1ª Forma Normal (1FN):** Não existem atributos que são multivalorados, portanto além dos atributos serem atômicos, a tabela já estava na 1FN. A chave primária é "**id**"

**2ª Forma Normal (2FN):** Como não existem chaves primárias compostas e os atributos comuns não dependem parcialmente de qualquer chave, a 2FN não se aplica a esta tabela.

**3ª Forma Normal (3FN):** A tabela está na 3FN, ja que os atributos comuns não dependem transitivamente de qualquer superchave.

Não existem dependências funcionais complementares mais, portanto não é necessário a 4ª Forma Normal (FN) e nem a Forma normal de Boyce-Codd(FNBC)

### Tabela Habilidade - Normalização feita até a 3ª Forma Normal (3NF)

**1ª Forma Normal (1FN):** Não existem atributos que são multivalorados, portanto além dos atributos serem atômicos, a tabela já estava na 1FN. A chave primária é "**id**"

**2ª Forma Normal (2FN):** Como não existem chaves primárias compostas e os atributos comuns não dependem parcialmente de qualquer chave, a 2FN não se aplica a esta tabela.

**3ª Forma Normal (3FN):** A tabela está na 3FN, ja que os atributos comuns não dependem transitivamente de qualquer superchave.

Não existem dependências funcionais complementares mais, portanto não é necessário a 4ª Forma Normal (FN) e nem a Forma normal de Boyce-Codd(FNBC)

### Tabela Objetivo - Normalização feita até a 3ª Forma Normal (3NF)

**1ª Forma Normal (1FN):** Não existem atributos que são multivalorados, portanto além dos atributos serem atômicos, a tabela já estava na 1FN. A chave primária é "**id**"

**2ª Forma Normal (2FN):** Como não existem chaves primárias compostas e os atributos comuns não dependem parcialmente de qualquer chave, a 2FN não se aplica a esta tabela.

**3ª Forma Normal (3FN):** A tabela está na 3FN, ja que os atributos comuns não dependem transitivamente de qualquer superchave.

Não existem dependências funcionais complementares mais, portanto não é necessário a 4ª Forma Normal (FN) e nem a Forma normal de Boyce-Codd(FNBC)

### Tabela Dialogo - Normalização feita até a 3ª Forma Normal (3NF)

**1ª Forma Normal (1FN):** Não existem atributos que são multivalorados, portanto além dos atributos serem atômicos, a tabela já estava na 1FN. A chave primária é "**id**"

**2ª Forma Normal (2FN):** Como não existem chaves primárias compostas e os atributos comuns não dependem parcialmente de qualquer chave, a 2FN não se aplica a esta tabela.

**3ª Forma Normal (3FN):** A tabela está na 3FN, ja que os atributos comuns não dependem transitivamente de qualquer superchave.

Não existem dependências funcionais complementares mais, portanto não é necessário a 4ª Forma Normal (FN) e nem a Forma normal de Boyce-Codd(FNBC)

### Tabela Inimigo - Normalização feita até a 3ª Forma Normal (3NF)

**1ª Forma Normal (1FN):** Não existem atributos que são multivalorados, portanto além dos atributos serem atômicos, a tabela já estava na 1FN. A chave primária é "**id**"

**2ª Forma Normal (2FN):** Existem chaves primárias compostas, porém os atributos comuns não dependem parcialmente de qualquer chave, a 2FN não se aplica a esta tabela.

**3ª Forma Normal (3FN):** A tabela está na 3FN, ja que os atributos comuns não dependem transitivamente de qualquer superchave.

Não existem dependências funcionais complementares mais, portanto não é necessário a 4ª Forma Normal (FN) e nem a Forma normal de Boyce-Codd(FNBC)

### Tabela Efeito - Normalização feita até a 3ª Forma Normal (3NF)

**1ª Forma Normal (1FN):** Não existem atributos que são multivalorados, portanto além dos atributos serem atômicos, a tabela já estava na 1FN. A chave primária é "**id**"

**2ª Forma Normal (2FN):** Como não existem chaves primárias compostas e os atributos comuns não dependem parcialmente de qualquer chave, a 2FN não se aplica a esta tabela.

**3ª Forma Normal (3FN):** A tabela está na 3FN, ja que os atributos comuns não dependem transitivamente de qualquer superchave.

Não existem dependências funcionais complementares mais, portanto não é necessário a 4ª Forma Normal (FN) e nem a Forma normal de Boyce-Codd(FNBC)

### Tabela Equipamento - Normalização feita até a 3ª Forma Normal (3NF)

**1ª Forma Normal (1FN):** Não existem atributos que são multivalorados, portanto além dos atributos serem atômicos, a tabela já estava na 1FN. A chave primária é "**id**"

**2ª Forma Normal (2FN):** Como não existem chaves primárias compostas e os atributos comuns não dependem parcialmente de qualquer chave, a 2FN não se aplica a esta tabela.

**3ª Forma Normal (3FN):** A tabela está na 3FN, ja que os atributos comuns não dependem transitivamente de qualquer superchave.

Não existem dependências funcionais complementares mais, portanto não é necessário a 4ª Forma Normal (FN) e nem a Forma normal de Boyce-Codd(FNBC)

### Tabela equip_tem_efeito - Normalização feita até a 3ª Forma Normal (3NF)

**1ª Forma Normal (1FN):** Não existem atributos que são multivalorados, portanto além dos atributos serem atômicos, a tabela já estava na 1FN. A chave primária é "**equip_id**"

**2ª Forma Normal (2FN):** Existem chaves primárias compostas, porém os atributos comuns não dependem parcialmente de qualquer chave, a 2FN não se aplica a esta tabela.

**3ª Forma Normal (3FN):** A tabela está na 3FN, ja que os atributos comuns não dependem transitivamente de qualquer superchave.

Não existem dependências funcionais complementares mais, portanto não é necessário a 4ª Forma Normal (FN) e nem a Forma normal de Boyce-Codd(FNBC)

### Tabela Evidência - Normalização feita até a 3ª Forma Normal (3NF)

**1ª Forma Normal (1FN):** Não existem atributos que são multivalorados, portanto além dos atributos serem atômicos, a tabela já estava na 1FN. A chave primária é "**id**"

**2ª Forma Normal (2FN):** Como não existem chaves primárias compostas e os atributos comuns não dependem parcialmente de qualquer chave, a 2FN não se aplica a esta tabela.

**3ª Forma Normal (3FN):** A tabela está na 3FN, ja que os atributos comuns não dependem transitivamente de qualquer superchave.

Não existem dependências funcionais complementares mais, portanto não é necessário a 4ª Forma Normal (FN) e nem a Forma normal de Boyce-Codd(FNBC)

### Tabela Veiculo  - Normalização feita até a 3ª Forma Normal (3NF)

**1ª Forma Normal (1FN):** Não existem atributos que são multivalorados, portanto além dos atributos serem atômicos, a tabela já estava na 1FN. A chave primária é "**id**"

**2ª Forma Normal (2FN):** Como não existem chaves primárias compostas e os atributos comuns não dependem parcialmente de qualquer chave, a 2FN não se aplica a esta tabela.

**3ª Forma Normal (3FN):** A tabela está na 3FN, ja que os atributos comuns não dependem transitivamente de qualquer superchave.

Não existem dependências funcionais complementares mais, portanto não é necessário a 4ª Forma Normal (FN) e nem a Forma normal de Boyce-Codd(FNBC)

### Tabela PC_melhora_equip  - Normalização feita até a 3ª Forma Normal (3NF)

**1ª Forma Normal (1FN):** Não existem atributos que são multivalorados, portanto além dos atributos serem atômicos, a tabela já estava na 1FN. A chave primária é "**PC_id**" e "**equip_id**"

**2ª Forma Normal (2FN):** Existem chaves primárias compostas, porém os atributos comuns não dependem parcialmente de qualquer chave, a 2FN não se aplica a esta tabela.

**3ª Forma Normal (3FN):** A tabela está na 3FN, ja que os atributos comuns não dependem transitivamente de qualquer superchave.

Não existem dependências funcionais complementares mais, portanto não é necessário a 4ª Forma Normal (FN) e nem a Forma normal de Boyce-Codd(FNBC)

### Tabela pre_requisito - Normalização feita até a 3ª Forma Normal (3NF)

**1ª Forma Normal (1FN):** Não existem atributos que são multivalorados, portanto além dos atributos serem atômicos, a tabela já estava na 1FN. A chave primária é "**missao_id**" "**missao_pre_req_id**""

**2ª Forma Normal (2FN):** Existem chaves primárias compostas, porém os atributos comuns não dependem parcialmente de qualquer chave, a 2FN não se aplica a esta tabela.

**3ª Forma Normal (3FN):** A tabela está na 3FN, ja que os atributos comuns não dependem transitivamente de qualquer superchave.

Não existem dependências funcionais complementares mais, portanto não é necessário a 4ª Forma Normal (FN) e nem a Forma normal de Boyce-Codd(FNBC)

### desbloqueia_equip  - Normalização feita até a 3ª Forma Normal (3NF)

**1ª Forma Normal (1FN):** Não existem atributos que são multivalorados, portanto além dos atributos serem atômicos, a tabela já estava na 1FN. A chave primária é "**missao_id**" e "**equip_id**"

**2ª Forma Normal (2FN):** Existem chaves primárias compostas, porém os atributos comuns não dependem parcialmente de qualquer chave, a 2FN não se aplica a esta tabela.

**3ª Forma Normal (3FN):** A tabela está na 3FN, ja que os atributos comuns não dependem transitivamente de qualquer superchave.

Não existem dependências funcionais complementares mais, portanto não é necessário a 4ª Forma Normal (FN) e nem a Forma normal de Boyce-Codd(FNBC)

### Tabela cumpre_missao  - Normalização feita até a 3ª Forma Normal (3NF)

**1ª Forma Normal (1FN):** Não existem atributos que são multivalorados, portanto além dos atributos serem atômicos, a tabela já estava na 1FN. A chave primária é "**PC_id**" e "**missao_id**"

**2ª Forma Normal (2FN):** Existem chaves primárias compostas, porém os atributos comuns não dependem parcialmente de qualquer chave, a 2FN não se aplica a esta tabela.

**3ª Forma Normal (3FN):** A tabela está na 3FN, ja que os atributos comuns não dependem transitivamente de qualquer superchave.

Não existem dependências funcionais complementares mais, portanto não é necessário a 4ª Forma Normal (FN) e nem a Forma normal de Boyce-Codd(FNBC)

### Tabela veic_possui_hab  - Normalização feita até a 3ª Forma Normal (3NF)

**1ª Forma Normal (1FN):** Não existem atributos que são multivalorados, portanto além dos atributos serem atômicos, a tabela já estava na 1FN. A chave primária é "**veic_id**" e "**hab_id**"

**2ª Forma Normal (2FN):** Existem chaves primárias compostas, porém os atributos comuns não dependem parcialmente de qualquer chave, a 2FN não se aplica a esta tabela.

**3ª Forma Normal (3FN):** A tabela está na 3FN, ja que os atributos comuns não dependem transitivamente de qualquer superchave.

Não existem dependências funcionais complementares mais, portanto não é necessário a 4ª Forma Normal (FN) e nem a Forma normal de Boyce-Codd(FNBC)

### Tabela libera_missao  - Normalização feita até a 3ª Forma Normal (3NF)

**1ª Forma Normal (1FN):** Não existem atributos que são multivalorados, portanto além dos atributos serem atômicos, a tabela já estava na 1FN. A chave primária é "**missao_id**" e "**dial_id**"

**2ª Forma Normal (2FN):** Existem chaves primárias compostas, porém os atributos comuns não dependem parcialmente de qualquer chave, a 2FN não se aplica a esta tabela.

**3ª Forma Normal (3FN):** A tabela está na 3FN, ja que os atributos comuns não dependem transitivamente de qualquer superchave.

Não existem dependências funcionais complementares mais, portanto não é necessário a 4ª Forma Normal (FN) e nem a Forma normal de Boyce-Codd(FNBC)

## Histórico de versões

| Versão |    Data    | Descrição                | Autor                                                                                                                 |
| :----: | :--------: | ------------------------ | --------------------------------------------------------------------------------------------------------------------- |
| `1.0`  | 29/10/2023 | Criação do documento de Normalização |  [Luis Miranda](https://github.com/LuisMiranda10)    |
| `1.1`  | 08/12/2023 | Atualização da Normalização |  [Luis Miranda](https://github.com/LuisMiranda10)    |