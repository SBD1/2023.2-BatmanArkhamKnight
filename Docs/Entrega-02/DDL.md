# Data Definition Language

## Introdução
DDL ( Data Definition Language ) são os comandos que interagem com os objetos do banco.
Abaixo segue a criação das tables com código SQL para o jogo do Batman Arkham Knight:  
  
```
CREATE TABLE IF NOT EXISTS public.Mapa(
    id SERIAL PRIMARY KEY,
    nome CHAR(48) NOT NULL,
    total_pts INTEGER NOT NULL,
    tamanho_x INTEGER NOT NULL,
    tamanho_y INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS public.Regiao(
    id SERIAL PRIMARY KEY,
    mapa_id INTEGER REFERENCES public.Mapa (id),
    nome CHAR(24) NOT NULL
);

CREATE TABLE IF NOT EXISTS public.Local(
    id SERIAL PRIMARY KEY,
    regiao_id INTEGER REFERENCES public.Regiao (id),
    acesso INTEGER NOT NULL, 
    origem_x INTEGER NOT NULL,
    origem_y INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS public.Quadra(
    id SERIAL PRIMARY KEY,
    local_id INTEGER REFERENCES public.Local (id),
    escalavel BOOLEAN NOT NULL,
    coord_x INTEGER NOT NULL,
    coord_y INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS public.Habilidade(
    id SERIAL PRIMARY KEY,
    nome CHAR(32) NOT NULL,
    descr CHAR(128) NOT NULL,
    alcance INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS public.Veiculo(
    id SERIAL PRIMARY KEY,
    local_id INTEGER REFERENCES public.Local (id),
    HP INTEGER NOT NULL,
    VEL INTEGER NOT NULL,
    nome CHAR(32) NOT NULL
);

CREATE TABLE IF NOT EXISTS public.Efeito(
    id SERIAL PRIMARY KEY,
    nome INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS public.Equipamento(
    id SERIAL PRIMARY KEY,
    nome CHAR(32) NOT NULL,
    descr CHAR(128) NOT NULL,
    preco INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS public.Personagem(
    id SERIAL PRIMARY KEY,
    tipo INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS public.NPC(
    person_id SERIAL PRIMARY KEY,
    quadra_id INTEGER REFERENCES public.Quadra (id),
    veic_id INTEGER REFERENCES public.Veiculo (id),
    nome CHAR(32) NOT NULL,
    HP INTEGER NOT NULL,
    ATK INTEGER NOT NULL,
    DEF INTEGER NOT NULL,
    Descr VARCHAR(512) NOT NULL,
    NPC_foco INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS public.PC(
    person_id SERIAL PRIMARY KEY,
    NPC_alvo INTEGER REFERENCES public.NPC (person_id),
    HP INTEGER NOT NULL,
    ATK INTEGER NOT NULL, 
    DEF INTEGER NOT NULL,
    XP INTEGER NOT NULL,
    furtividade INTEGER NOT NULL,
    espaco INTEGER NOT NULL,
    quadra_id INTEGER REFERENCES public.Quadra (id),
    veic_id INTEGER REFERENCES public.Veiculo (id),
    descr VARCHAR(514) NOT NULL
);

CREATE TABLE IF NOT EXISTS public.Missao(
    id SERIAL PRIMARY KEY,
    nome CHAR(32) NOT NULL,
    descr VARCHAR(256) NOT NULL,
    pontos INTEGER NOT NULL,
    NPC_id INTEGER REFERENCES public.NPC (person_id)
);

CREATE TABLE IF NOT EXISTS public.Objetivo(
    id SERIAL PRIMARY KEY,
    local_id INTEGER REFERENCES public.Local (id),
    missao_id INTEGER REFERENCES public.Missao (id),
    status INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS public.Dialogo(
    id SERIAL PRIMARY KEY,
    NPC_id INTEGER REFERENCES public.NPC (person_id),
    dial_texto VARCHAR(512) NOT NULL,
    dial_numero INTEGER NOT NULL,
    dial_falado BOOLEAN NOT NULL
);

CREATE TABLE IF NOT EXISTS public.Inimigo(
    NPC_id INTEGER PRIMARY KEY REFERENCES public.NPC (person_id),
    nome_real CHAR(32),
    agressividade INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS public.veic_possui_hab(
    veic_id INTEGER REFERENCES public.Veiculo (id),
    hab_id INTEGER REFERENCES public.Habilidade (id),
    PRIMARY KEY (veic_id, hab_id)
);

CREATE TABLE IF NOT EXISTS public.PC_melhora_equip(
    PC_id INTEGER REFERENCES public.PC (person_id),
    equip_id INTEGER REFERENCES public.Equipamento (id),
    preco INTEGER NOT NULL,
    PRIMARY KEY (PC_id, equip_id)
);

CREATE TABLE IF NOT EXISTS public.pc_equipa(
    PC_id INTEGER REFERENCES public.PC (person_id),
    equip_id INTEGER REFERENCES public.Equipamento (id),
    PRIMARY KEY (PC_id, equip_id)
);

CREATE TABLE IF NOT EXISTS public.pers_possui_hab(
    person_id INTEGER REFERENCES public.Personagem (id),
    hab_id INTEGER REFERENCES public.Habilidade (id),
    PRIMARY KEY (person_id, hab_id)
);

CREATE TABLE IF NOT EXISTS public.equip_tem_efeito(
    equip_id INTEGER REFERENCES public.Equipamento (id),
    efeito_id INTEGER REFERENCES public.Efeito (id),
    PRIMARY KEY (equip_id, efeito_id)
);

CREATE TABLE IF NOT EXISTS public.pre_requisito(
    missao_id INTEGER REFERENCES public.Missao (id),
    missao_pre_req_id INTEGER REFERENCES public.Missao (id),
    PRIMARY KEY (missao_id, missao_pre_req_id)
);

CREATE TABLE IF NOT EXISTS public.cumpre_missao(
    PC_id INTEGER REFERENCES public.PC (person_id),
    missao_id INTEGER REFERENCES public.Missao (id),
    status INTEGER NOT NULL,
    PRIMARY KEY (PC_id, missao_id)
);

CREATE TABLE IF NOT EXISTS public.desbloqueia_equip(
    missao_id INTEGER REFERENCES public.Missao (id),
    equip_id INTEGER REFERENCES public.Equipamento (id),
    PRIMARY KEY (missao_id, equip_id)
);

CREATE TABLE IF NOT EXISTS public.libera_missao(
    missao_id INTEGER REFERENCES public.Missao (id),
    dial_id INTEGER REFERENCES public.Dialogo (id),
    PRIMARY KEY (missao_id, dial_id)
);

CREATE TABLE IF NOT EXISTS public.guarda_dialogo(
    PC_id INTEGER REFERENCES public.PC (person_id),
    dial_id INTEGER REFERENCES public.Dialogo (id),
    PRIMARY KEY (PC_id, dial_id)
);

CREATE TABLE IF NOT EXISTS public.combate(
    PC_id INTEGER REFERENCES public.PC (person_id),
    NPC_id INTEGER REFERENCES public.NPC (person_id),
    distancia INTEGER NOT NULL,
    PRIMARY KEY (PC_id, NPC_id)
);

```

## Histórico de versões

| Versão |    Data    | Descrição                | Autor                                                                                                                 |
| :----: | :--------: | ------------------------ | --------------------------------------------------------------------------------------------------------------------- |
| `1.0`  | 29/10/2023 | Criação do documento DDL | [Nicolas Bomfim](https://github.com/NickGehjk) e  [Luis Miranda](https://github.com/LuisMiranda10)                                                                       |
