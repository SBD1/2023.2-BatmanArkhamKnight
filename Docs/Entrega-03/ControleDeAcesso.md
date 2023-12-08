# Controle de Acesso

## Introdução

Controle de acesso é a capacidade de um sistema em impedir que usuários não autorizados tenham acesso a determinadas informações ao mesmo tempo em que usuários autorizados possam vê-las. Seguem os feitos:

```
-- Role e usuário administradores
create role administrator with superuser;
create user bat_admin with password 'bat987' in role administrator;

-- Role e usuários dos donos do jogo
create role owners;
grant select, insert, update, delete on ALL TABLES IN SCHEMA public TO owners with grant option; -- Pode conceder permissão especificada a outros principais
create user bat_jogo_owner with password 'bat_owner987' in role owners;

-- Role dos jogadores 
create role jogadores;
grant select, insert, delete on public.PC to jogadores with grant option;
create user bat_jogadores with password 'bat_jogadores987' in role jogadores;
```

## Histórico de versões

| Versão |    Data    | Descrição                                           | Autor                                          |
| :----: | :--------: | --------------------------                          | ---------------------------------------------- |
| `1.0`  | 30/10/2023 | Criação do documento                                | [Milena Baruc](https://github.com/MilenaBaruc)  |