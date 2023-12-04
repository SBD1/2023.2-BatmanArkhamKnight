CREATE TABLE IF NOT EXISTS public.Mapa(
    id integer PRIMARY KEY,
    nome char(48) FOREIGN KEY,
    total_pts integer NOT NULL,
    tamanho_x integer NOT NULL,
    tamanho_y integer NOT NULL,
    CONSTRAINT id_PK PRIMARY KEY (id)
);


CREATE TABLE IF NOT EXISTS public.Regiao(
    id integer PRIMARY KEY,
    mapa_id integer FOREIGN KEY,
    nome char(24) NOT NULL,
    CONSTRAINT id_PK PRIMARY KEY (id),
    CONSTRAINT mapaid_FK FOREIGN KEY (mapa_id)
        REFERENCES public.Mapa (id)
);

CREATE TABLE IF NOT EXISTS public.Local(
    id integer PRIMARY KEY,
    regiao_id integer FOREIGN KEY,
    acesso integer NOT NULL, 
    origem_x integer NOT NULL,
    origem_y integer NOT NULL,
    CONSTRAINT local_PK PRIMARY KEY (id),
    CONSTRAINT regiao_FK FOREIGN KEY (regiao_id)
        REFERENCES public.Regiao (id)
);

CREATE TABLE IF NOT EXISTS public.Quadra(
    id integer PRIMARY KEY,
    local_id integer FOREIGN KEY,
    escalavel boolean NOT NULL,
    coord_x integer NOT NULL,
    cood_y integer NOT NULL,
    CONSTRAINT id_PK PRIMARY KEY (id),
    CONSTRAINT localid_FK FOREIGN KEY (local_id)
        REFERENCES public.Local (id)
);

CREATE TABLE IF NOT EXISTS public.Evidencia(
    id integer PRIMARY KEY,
    objet_id integer FOREIGN KEY,
    quadra_id integer FOREIGN KEY,
    local_id integer FOREIGN KEY,
    aparencia char(48) NOT NULL,
    analise char(64) NOT NULL,
    CONSTRAINT id_PK PRIMARY KEY (id),
    CONSTRAINT objet_FK FOREIGN KEY (objet_id)  
        REFERENCES public.Objetivo (id),
    CONSTRAINT quadra_FK FOREIGN KEY (quadra_id)
        REFERENCES public.Quadra (id),
    CONSTRAINT local_FK FOREIGN KEY (local_id)
        REFERENCES public.Local (id),
);

CREATE TABLE IF NOT EXISTS public.Objetivo(
    id integer PRIMARY KEY,
    local_id integer FOREIGN KEY,
    missao_id integer FOREIGN KEY,
    status integer NOT NULL,
    CONSTRAINT id_PK PRIMARY KEY (id),
    CONSTRAINT local_FK FOREIGN KEY (local_id)
     REFERENCES public.Local (id) MATCH SIMPLE,
    CONSTRAINT missao_FK FOREIGN KEY (missao_id)
        REFERENCES public.Missao (id) MATCH SIMPLE
);

CREATE TABLE IF NOT EXISTS public.Missao(
    id integer PRIMARY KEY,
    nome char(32) NOT NULL,
    descr VARCHAR(256) NOT NULL,
    pontos INTEGER NOT NULL,
    NPC_id INTEGER FOREIGN KEY, 
    CONSTRAINT id_PK PRIMARY KEY (id),
    CONSTRAINT NPCid_FK FOREIGN KEY (NPC_id)
        REFERENCES public.NPC (person_id)
);

CREATE TABLE IF NOT EXISTS public.Dialogo(
    id integer PRIMARY KEY,
    NPC_id integer FOREIGN KEY,
    dial_texto varchar(512) NOT NULL,
    dial_numero integer NOT NULL,
    dial_falado boolean NOT NULL,
    CONSTRAINT id_PK PRIMARY KEY (id),
    CONSTRAINT NPC_fk FOREIGN KEY (NPC_id)
        REFERENCES public.NPC (person_id)
);

CREATE TABLE IF NOT EXISTS public.Inimigo(
    NPC_id integer,
    nome_real char(32) PRIMARY KEY,
    agressividade integer NOT NULL,
    CONSTRAINT id_PK PRIMARY KEY (id),
    CONSTRAINT nomeReal_PK PRIMARY KEY (nome_real),
    CONSTRAINT id_FK FOREIGN KEY (id)
        REFERENCES public.NPC (person_id)
);

CREATE TABLE IF NOT EXISTS public.NPC(
    person_id integer PRIMARY KEY,
    quadra_id integer FOREIGN KEY,
    veic_id integer FOREIGN KEY,
    nome char(32) NOT NULL,
    HP integer NOT NULL,
    ATK integer NOT NULL,
    DEF integer NOT NULL,
    Descr varchar(512) NOT NULL,
    NPC_foco integer NOT NULL,
    CONSTRAINT id_PK PRIMARY KEY (person_id),
    CONSTRAINT quadra_FK FOREIGN KEY (quadra_id)
        REFERENCES public.Quadra (id),
    CONSTRAINT veic_FK FOREIGN KEY (veic_id)
        REFERENCES public.Veiculo (id)
);

CREATE TABLE IF NOT EXISTS public.PC(
    person_id integer PRIMARY KEY,
    NPC_alvo integer FOREIGN KEY,
    HP integer NOT NULL,
    ATK INTEGER NOT NULL, 
    DEF INTEGER NOT NULL,
    XP INTEGER NOT NULL,
    furtividade INTEGER NOT NULL,
    espaco INTEGER NOT NULL,
    quadra_id INTEGER FOREIGN KEY,
    veic_id INTEGER FOREIGN KEY,
    descr VARCHAR(514) NOT NULL,
    CONSTRAINT personId_PK PRIMARY KEY (person_id),
    CONSTRAINT NPCalvo_FK FOREIGN KEY (NPC_alvo)
        REFERENCES public.NPC (person_id),
    CONSTRAINT quadraId_FK FOREIGN KEY (quadra_id)
        REFERENCES public.Quadra (id),
    CONSTRAINT veicId_FK FOREIGN KEY (veic_id)
        REFERENCES public.Veiculo (id),
);

CREATE TABLE IF NOT EXISTS public.Veiculo(
    id integer PRIMARY KEY,
    local_id integer FOREIGN KEY,
    HP INTEGER NOT NULL,
    VEL INTEGER NOT NULL,
    nome char(32) NOT NULL,
    CONSTRAINT id_PK PRIMARY KEY (id),
    CONSTRAINT localId_fk FOREIGN KEY (local_id)
        REFERENCES public.Local (id)
);

CREATE TABLE IF NOT EXISTS public.Personagem(
    id integer FOREIGN KEY,
    tipo integer NOT NULL,
    CONSTRAINT id_PK PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.Habilidade(
    id integer PRIMARY KEY,
    nome CHAR(32) NOT NULL,
    descr CHAR(128) NOT NULL,
    alcance INTEGER NOT NULL,
    CONSTRAINT id_PK PRIMARY KEY (id)
);


CREATE TABLE IF NOT EXISTS public.veic_possui_hab(
    veic_id integer,
    hab_id integer,
    CONSTRAINT veicId_PK PRIMARY KEY (veic_id),
    CONSTRAINT habId_PK PRIMARY KEY (hab_id),
    CONSTRAINT veicId_fk FOREIGN KEY (veic_id)
        REFERENCES public.Veiculo (id),
    CONSTRAINT habId_fk FOREIGN KEY (hab_id)
        REFERENCES public.Habilidade (id)
);

CREATE TABLE IF NOT EXISTS public.Equipamento(
    id integer PRIMARY KEY,
    nome CHAR(32) NOT NULL,
    descr CHAR(128) NOT NULL,
    preco INTEGER NOT NULL,
    CONSTRAINT id_PK PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.Efeito(
    id integer PRIMARY KEY,
    nome INTEGER NOT NULL,
    CONSTRAINT id_PK PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.pre_requisito(
    missao_id INTEGER,
    missao_pre_req_id INTEGER,
    CONSTRAINT missaoId_PK PRIMARY KEY (missao_id),
    CONSTRAINT missaoPreReqId_PK PRIMARY KEY (missao_pre_req_id),
    CONSTRAINT missaoId_FK FOREIGN KEY (missao_id)
        REFERENCES public.Missao (id),
    CONSTRAINT missaoPreReqId_fk FOREIGN KEY (missao_pre_req_id)
        REFERENCES public.Missao (id)
);

CREATE TABLE IF NOT EXISTS public.cumpre_missao(
    PC_id INTEGER,
    missao_id INTEGER,
    status INTEGER NOT NULL,
    CONSTRAINT PCid_PK PRIMARY KEY (PC_id),
    CONSTRAINT missaoId_PK PRIMARY KEY (missao_id),
    CONSTRAINT PCid_FK FOREIGN KEY (PC_id)
        REFERENCES public.PC (id),
    CONSTRAINT missaoId_fk FOREIGN KEY (missao_id)
        REFERENCES public.Missao (id)
);

CREATE TABLE IF NOT EXISTS public.desbloqueia_equip(
    missao_id INTEGER,
    equip_id INTEGER,
    CONSTRAINT equipId_PK PRIMARY KEY (equip_id),
    CONSTRAINT missaoId_PK PRIMARY KEY (missao_id),
    CONSTRAINT equipId_FK FOREIGN KEY (equip_id)
        REFERENCES public.Equipamento (id),
    CONSTRAINT missaoId_fk FOREIGN KEY (missao_id)
        REFERENCES public.Missao (id)
);

CREATE TABLE IF NOT EXISTS public.libera_missao(
    missao_id INTEGER,
    dial_id INTEGER,
    CONSTRAINT missaoId_fk FOREIGN KEY (missao_id)
        REFERENCES public.Missao (id),
    CONSTRAINT dialId_FK FOREIGN KEY (dial_id)
        REFERENCES public.Dialogo (id)
);

CREATE TABLE IF NOT EXISTS public.guarda_dialogo(
    PC_id INTEGER,
    dial_id INTEGER,
    CONSTRAINT PCid_PK PRIMARY KEY (PC_id),
    CONSTRAINT dialId_PK PRIMARY KEY (dial_id),
    CONSTRAINT PCid_FK FOREIGN KEY (PC_id)
        REFERENCES public.PC (id),
    CONSTRAINT missaoId_fk FOREIGN KEY (dial_id)
        REFERENCES public.Dialogo (id)
);

CREATE TABLE IF NOT EXISTS public.combate(
    PC_id INTEGER,
    NPC_id INTEGER,
    distancia INTEGER NOT NULL,
    CONSTRAINT PCid_PK PRIMARY KEY (PC_id),
    CONSTRAINT NPCid_PK PRIMARY KEY (NPC_id),
    CONSTRAINT PCid_FK FOREIGN KEY (PC_id)
        REFERENCES public.PC (id),
    CONSTRAINT NPCid_fk FOREIGN KEY (NPC_id)
        REFERENCES public.NPC (id)
);

CREATE TABLE IF NOT EXISTS public.PC_melhora_equip(
    PC_id INTEGER,
    equip_id INTEGER,
    preco INTEGER NOT NULL,
    CONSTRAINT PCid_PK PRIMARY KEY (PC_id),
    CONSTRAINT equipId_PK PRIMARY KEY (equip_id),
    CONSTRAINT PCid_FK FOREIGN KEY (PC_id)
        REFERENCES public.PC (id),
    CONSTRAINT equipId_FK FOREIGN KEY (equip_id)
        REFERENCES public.Equipamento (id)
);

CREATE TABLE IF NOT EXISTS public.pc_equipa(
    PC_id INTEGER,
    equip_id INTEGER,
    CONSTRAINT PCid_PK PRIMARY KEY (PC_id),
    CONSTRAINT equipId_PK PRIMARY KEY (equip_id),
    CONSTRAINT PCid_FK FOREIGN KEY (PC_id)
        REFERENCES public.PC (id),
    CONSTRAINT equipId_FK FOREIGN KEY (equip_id)
        REFERENCES public.Equipamento (id)
);

CREATE TABLE IF NOT EXISTS public.pers_possui_hab(
    person_id INTEGER,
    hab_id INTEGER,
    CONSTRAINT personId_PK PRIMARY KEY (person_id),
    CONSTRAINT habId_PK PRIMARY KEY (hab_id),
    CONSTRAINT personId_FK FOREIGN KEY (person_id)
        REFERENCES public.Personagem (id),
    CONSTRAINT habId_FK FOREIGN KEY (hab_id)
        REFERENCES public.Habilidade (id)
);

CREATE TABLE IF NOT EXISTS public.equip_tem_efeito(
    equip_id INTEGER,
    efeito_id INTEGER,
    CONSTRAINT equipId_PK PRIMARY KEY (equip_id),
    CONSTRAINT efeitoId_PK PRIMARY KEY (efeito_id),
    CONSTRAINT equipId_FK FOREIGN KEY (equip_id)
        REFERENCES public.Equipamento (id),
    CONSTRAINT efeitoId_FK FOREIGN KEY (efeito_id)
        REFERENCES public.Efeito (id)
);