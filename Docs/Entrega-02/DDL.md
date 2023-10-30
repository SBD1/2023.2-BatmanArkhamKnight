# Data Definition Language

## Introdução
DDL ( Data Definition Language ) são os comandos que interagem com os objetos do banco.
Abaixo segue a criação das tables com código SQL para o jogo do Batman Arkham Knight:  
  
```
CREATE TABLE IF NOT EXISTS public.Gotham(
    gotham_id integer NOT NULL,
    CONSTRAINT gotham_pkey PRIMARY KEY (gotham_id)
);


CREATE TABLE IF NOT EXISTS public.Regiao(
    regiao_id integer NOT NULL,
    regiao_nome character varying(20) COLLATE pg_catalog."default" NOT NULL,
    gotham_atual integer NOT NULL,
    CONSTRAINT regiao_pk PRIMARY KEY (regiao_id),
    CONSTRAINT reg_fk FOREIGN KEY (gotham_atual)
        REFERENCES public.gotham (gotham_id) MATCH SIMPLE
);

CREATE TABLE IF NOT EXISTS public.Viagem(
    viagem_origem integer NOT NULL,
    viagem_destino integer NOT NULL,
    CONSTRAINT viagemorigem_fk FOREIGN KEY (viagem_origem)  
        REFERENCES public.regiao (regiao_id) MATCH SIMPLE,
    CONSTRAINT viagemdestino_fk FOREIGN KEY (viagem_destino)
        REFERENCES public.regiao (regiao_id) MATCH SIMPLE
);

CREATE TABLE IF NOT EXISTS public.Local(
    local_id integer NOT NULL,
    regiao_atual integer NOT NULL,
    coordenada_x integer,
    coordenada_y integer,
    CONSTRAINT local_pk PRIMARY KEY (local_id),
    CONSTRAINT local_fk FOREIGN KEY (regiao_atual)
        REFERENCES public.regiao (regiao_id) MATCH SIMPLE
);


CREATE TABLE IF NOT EXISTS public.Pc(
    personagem_id integer NOT NULL,
    local_id integer NOT NULL,
    nome character varying COLLATE pg_catalog."default" NOT NULL,
    hp integer NOT NULL,
    CONSTRAINT pc_pk PRIMARY KEY (personagem_id),
    CONSTRAINT pc_fk FOREIGN KEY (local_id)
        REFERENCES public.local (local_id) MATCH SIMPLE
);


CREATE TABLE IF NOT EXISTS public.Npc(
    npc_id integer NOT NULL,
    local_id integer NOT NULL,
    npc_tipo character varying(20) COLLATE pg_catalog."default" NOT NULL,
    situacao_vida character varying(20) COLLATE pg_catalog."default" DEFAULT 'Vivo'::character varying,
    CONSTRAINT npc_pk PRIMARY KEY (npc_id),
    CONSTRAINT npc_fk FOREIGN KEY (local_id)
        REFERENCES public.local (local_id) MATCH SIMPLE
);


CREATE TABLE IF NOT EXISTS public.Instancia(
    instancia_id integer NOT NULL,
    npc_id integer NOT NULL,
    nivel_dificuldade character varying(20) COLLATE pg_catalog."default" DEFAULT 1,
    CONSTRAINT instancia_pk PRIMARY KEY (instancia_id),
    CONSTRAINT instancia_fk FOREIGN KEY (npc_id)
        REFERENCES public.npc (npc_id) MATCH SIMPLE
);


CREATE TABLE IF NOT EXISTS public.Vilao(
    vilao_id integer NOT NULL,
    npc_id integer NOT NULL,
    nome_vilao character varying(20) COLLATE pg_catalog."default" NOT NULL,
    inteligencia integer DEFAULT 20,
    forca integer DEFAULT 20,
    CONSTRAINT vilao_pk PRIMARY KEY (vilao_id),
    CONSTRAINT vilao_fk FOREIGN KEY (npc_id)
        REFERENCES public.npc (npc_id) MATCH SIMPLE
);
	

CREATE TABLE IF NOT EXISTS public.Missao(
    missao_id integer NOT NULL,
    personagem_id integer NOT NULL,
    nome_missao character varying(20) COLLATE pg_catalog."default" NOT NULL,
    descricao character varying(20) COLLATE pg_catalog."default" NOT NULL,
    situacao character varying(20) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT missao_pk PRIMARY KEY (missao_id),
    CONSTRAINT missao_fk FOREIGN KEY (personagem_id)
        REFERENCES public.pc (personagem_id) MATCH SIMPLE
);

CREATE TABLE IF NOT EXISTS public.Prerequisito(
    requisito integer NOT NULL,
    possuiPreReq integer NOT NULL,
    CONSTRAINT viagemorigem_fk FOREIGN KEY (requisito)  
        REFERENCES public.missao (missao_id) MATCH SIMPLE,
    CONSTRAINT viagemdestino_fk FOREIGN KEY (possuiPreReq)
        REFERENCES public.missao (missao_id) MATCH SIMPLE
);

CREATE TABLE IF NOT EXISTS public.Veiculo(
    veiculo_id integer NOT NULL,
    personagem_id integer NOT NULL,
    nome_veiculo character varying(20) COLLATE pg_catalog."default" NOT NULL,
    tipo_veiculo character varying(20) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT veiculo_pk PRIMARY KEY (veiculo_id),
    CONSTRAINT veiculo_fk FOREIGN KEY (personagem_id)
        REFERENCES public.pc (personagem_id) MATCH SIMPLE
);


CREATE TABLE IF NOT EXISTS public.Terrestre(
    veicterrestre_id integer NOT NULL,
    veiculo_id integer NOT NULL,
    CONSTRAINT veicterrestre_pk PRIMARY KEY (veicterrestre_id),
    CONSTRAINT veicterrestre_fk FOREIGN KEY (veiculo_id)
        REFERENCES public.veiculo (veiculo_id) MATCH SIMPLE
);


CREATE TABLE IF NOT EXISTS public.Aquatico(
    veicaquatico_id integer NOT NULL,
    veiculo_id integer NOT NULL,
    CONSTRAINT veicaquatico_pk PRIMARY KEY (veicaquatico_id),
    CONSTRAINT veicaquatico_fk FOREIGN KEY (veiculo_id)
        REFERENCES public.veiculo (veiculo_id) MATCH SIMPLE
);


CREATE TABLE IF NOT EXISTS public.Aereo(
    veicaereo_id integer NOT NULL,
    veiculo_id integer NOT NULL,
    CONSTRAINT veicaereo_pk PRIMARY KEY (veicaereo_id),
    CONSTRAINT veicaereo_fk FOREIGN KEY (veiculo_id)
        REFERENCES public.veiculo (veiculo_id) MATCH SIMPLE
);

CREATE TABLE IF NOT EXISTS public.Equipamento(
    equip_id integer NOT NULL,
    tipo_equipamento character varying(20) COLLATE pg_catalog."default" NOT NULL,
    nome_equipamento character varying(20) COLLATE pg_catalog."default" NOT NULL,
    nivel integer NOT NULL,
    descricao character varying(55) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT equip_pk PRIMARY KEY (equip_id)
);

CREATE TABLE IF NOT EXISTS public.Pcequip(
    personagem_id integer NOT NULL,
    equip_id integer NOT NULL,
    level integer NOT NULL,
    CONSTRAINT pcequipequi_fk FOREIGN KEY (equip_id)
        REFERENCES public.equipamento (equip_id) MATCH SIMPLE,
    CONSTRAINT pcquipper_fk FOREIGN KEY (personagem_id)
        REFERENCES public.pc (personagem_id) MATCH SIMPLE
);

CREATE TABLE IF NOT EXISTS public.Armadura(
    armadura_id integer NOT NULL,
    equip_id integer NOT NULL,
    protecao integer NOT NULL,
    CONSTRAINT armadura_pk PRIMARY KEY (armadura_id),
    CONSTRAINT equip_fk FOREIGN KEY (equip_id)
        REFERENCES public.equipamento(equip_id) MATCH SIMPLE
);

CREATE TABLE IF NOT EXISTS public.Arma(
    arma_id integer NOT NULL,
    equip_id integer NOT NULL,
    dano integer NOT NULL,
    CONSTRAINT arma_pk PRIMARY KEY (arma_id),
    CONSTRAINT equip_arma_fk FOREIGN KEY (equip_id)
        REFERENCES public.equipamento(equip_id) MATCH SIMPLE
);

```
