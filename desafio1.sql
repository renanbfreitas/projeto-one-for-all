DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

CREATE TABLE SpotifyClone.artistas(
  artista_id INT PRIMARY KEY AUTO_INCREMENT,
  nome_artista VARCHAR(100) NOT NULL
) ENGINE = InnoDB;

CREATE TABLE SpotifyClone.albuns(
  album_id INT PRIMARY KEY AUTO_INCREMENT,
  nome_album VARCHAR(100) NOT NULL,
  ano_lancamento INT NOT NULL,
  artista_id INT NOT NULL,
  FOREIGN KEY (artista_id) REFERENCES artistas(artista_id)
) ENGINE = InnoDB;

CREATE TABLE SpotifyClone.planos(
  plano_id INT PRIMARY KEY AUTO_INCREMENT,
  plano VARCHAR(100) NOT NULL,
  valor_plano DECIMAL(5, 2) NOT NULL
) ENGINE = InnoDB;

CREATE TABLE SpotifyClone.usuarios(
  usuario_id INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(100) NOT NULL,
  idade INT NOT NULL,
  data_assinatura DATE NOT NULL,
  plano_id INT NOT NULL,
  FOREIGN KEY (plano_id) REFERENCES SpotifyClone.planos(plano_id)
) ENGINE = InnoDB;

CREATE TABLE SpotifyClone.musicas(
  musica_id INT PRIMARY KEY AUTO_INCREMENT,
  nome_musica VARCHAR(100) NOT NULL,
  duracao_segundos INT NOT NULL,
  album_id INT NOT NULL,
  FOREIGN KEY (album_id) REFERENCES albuns(album_id)
) ENGINE = InnoDB;

CREATE TABLE SpotifyClone.seguindo_artistas(
	usuario_id INT NOT NULL,
  artista_id INT NOT NULL,
	FOREIGN KEY (usuario_id) REFERENCES usuarios(usuario_id),
  FOREIGN KEY (artista_id) REFERENCES artistas(artista_id),
  CONSTRAINT PRIMARY KEY(usuario_id, artista_id)
) ENGINE = InnoDB;

CREATE TABLE SpotifyClone.historico_reproducoes(
  historico_reproducao DATETIME,
  musica_id INT NOT NULL,
  usuario_id INT NOT NULL,
  FOREIGN KEY (musica_id) REFERENCES musicas(musica_id),
  FOREIGN KEY (usuario_id) REFERENCES usuarios(usuario_id),
  CONSTRAINT PRIMARY KEY(musica_id, usuario_id)
) ENGINE = InnoDB;

INSERT INTO SpotifyClone.artistas(nome_artista)
VALUES
  ('Beyoncé'),
  ('Queen'),
  ('Elis Regina'),
  ('Baco Exu do Blues'),
  ('Blind Guardian'),
  ('Nina Simone');

INSERT INTO SpotifyClone.albuns(nome_album, ano_lancamento, artista_id)
VALUES
  ('Renaissance', 2022, 1),
  ('Jazz', 1978, 2),
  ('Hot Space', 1982, 2),
  ('Falso Brilhante', 1998, 3),
  ('Vento de Maio', 2001, 3),
  ('QVVJFA?', 2003, 4),
  ('Somewhere Far Beyond', 2007, 5),
  ('I Put A Spell On You',2012, 6);

INSERT INTO SpotifyClone.planos(plano, valor_plano)
VALUES
  ('gratuito', 0.00),
  ('familiar', 7.99),
  ('universitario', 5.99),
  ('pessoal', 6.99);
    
INSERT INTO SpotifyClone.usuarios(nome, idade, data_assinatura, plano_id)
VALUES
  ('Barbara Liskov', 82, '2019-10-20', 1),
  ('Robert Cecil Martin', 58, '2017-01-06', 1),
  ('Ada Lovelace', 37, '2017-12-30', 2),
  ('Martin Fowler', 46, '2017-01-17', 2),
  ('Sandi Metz', 58, '2018-04-29', 2),
  ('Paulo Freire', 19, '2018-02-14', 3),
  ('Bell Hooks', 26, '2018-01-05', 3),
  ('Christopher Alexander', 85, '2019-06-05', 4),
  ('Judith Butler', 45, '2020-05-13', 4),
  ('Jorge Amado', 58, '2017-02-17', 4);

INSERT INTO SpotifyClone.musicas(nome_musica, duracao_segundos, album_id)
VALUES
  ('BREAK MY SOUL', 279, 1),
  ("VIRGO’S GROOVE", 369, 1),
  ('ALIEN SUPERSTAR', 116, 1),
  ("Don’t Stop Me Now", 203, 2),
  ('Under Pressure', 152, 3),
  ('Como Nossos Pais', 105, 4),
  ('O Medo de Amar é o Medo de Ser Livre', 207, 5),
  ('Samba em Paris', 267, 6),
  ("The Bard’s Song", 244, 7),
  ('Feeling Good', 100, 8);

INSERT INTO SpotifyClone.seguindo_artistas(usuario_id, artista_id)
  VALUES
    (1, 1),
    (1, 2),
    (1, 3),
    (2, 1),
    (2, 3),
    (3, 2),
    (4, 4),
    (5, 5),
    (5, 6),
    (6, 1),
    (6, 6),
    (7, 6),
    (9, 3),
    (10, 2);
  
INSERT INTO SpotifyClone.historico_reproducoes(historico_reproducao, usuario_id, musica_id)
  VALUES
    ("2020-05-02 05:30:35", 1, 2),
    ("2022-02-28 10:45:55", 1, 8),
    ("2020-03-06 11:22:33", 1, 10),
    ("2020-01-02 07:40:33", 2, 7),
    ("2022-08-05 08:05:17", 2, 10),
    ("2020-12-05 18:38:30", 3, 2),
    ("2020-11-13 16:55:13", 3, 10),
    ("2021-08-15 17:10:10", 4, 8),
    ("2020-08-06 15:23:43", 5, 5),
    ("2022-01-09 01:44:33", 5, 8),
    ("2017-10-12 12:35:20", 6, 1),
    ("2017-01-24 00:31:17", 6, 7),
    ("2011-12-15 22:30:49", 7, 4),
    ("2012-03-17 14:56:41", 8, 4),
    ("2022-02-24 21:14:22", 9, 9),
    ("2015-12-13 08:30:22", 10, 3);
