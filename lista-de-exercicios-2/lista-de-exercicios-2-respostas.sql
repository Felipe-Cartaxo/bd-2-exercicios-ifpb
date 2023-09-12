-- 1)
select * from Filme;
select * from Artista;
select * from Categoria;
select * from Estudio;
select * from Personagem;

-- 2)
insert into Filme values(default, 'Elvis', 2022, 120, null, 3);
select * from Filme;

-- R: Antes da inserção, o 'codFilme' do último filme inserido era 9, logo, pelo 'codFilme' ser serial e PK, o código atribuído ao filme 'Elvis' foi 10.

-- 3)
select titulo
from Filme
where duracao > 120;

-- 4)
select nomeArt
from Artista
where cidade is null;

update Artista
set cidade = 'USA'
where codArt in (1, 2, 6);

-- 5)
select c.descCateg
from Filme f join Categoria c on f.codCateg = c.codCateg
where f.titulo like 'Coringa';

-- 6)
select f.titulo, e.nomeEst, c.descCateg
from Filme f join Estudio e on f.codEst = e.codEst
join Categoria c on f.codCateg = c.codCateg;

-- 7)
select a.nomeArt
from Personagem p join Filme f on p.codFilme = f.codFilme
join Artista a on p.codArt = a.codArt
where f.titulo like 'Encontro Explosivo';

-- 8)
select a.nomeArt, p.nomePers
from Artista a join Personagem p on p.codArt = a.codArt
join Filme f on p.codFilme = f.codFilme
join Categoria c on f.codCateg = c.codCateg
where a.nomeArt like 'B%' and c.descCateg = 'Aventura';

-- 9)
select c.descCateg, count(c.codCateg)
from Categoria c join Filme f on f.codCateg = c.codCateg
group by c.descCateg;

-- 10)
select a.nomeArt, p.nomePers
from Artista a left outer join Personagem p on a.codArt = p.codArt;

-- R: Ela inclui todos os artistas, independentemente de terem personagens associados, e se um artista não tiver um personagem correspondente, o valor do nome do personagem será nulo.

-- 11)
select codArt
from Artista
except
select codArt
from Personagem;

-- R: Retorna todos os códigos de artistas (codart) que não estão presentes na tabela "personagem"

-- 12)
select f.titulo as Filme
from Filme f left join Categoria c on f.codCateg = c.codCateg
where f.codCateg is null;

-- R: Retorna uma lista de títulos de filmes que não possuem categoria (f.codCateg is null)