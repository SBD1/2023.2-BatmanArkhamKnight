-- Role e usuário administradores
create role administrator with superuser;
create user bat_admin with password 'bat987' in role administrator;

-- Role e usuários dos donos do jogo
create role owners;
grant select, insert, update, delete on ALL TABLES IN SCHEMA public TO owners with grant option; -- Pode conceder permissão especificada a outros principais
create user bat_jogo_owner with password 'bat_owner987' in role owners;

-- Role dos jogadores para acessa a view
create role jogadores;
grant select, insert, delete on public.PC to jogadores with grant option;
create user bat_jogadores with password 'bat_jogadores987' in role jogadores;