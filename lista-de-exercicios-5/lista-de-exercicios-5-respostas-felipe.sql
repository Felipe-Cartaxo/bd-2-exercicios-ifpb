-- 1)

-- Engenheiro('codEng, nome, salario);
-- Projeto('codProj, titulo, area);
-- Atuação('codEng, 'codProj, funcao)
	-- 'codEng referencia Engenheiro(codEng)
	-- 'codProj referencia Projeto(codProj)
	
-- 2)
create table Engenheiro(
	codEng serial not null primary key,
	nome varchar(30),
	salario numeric(15, 2)
	);
	
create table Projeto(
	codProj serial not null primary key,
	titulo varchar(30),
	area varchar(30)
);

create table Atuacao(
	codEng integer not null,
	codProj integer not null,
	funcao varchar(30)
);

-- 3) Saved c:

-- 4)
alter table Atuacao
add constraint fk_codEng
foreign key (codEng) references Engenheiro(codEng);

alter table Atuacao
add constraint fk_codProj
foreign key (codProj) references Projeto(codProj);

alter table Atuacao
add constraint pk_codEng_codProj
primary key(codEng, codProj);

-- 5)
alter table Engenheiro
add constraint chk_salarioValido -- Considerei qualquer valor acima do salário mínimo atual (1320) como um valor válido
check (salario >= 1320);

-- 6)
insert into Engenheiro (nome, salario)
values (default, 'João Silva', 1500.00);

insert into Engenheiro (nome, salario)
values (default, 'Maria Santos', 1400.50);

insert into Engenheiro (nome, salario)
values (default, 'Pedro Souza', 1600.75);

insert into Engenheiro (nome, salario)
values (default, 'Ana Oliveira', 1350.25);

insert into Engenheiro (nome, salario)
values (default, 'Carlos Ferreira', 1400.80);

select *
from Engenheiro;

-- 7)
insert into Projeto (titulo, area)
values (default, 'Projeto A', 'Engenharia Civil');

insert into Projeto (titulo, area)
values (default, 'Projeto B', 'Engenharia Elétrica');

insert into Projeto (titulo, area)
values (default, 'Projeto C', 'Engenharia Mecânica');

insert into Projeto (titulo, area)
values (default, 'Projeto D', 'Engenharia de Software');

insert into Projeto (titulo, area)
values (default, 'Projeto E', 'Engenharia Química');

select * from Projeto;

-- 8) João Silva trabalha no Projeto A como Engenheiro Civil
insert into Atuacao (codEng, codProj, funcao)
values (1, 1, 'Engenheiro Civil');

-- Maria Santos trabalha no Projeto B como Engenheiro Elétrico
insert into Atuacao (codEng, codProj, funcao)
values (2, 2, 'Engenheiro Elétrico');

-- Pedro Souza trabalha no Projeto C como Engenheiro Mecânico
insert into Atuacao (codEng, codProj, funcao)
values (3, 3, 'Engenheiro Mecânico');

-- Ana Oliveira trabalha no Projeto D como Engenheiro de Software
insert into Atuacao (codEng, codProj, funcao)
values (4, 4, 'Engenheiro de Software');

-- Carlos Ferreira trabalha no Projeto E como Engenheiro Químico
insert into Atuacao (codEng, codProj, funcao)
values (5, 5, 'Engenheiro Químico');

select * from Atuacao;

-- 9 a)
select nome
from Engenheiro
where salario < 15000;

-- 9 b)

select * from Engenheiro;
select * from Atuacao;

select e.nome
from Engenheiro as e
join Atuacao as a
on e.codEng = a.codEng
where funcao like 'Engenheiro de Software';

-- 9 c)
select * from Engenheiro;
select * from Projeto;
select * from Atuacao;

insert into Engenheiro
values(default, 'Felipe Cartaxo', 5000);

insert into Projeto
values(default, 'Projejo XYZ', 'Engenheiro de Software');

update Projeto
set area = 'Engenharia de Software'
where area = 'Engenheiro de Software';

insert into Atuacao
values (8, 6, 'Engenheiro de Software');

select count(*)
from Projeto
group by area;

-- 9 d)
select nome
from engenheiro
where salario > (select avg(salario) from Engenheiro); -- subconsulta

-- 10)

-- Ordem de execucao dos codigos
-- 1º from/join
-- 2º where
-- 3º group by
-- 4º having
-- 5º select
-- 6º order by

select substr(e.nome, 1, 1) as PrimeiraLetra, count(*) as Contagem
from engenheiro e
group by substr(e.nome, 1, 1);

-- O código acima pegará a primeira letra dos nomes dos engenheiros
-- e irá quantificar quantos engenheiros começam com uma determinada letra

-- 11)
select * from Projeto;

select nome
from engenheiro
where codeng in (select codeng
					from atuacao
					where codproj in (select codproj
						from projeto
						where area like 'Engenharia de Software'));
						
-- O primeiro select seleciona o código do projeto que são da área de Engenharia de Software
-- Em seguida, o segundo select retorna o código dos engenheiros que estão inseridos nos projetos retornados pelo primeiro select
-- Por último, retorna o nome dos engenheiros a partir do código retornado no segundo select
select * from Engenheiro;
select * from Projeto;
select * from Atuacao;

select nome
from Engenheiro as e
join Atuacao as a
on e.codEng = a.codEng
join Projeto as p
on a.codProj = p.codProj
where area like 'Engenharia de Software';

-- 12)
select codEng
from Engenheiro
where salario > 1200
INTERSECT
select codeng
from Atuacao;