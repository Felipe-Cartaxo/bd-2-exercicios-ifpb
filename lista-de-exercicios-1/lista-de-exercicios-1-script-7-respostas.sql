-- 3)
create table Filme(
	codFilme serial not null primary key,
	titulo varchar(25),
	ano integer,
	duracao integer,
	codCateg integer,
	codEst integer
);

create table Artista(
	codArt serial not null primary key,
	nomeArt varchar(25),
	cidade varchar(20),
	pais varchar(20),
	dataNasc date
);

create table Estudio(
	codEst serial not null primary key,
	nomeEst varchar(25)
);

create table Categoria(
	codCateg serial not null primary key,
	descCateg varchar(25)
);

create table Personagem(
	codArt integer not null,
	codFilme integer not null,
	nomePers varchar(25),
	cache numeric(15, 2)
);

alter table Personagem add constraint pkPersonagem primary key(codArt, codFilme);
alter table Filme add constraint fkFilmeCateg foreign key(codCateg) references Categoria;
alter table Filme add constraint fkFilmeEstudio foreign key(codEst) references Estudio;
alter table Personagem add constraint fkPersonagemArtista foreign key(codArt) references Artista;
alter table Personagem add constraint fkPersonagemFilme foreign key(codFilme) references Filme;

-- 4)
select * from Filme;
select * from Artista;
select * from Estudio;
select * from Categoria;
select * from Personagem;

-- R: Sim, as tabelas estão compatíveis com o modelo.

-- 5)
insert into Artista values(default, 'Cameron Diaz', null, 'USA', '15/07/75');
insert into Artista values(default, 'Julia Roberts', null, 'USA', '20/08/67');
insert into Artista values(default, 'Brad Pitt', null, null, '05/03/70');
insert into Artista values(default, 'Joaquin Phoenix', null, null, '06/04/72');
insert into Artista values(default, 'Bradley Cooper', null, 'USA', '06/06/77');
insert into Artista values(default, 'Tom Cruise', null, 'USA', '10/09/64');
insert into Artista values(default, 'Rodrigo Santoro', 'Rio de Janeiro', 'Brasil', '12/10/78');

insert into Categoria values(default, 'Aventura');
insert into Categoria values(default, 'Romance');
insert into Categoria values(default, 'Comédia');
insert into Categoria values(default, 'Ação');
insert into Categoria values(default, 'Suspense');
insert into Categoria values(default, 'Drama');

insert into Estudio values(default, 'Paramount');
insert into Estudio values(default, 'Disney');
insert into Estudio values(default, 'Universal');

insert into Filme values(default, 'Encontro Explosivo', 2010, 134, 4, 1);
insert into Filme values(default, 'O Besouro Verde', 2010, 155, 1, 1);
insert into Filme values(default, 'Comer, Rezar, Amar', 2010, 177, 2, 1);
insert into Filme values(default, 'Coringa', 2019, 122, 6, 1);
insert into Filme values(default, 'Era uma vez em Hollywood', 2020, 119, 4, 2);
insert into Filme values(default, 'Nasce uma estrela', 2018, 100, 6, 1);

insert into Personagem values(1, 1, 'Natalie', 10000);
insert into Personagem values(1, 2, 'Tom', 10000);
insert into Personagem values(5, 3, 'John', 10000);
insert into Personagem values(3, 2, 'Ana', 6000);
insert into Personagem values(6, 5, 'Tom', 11000);
insert into Personagem values(4, 4, 'John', 12000);

-- 6)
select * from Filme;
select * from Artista;
select * from Estudio;
select * from Categoria;
select * from Personagem;

-- 7)
insert into Artista values(default, 'Fefê Houston', 'Paraíba', 'Brasil', '16/06/96');
insert into Artista values(default, 'Karen Neraky', null, 'USA', '27/08/2005');
insert into Artista values(default, 'Sophie Yevaa', null, 'Russia', '05/03/2008');

insert into Categoria values(default, 'Documentário');
insert into Categoria values(default, 'Mistério');
insert into Categoria values(default, 'Animação');

insert into Estudio values(default, 'Riot Games');
insert into Estudio values(default, 'Netflix');
insert into Estudio values(default, 'Ghibli');

insert into Filme values(default, 'Red: Crescer é uma fera' ,2022, 122, 9, 1);
insert into Filme values(default, 'Perfect Blue', 1997, 119, 8, 2);
insert into Filme values(default, 'O labirinto do fauno', 2006, 100, 5, 1);

insert into Personagem values(3, 7, 'Mei Lee', 4000);
insert into Personagem values(6, 8, 'Mima Kirigoe', 28000);
insert into Personagem values(4, 9, 'Ofélia', 8000);

select * from Filme;
select * from Artista;
select * from Estudio;
select * from Categoria;
select * from Personagem;

-- 8)
select * from Artista;

-- R: Sem o 'order by', por padrão, a tabela artista é ordenada do dado mais antigo (no topo da tabela) ao dado mais recente inserido, ou seja, pelo codArt.

select *
from Artista
order by(nomeArt);

-- R: Ao colocar o 'order by' é possível ordenar a tabela pelos nomes dos artista.

-- 9)
select nomeArt
from Artista
where nomeArt like 'B%';

-- 10)
select titulo
from Filme
where ano = 2019;

-- 11)
update Personagem
set cache = cache + (cache * 0.15);

-- 12)
update Artista
set pais = 'Alemanha'
where pais is null;

update Artista
set pais = 'Canadá'
where codArt = 9;

-- 13)
insert into Artista
values (default, 'Juliana Paes', 'Rio de Janeiro', 'Brasil', '26-03-1979');

insert into Artista
values (default, 'Tais Araújo', 'Rio de Janeiro', 'Brasil', '25-11-1978');

-- 14)
delete from Artista
where codArt = 9;