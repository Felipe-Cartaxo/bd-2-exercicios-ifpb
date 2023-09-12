-- 1. Para a tabela artista, crie uma view artistaV com os seguintes campos: codart, nomeart, datanasc. Renomeie “codart” para “Código” e “nomeart” para “Nome” na view. Liste o conteúdo da view criada.

create or replace view ArtistaV
	("Código", "Nome")
	as select codart, nomeart, dataNasc
	from Artista;
	
select * from ArtistaV;

drop view ArtistaV;

-- 2. Crie uma view filmeV com os seguintes campos: titulo,duração, ano, estúdio (nome do estúdio). Liste, em seguida, seu conteúdo.
select * from Filme;
select * from Estudio;

create or replace view FilmeV
	("Título", "Duração", "Ano", "Nome do estúdio") 
	as select titulo, duracao, ano, nomeEst
	from Filme f
	join Estudio e
	on f.codEst = e.codEst;
	
select * from FilmeV;

drop view FilmeV;

-- 3. Faça a inserção da artista “Mariana Ximenes” com a data de nascimento ‘27/11/78’ através da view artistaV. Como foi possível inserir por meio da view? Explique.
select * from Artista;
select * from ArtistaV;

insert into ArtistaV
values(8, 'Mariana Ximenes', '27/11/78');

-- 4. Tente inserir um filme através da view filmeV. O que aconteceu? Explique.
select * from FilmeV;

-- 4.a)
insert into FilmeV
values('Perfect blue', 1997, 85, 'Madhouse');

-- 4.b)

select * from Filme;
as select 
insert into Filme
values(default, 'Perfect blue', 1997, 85);

select * from FilmeV;
select * from Filme;

-- 5. Crie uma view que apresente os nomes dos artistas dos filmes que são do ano de 2019. Consulte a view criada.

select * from Filme;
select * from Artista;
select * from Personagem; -- possui codArt e codFilme como PK

create or replace view ArtistaV2
	as select nomeArt, titulo, ano
	from Filme f
	join Personagem p
	on f.codfilme = p.codfilme
	join Artista a
	on a.codArt = p.codArt
	where f.ano = 2019;
	
select * from ArtistaV2;

-- 6. 

drop view ArtistaV2;