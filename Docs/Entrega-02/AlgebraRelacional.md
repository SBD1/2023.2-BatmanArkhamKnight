# Álgebra Relacional

A álgebra relacional é a teoria por trás das consultas SQL. Baseada na teoria de conjuntos, ela é aplicada utilizando operadores, a fim de consultar os campos e tuplas de tabelas desejadas.

## Expressões de consulta

Informações do Personagem Jogável
```
σ(personagem_id = 1) Pc
```
Missões realizadas pelo Jogador
```
 π(m.nome_missao, m.descricao, m.situacao)σ(m.personagem = X)ρ(M)(Missao)
 ```
Armas do Personagem Jogável
```
π(a.nome_equipamento, a.nivel, a.descricao)σ(pe.personagem_id = 1 AND a.tipo_equipamento = 'Arma')[σ(a.equip_id = pe.equip_id)(ρ(pe)Pcequip X ρ(a)Equipamento)]
```
Veículos do Personagem Jogável
```
π(v.nome_veiculo, v.tipo_veiculo)σ(v.personagem_id = 1)ρ(v)Veiculo
```
Equipamentos do Personagem Jogável
```
π(e.nome_equipamento, e.tipo_equipamento, e.nivel, e.descricao)σ(pe.personagem_id = 1 AND e.equip_id = pe.equip_id)(ρ(e)Equipamento X ρ(pe)Pcequip)
```
Armaduras do Personagem Jogável
```
π(a.nome_equipamento, a.nivel, a.descricao, a.protecao) σ(pe.personagem_id = 1 AND a.equip_id = pe.equip_id)[ρ(a)Equipamento X σ(a.equip_id = ar.equip_id)(ρ(pe)Pcequip X ρ(ar)Armadura)]
```
Vilões que foram Derrotados
```
σ(v.npc_id ⊂ σ(Npc.situacao_vida = 'Derrotado' AND i.npc_id = v.npc_id )(v X Npc))(ρ(v)Vilao X ρ(i)Instancia)
```
NPCs que foram Derrotados
```
π(n.npc_tipo, n.situacao_vida)(σ(n.local_id ⊂ π(local_id)σ(personagem_id = 1)Pc AND n.situacao_vida = 'Derrotado')ρ(n)Npc)
```
Viagens realizadas
```
π(ρ(origem)r1.regiao_nome, ρ(destino)r2.regiao_nome) σ(v.viagem_destino = r2.regiao_id)([σ(v.viagem_origem ⊂ π(l.regiao_atual)σ(l.local_id = 1)ρ(l)Local)(ρ(v)Viagem X r1)] X r2)
```
Locais visitados
```
ρ(local_visitado)π(r.regiao_nome)σ(l.local_id = 1 AND l.regiao_atual = r.regiao_id)(ρ(l)Local X ρ(r)Regiao)
```
Regiões visitadas
```
π(r.regiao_nome)σ(l.local_id = 1 AND l.regiao_atual = r.regiao_id)(ρ(l)Local X ρ(r)Regiao)
```
## Histórico de versões

| Versão |    Data    | Descrição                | Autor                                                                                                                 |
| :----: | :--------: | ------------------------ | --------------------------------------------------------------------------------------------------------------------- |
| `1.0`  | 30/10/2023 | Criação do documento de Álgebra Relacional | [João Pedro](https://github.com/JoosPerro)                                                                      |
