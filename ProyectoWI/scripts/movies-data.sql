

### BEGIN CREATE TABLE MOVIES
DROP TABLE IF EXISTS `MOVIES`;
CREATE TABLE `MOVIES` ( 
`id` INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
`title` VARCHAR(255),
`imdbID` INTEGER,
`spanishTitle` VARCHAR(255),
`imdbPictureURL` VARCHAR(255),
`year` INTEGER,
`rtID` VARCHAR(255),
`rtAllCriticsRating` INTEGER,
`rtAllCriticsNumReviews` INTEGER,
`rtAllCriticsNumFresh` INTEGER,
`rtAllCriticsNumRotten` INTEGER,
`rtAllCriticsScore` INTEGER,
`rtTopCriticsRating` FLOAT,
`rtTopCriticsNumReviews` INTEGER,
`rtTopCriticsNumFresh` INTEGER,
`rtTopCriticsNumRotten` INTEGER,
`rtTopCriticsScore` INTEGER,
`rtAudienceRating` FLOAT,
`rtAudienceNumRatings` INTEGER,
`rtAudienceScore` INTEGER,
`rtPictureURL` VARCHAR(255)) ENGINE=InnoDB DEFAULT CHARSET=utf8;
#### END CREATE TABLE MOVIES


INSERT INTO `MOVIES` (id, title, imdbID, spanishTitle, imdbPictureURL, year, rtID, rtAllCriticsRating, rtAllCriticsNumReviews, rtAllCriticsNumFresh, rtAllCriticsNumRotten, rtAllCriticsScore, rtTopCriticsRating, rtTopCriticsNumReviews, rtTopCriticsNumFresh, rtTopCriticsNumRotten, rtTopCriticsScore, rtAudienceRating, rtAudienceNumRatings, rtAudienceScore, rtPictureURL
) values (2, 'Jumanji', 0113497, 'Jumanji', 'http://ia.media-imdb.com/images/M/MV5BMzM5NjE1OTMxNV5BMl5BanBnXkFtZTcwNDY2MzEzMQ@@._V1._SY314_CR3,0,214,314_.jpg', 1995, '1068044-jumanji', 5.6, 28, 13, 15, 46, 5.8, 5, 2, 3, 40, 3.2, 44587, 61, 'http://content8.flixster.com/movie/56/79/73/5679734_det.jpg');

INSERT INTO `MOVIES` (id, title, imdbID, spanishTitle, imdbPictureURL, year, rtID, rtAllCriticsRating, rtAllCriticsNumReviews, rtAllCriticsNumFresh, rtAllCriticsNumRotten, rtAllCriticsScore, rtTopCriticsRating, rtTopCriticsNumReviews, rtTopCriticsNumFresh, rtTopCriticsNumRotten, rtTopCriticsScore, rtAudienceRating, rtAudienceNumRatings, rtAudienceScore, rtPictureURL
) values (3, 'Grumpy Old Men', 0107050, 'Dos viejos gruñones', 'http://ia.media-imdb.com/images/M/MV5BMTI5MTgyMzE0OF5BMl5BanBnXkFtZTYwNzAyNjg5._V1._SX214_CR0,0,214,314_.jpg', 1993, 'grumpy_old_men', 5.9, 36, 24, 12, 66, 7, 6, 5, 1, 83, 3.2, 10489, 66, 'http://content6.flixster.com/movie/25/60/256020_det.jpg');

INSERT INTO `MOVIES` (id, title, imdbID, spanishTitle, imdbPictureURL, year, rtID, rtAllCriticsRating, rtAllCriticsNumReviews, rtAllCriticsNumFresh, rtAllCriticsNumRotten, rtAllCriticsScore, rtTopCriticsRating, rtTopCriticsNumReviews, rtTopCriticsNumFresh, rtTopCriticsNumRotten, rtTopCriticsScore, rtAudienceRating, rtAudienceNumRatings, rtAudienceScore, rtPictureURL
) values (4, 'Waiting to Exhale', 0114885, 'Esperando un respiro', 'http://ia.media-imdb.com/images/M/MV5BMTczMTMyMTgyM15BMl5BanBnXkFtZTcwOTc4OTQyMQ@@._V1._SY314_CR4,0,214,314_.jpg', 1995, 'waiting_to_exhale', 5.6, 25, 14, 11, 56, 5.5, 11, 5, 6, 45, 3.3, 5666, 79, 'http://content9.flixster.com/movie/10/94/17/10941715_det.jpg');

INSERT INTO `MOVIES` (id, title, imdbID, spanishTitle, imdbPictureURL, year, rtID, rtAllCriticsRating, rtAllCriticsNumReviews, rtAllCriticsNumFresh, rtAllCriticsNumRotten, rtAllCriticsScore, rtTopCriticsRating, rtTopCriticsNumReviews, rtTopCriticsNumFresh, rtTopCriticsNumRotten, rtTopCriticsScore, rtAudienceRating, rtAudienceNumRatings, rtAudienceScore, rtPictureURL
) values (5, 'Father of the Bride Part II', 0113041, 'Vuelve el padre de la novia (Ahora también abuelo)', 'http://ia.media-imdb.com/images/M/MV5BMTg1NDc2MjExOF5BMl5BanBnXkFtZTcwNjU1NDAzMQ@@._V1._SY314_CR5,0,214,314_.jpg', 1995, 'father_of_the_bride_part_ii', 5.3, 19, 9, 10, 47, 5.4, 5, 1, 4, 20, 3, 13761, 64, 'http://content8.flixster.com/movie/25/54/255426_det.jpg');

INSERT INTO `MOVIES` (id, title, imdbID, spanishTitle, imdbPictureURL, year, rtID, rtAllCriticsRating, rtAllCriticsNumReviews, rtAllCriticsNumFresh, rtAllCriticsNumRotten, rtAllCriticsScore, rtTopCriticsRating, rtTopCriticsNumReviews, rtTopCriticsNumFresh, rtTopCriticsNumRotten, rtTopCriticsScore, rtAudienceRating, rtAudienceNumRatings, rtAudienceScore, rtPictureURL
) values (6, 'Heat', 0113277, 'Heat', 'http://ia.media-imdb.com/images/M/MV5BMTM1NDc4ODkxNV5BMl5BanBnXkFtZTcwNTI4ODE3MQ@@._V1._SY314_CR1,0,214,314_.jpg', 1995, '1068182-heat', 7.7, 58, 50, 8, 86, 7.2, 17, 14, 3, 82, 3.9, 42785, 92, 'http://content9.flixster.com/movie/26/80/268099_det.jpg');

INSERT INTO `MOVIES` (id, title, imdbID, spanishTitle, imdbPictureURL, year, rtID, rtAllCriticsRating, rtAllCriticsNumReviews, rtAllCriticsNumFresh, rtAllCriticsNumRotten, rtAllCriticsScore, rtTopCriticsRating, rtTopCriticsNumReviews, rtTopCriticsNumFresh, rtTopCriticsNumRotten, rtTopCriticsScore, rtAudienceRating, rtAudienceNumRatings, rtAudienceScore, rtPictureURL
) values (7, 'Sabrina', 0047437, 'Sabrina', 'http://ia.media-imdb.com/images/M/MV5BMTYyNDM1NTQ5Nl5BMl5BanBnXkFtZTcwMTA5NjEwMg@@._V1._SY314_CR50,0,214,314_.jpg', 1954, '1018047-sabrina', 7.4, 31, 28, 3, 90, 7.2, 5, 5, 0, 100, 3.8, 12812, 87, 'http://content7.flixster.com/movie/10/93/36/10933669_det.jpg');

INSERT INTO `MOVIES` (id, title, imdbID, spanishTitle, imdbPictureURL, year, rtID, rtAllCriticsRating, rtAllCriticsNumReviews, rtAllCriticsNumFresh, rtAllCriticsNumRotten, rtAllCriticsScore, rtTopCriticsRating, rtTopCriticsNumReviews, rtTopCriticsNumFresh, rtTopCriticsNumRotten, rtTopCriticsScore, rtAudienceRating, rtAudienceNumRatings, rtAudienceScore, rtPictureURL
) values (8, 'Tom and Huck', 0112302, 'Tom y Huck', 'http://ia.media-imdb.com/images/M/MV5BMTUxNDYzMDY1OV5BMl5BanBnXkFtZTcwNDA2MzYxMQ@@._V1._SY314_CR2,0,214,314_.jpg', 1995, 'tom_and_huck', 4.2, 8, 2, 6, 25, 0, 2, 1, 1, 50, 2.7, 2649, 45, 'http://content9.flixster.com/movie/26/16/261691_det.jpg');

INSERT INTO `MOVIES` (id, title, imdbID, spanishTitle, imdbPictureURL, year, rtID, rtAllCriticsRating, rtAllCriticsNumReviews, rtAllCriticsNumFresh, rtAllCriticsNumRotten, rtAllCriticsScore, rtTopCriticsRating, rtTopCriticsNumReviews, rtTopCriticsNumFresh, rtTopCriticsNumRotten, rtTopCriticsScore, rtAudienceRating, rtAudienceNumRatings, rtAudienceScore, rtPictureURL
) values (9, 'Sudden Death', 0114576, 'Sudden Death: muerte súbita', 'http://ia.media-imdb.com/images/M/MV5BMTcwMTU2OTMxNV5BMl5BanBnXkFtZTcwMzg3MTYyMQ@@._V1._SY314_CR0,0,214,314_.jpg', 1995, '1068470-sudden_death', 5.2, 32, 17, 15, 53, 5.6, 9, 5, 4, 55, 2.6, 3626, 40, 'http://content8.flixster.com/movie/27/91/279122_det.jpg');

INSERT INTO `MOVIES` (id, title, imdbID, spanishTitle, imdbPictureURL, year, rtID, rtAllCriticsRating, rtAllCriticsNumReviews, rtAllCriticsNumFresh, rtAllCriticsNumRotten, rtAllCriticsScore, rtTopCriticsRating, rtTopCriticsNumReviews, rtTopCriticsNumFresh, rtTopCriticsNumRotten, rtTopCriticsScore, rtAudienceRating, rtAudienceNumRatings, rtAudienceScore, rtPictureURL
) values (10, 'GoldenEye', 0113189, 'GoldenEye', 'http://ia.media-imdb.com/images/M/MV5BNTE1OTExNjU1M15BMl5BanBnXkFtZTcwMTQzNjAwMQ@@._V1._SX214_CR0,0,214,314_.jpg', 1995, 'goldeneye', 6.8, 41, 33, 8, 80, 6.2, 11, 7, 4, 63, 3.4, 28260, 78, 'http://content9.flixster.com/movie/26/66/266699_det.jpg');

INSERT INTO `MOVIES` (id, title, imdbID, spanishTitle, imdbPictureURL, year, rtID, rtAllCriticsRating, rtAllCriticsNumReviews, rtAllCriticsNumFresh, rtAllCriticsNumRotten, rtAllCriticsScore, rtTopCriticsRating, rtTopCriticsNumReviews, rtTopCriticsNumFresh, rtTopCriticsNumRotten, rtTopCriticsScore, rtAudienceRating, rtAudienceNumRatings, rtAudienceScore, rtPictureURL
) values (11, 'The American President', 0112346, 'El presidente y Miss Wade', 'http://ia.media-imdb.com/images/M/MV5BMTI5NDU2NDYzOF5BMl5BanBnXkFtZTYwNDk5MDI5._V1._SY314_CR5,0,214,314_.jpg', 1995, 'american_president', 7, 49, 44, 5, 89, 7.2, 18, 16, 2, 88, 3.2, 8320, 71, 'http://content7.flixster.com/movie/25/42/254205_det.jpg');

INSERT INTO `MOVIES` (id, title, imdbID, spanishTitle, imdbPictureURL, year, rtID, rtAllCriticsRating, rtAllCriticsNumReviews, rtAllCriticsNumFresh, rtAllCriticsNumRotten, rtAllCriticsScore, rtTopCriticsRating, rtTopCriticsNumReviews, rtTopCriticsNumFresh, rtTopCriticsNumRotten, rtTopCriticsScore, rtAudienceRating, rtAudienceNumRatings, rtAudienceScore, rtPictureURL
) values (12, 'Dracula: Dead and Loving It', 0112896, 'Drácula, un muerto muy contento y feliz', 'http://ia.media-imdb.com/images/M/MV5BMTc3MjI0NjA0Nl5BMl5BanBnXkFtZTcwNDYwODUyMQ@@._V1._SY314_CR18,0,214,314_.jpg', 1995, 'dracula_dead_and_loving_it', 3, 35, 3, 32, 8, 3.7, 10, 2, 8, 20, 2.8, 10078, 52, 'http://content8.flixster.com/movie/10/89/17/10891774_det.jpg');

INSERT INTO `MOVIES` (id, title, imdbID, spanishTitle, imdbPictureURL, year, rtID, rtAllCriticsRating, rtAllCriticsNumReviews, rtAllCriticsNumFresh, rtAllCriticsNumRotten, rtAllCriticsScore, rtTopCriticsRating, rtTopCriticsNumReviews, rtTopCriticsNumFresh, rtTopCriticsNumRotten, rtTopCriticsScore, rtAudienceRating, rtAudienceNumRatings, rtAudienceScore, rtPictureURL
) values (13, 'Balto', 0112453, 'Balto. La leyenda del perro esquimal', 'http://ia.media-imdb.com/images/M/MV5BMTU4NTE3NDU1MF5BMl5BanBnXkFtZTYwMjg5Mjk5._V1._SY216_CR37,0,214,216_.jpg', 1995, 'balto', 5.8, 12, 6, 6, 50, 0, 4, 1, 3, 25, 3.2, 9195, 66, 'http://content7.flixster.com/movie/25/16/251605_det.jpg');

INSERT INTO `MOVIES` (id, title, imdbID, spanishTitle, imdbPictureURL, year, rtID, rtAllCriticsRating, rtAllCriticsNumReviews, rtAllCriticsNumFresh, rtAllCriticsNumRotten, rtAllCriticsScore, rtTopCriticsRating, rtTopCriticsNumReviews, rtTopCriticsNumFresh, rtTopCriticsNumRotten, rtTopCriticsScore, rtAudienceRating, rtAudienceNumRatings, rtAudienceScore, rtPictureURL
) values (14, 'Nixon', 0113987, 'Nixon', 'http://ia.media-imdb.com/images/M/MV5BMTQ4ODUxNTU2OV5BMl5BanBnXkFtZTcwOTIwODMyMQ@@._V1._SY314_CR3,0,214,314_.jpg', 1995, 'nixon', 6.7, 56, 42, 14, 75, 6.1, 18, 12, 6, 66, 3.5, 3256, 72, 'http://content6.flixster.com/movie/28/30/283016_det.jpg');

INSERT INTO `MOVIES` (id, title, imdbID, spanishTitle, imdbPictureURL, year, rtID, rtAllCriticsRating, rtAllCriticsNumReviews, rtAllCriticsNumFresh, rtAllCriticsNumRotten, rtAllCriticsScore, rtTopCriticsRating, rtTopCriticsNumReviews, rtTopCriticsNumFresh, rtTopCriticsNumRotten, rtTopCriticsScore, rtAudienceRating, rtAudienceNumRatings, rtAudienceScore, rtPictureURL
) values (15, 'Cutthroat Island', 0112760, 'La isla de las Cabezas Cortadas', 'http://ia.media-imdb.com/images/M/MV5BNjI5MjI5Njk3Ml5BMl5BanBnXkFtZTcwNTQwMTYyMQ@@._V1._SY216_CR39,0,214,216_.jpg', 1995, 'cutthroat_island', 4.4, 31, 14, 17, 45, 4.7, 6, 3, 3, 50, 2.6, 3350, 42, 'http://content6.flixster.com/movie/25/69/256908_det.jpg');

INSERT INTO `MOVIES` (id, title, imdbID, spanishTitle, imdbPictureURL, year, rtID, rtAllCriticsRating, rtAllCriticsNumReviews, rtAllCriticsNumFresh, rtAllCriticsNumRotten, rtAllCriticsScore, rtTopCriticsRating, rtTopCriticsNumReviews, rtTopCriticsNumFresh, rtTopCriticsNumRotten, rtTopCriticsScore, rtAudienceRating, rtAudienceNumRatings, rtAudienceScore, rtPictureURL
) values (16, 'Casino', 0112641, 'Casino, de Scorsese', 'http://ia.media-imdb.com/images/M/MV5BMTQ0NDk5NDc5OF5BMl5BanBnXkFtZTYwMDYyNDA5._V1._SX214_CR0,0,214,314_.jpg', 1995, '1067987-casino', 7.2, 58, 47, 11, 81, 6.3, 16, 11, 5, 68, 3.9, 66463, 91, 'http://content8.flixster.com/movie/10/87/61/10876102_det.jpg');

INSERT INTO `MOVIES` (id, title, imdbID, spanishTitle, imdbPictureURL, year, rtID, rtAllCriticsRating, rtAllCriticsNumReviews, rtAllCriticsNumFresh, rtAllCriticsNumRotten, rtAllCriticsScore, rtTopCriticsRating, rtTopCriticsNumReviews, rtTopCriticsNumFresh, rtTopCriticsNumRotten, rtTopCriticsScore, rtAudienceRating, rtAudienceNumRatings, rtAudienceScore, rtPictureURL
) values (17, 'Sense and Sensibility', 0114388, 'Sentido y sensibilidad', 'http://ia.media-imdb.com/images/M/MV5BMTQzNjk2OTk3Nl5BMl5BanBnXkFtZTcwNzczNjYyMQ@@._V1._SY314_CR7,0,214,314_.jpg', 1995, '1068832-sense_and_sensibility', 7.9, 49, 48, 1, 97, 8.1, 14, 13, 1, 92, 3.8, 32782, 88, 'http://content6.flixster.com/movie/11/12/50/11125040_det.jpg');

INSERT INTO `MOVIES` (id, title, imdbID, spanishTitle, imdbPictureURL, year, rtID, rtAllCriticsRating, rtAllCriticsNumReviews, rtAllCriticsNumFresh, rtAllCriticsNumRotten, rtAllCriticsScore, rtTopCriticsRating, rtTopCriticsNumReviews, rtTopCriticsNumFresh, rtTopCriticsNumRotten, rtTopCriticsScore, rtAudienceRating, rtAudienceNumRatings, rtAudienceScore, rtPictureURL
) values (18, 'Four Rooms', 0113101, 'Four Rooms', 'http://ia.media-imdb.com/images/M/MV5BMTcwOTMzODQ5MV5BMl5BanBnXkFtZTcwNjgyMjAwMQ@@._V1._SX214_CR0,0,214,314_.jpg', 1995, 'four_rooms', 3.5, 42, 6, 36, 14, 2.9, 11, 0, 11, 0, 3.5, 14266, 72, 'http://content7.flixster.com/movie/93/49/77/9349773_det.jpg');

INSERT INTO `MOVIES` (id, title, imdbID, spanishTitle, imdbPictureURL, year, rtID, rtAllCriticsRating, rtAllCriticsNumReviews, rtAllCriticsNumFresh, rtAllCriticsNumRotten, rtAllCriticsScore, rtTopCriticsRating, rtTopCriticsNumReviews, rtTopCriticsNumFresh, rtTopCriticsNumRotten, rtTopCriticsScore, rtAudienceRating, rtAudienceNumRatings, rtAudienceScore, rtPictureURL
) values (19, 'Ace Ventura: When Nature Calls', 0112281, 'Ace Ventura, operación África', 'http://ia.media-imdb.com/images/M/MV5BMjA0NTc4OTk1Ml5BMl5BanBnXkFtZTcwNjA0NTQzMQ@@._V1._SY314_CR17,0,214,314_.jpg', 1995, 'ace_ventura_when_nature_calls', 4.1, 25, 9, 16, 36, 0, 3, 1, 2, 33, 3.2, 87306, 73, 'http://content7.flixster.com/movie/10/94/18/10941853_det.jpg');

INSERT INTO `MOVIES` (id, title, imdbID, spanishTitle, imdbPictureURL, year, rtID, rtAllCriticsRating, rtAllCriticsNumReviews, rtAllCriticsNumFresh, rtAllCriticsNumRotten, rtAllCriticsScore, rtTopCriticsRating, rtTopCriticsNumReviews, rtTopCriticsNumFresh, rtTopCriticsNumRotten, rtTopCriticsScore, rtAudienceRating, rtAudienceNumRatings, rtAudienceScore, rtPictureURL
) values (20, 'Money Train', 0113845, 'Asalto al tren del dinero', 'http://ia.media-imdb.com/images/M/MV5BNDEwNzcyNjkzNl5BMl5BanBnXkFtZTcwNzQyMzYxMQ@@._V1._SY314_CR4,0,214,314_.jpg', 1995, 'money_train', 4, 24, 4, 20, 16, 4.5, 5, 1, 4, 20, 2.7, 5263, 38, 'http://content9.flixster.com/movie/11/12/51/11125103_det.jpg');

INSERT INTO `MOVIES` (id, title, imdbID, spanishTitle, imdbPictureURL, year, rtID, rtAllCriticsRating, rtAllCriticsNumReviews, rtAllCriticsNumFresh, rtAllCriticsNumRotten, rtAllCriticsScore, rtTopCriticsRating, rtTopCriticsNumReviews, rtTopCriticsNumFresh, rtTopCriticsNumRotten, rtTopCriticsScore, rtAudienceRating, rtAudienceNumRatings, rtAudienceScore, rtPictureURL
) values (21, 'Get Shorty', 0113161, 'Cómo conquistar Hollywood', 'http://ia.media-imdb.com/images/M/MV5BMTIzMzk3NDgwNV5BMl5BanBnXkFtZTcwMDEzNDcyMQ@@._V1._SY314_CR17,0,214,314_.jpg', 1995, 'get_shorty', 7.7, 49, 42, 7, 85, 8.4, 14, 14, 0, 100, 3.2, 10155, 63, 'http://content7.flixster.com/movie/98/65/89/9865893_det.jpg');

INSERT INTO `MOVIES` (id, title, imdbID, spanishTitle, imdbPictureURL, year, rtID, rtAllCriticsRating, rtAllCriticsNumReviews, rtAllCriticsNumFresh, rtAllCriticsNumRotten, rtAllCriticsScore, rtTopCriticsRating, rtTopCriticsNumReviews, rtTopCriticsNumFresh, rtTopCriticsNumRotten, rtTopCriticsScore, rtAudienceRating, rtAudienceNumRatings, rtAudienceScore, rtPictureURL
) values (22, 'Copycat', 0112722, 'Copycat: copia mortal', 'http://ia.media-imdb.com/images/M/MV5BMTI5NTU4MDk0MF5BMl5BanBnXkFtZTcwNDIwMTYyMQ@@._V1._SY216_CR35,0,214,216_.jpg', 1995, '1065837-copycat', 6.6, 32, 24, 8, 75, 7.4, 5, 4, 1, 80, 3.1, 5628, 58, 'http://content9.flixster.com/movie/27/27/272723_det.jpg');

INSERT INTO `MOVIES` (id, title, imdbID, spanishTitle, imdbPictureURL, year, rtID, rtAllCriticsRating, rtAllCriticsNumReviews, rtAllCriticsNumFresh, rtAllCriticsNumRotten, rtAllCriticsScore, rtTopCriticsRating, rtTopCriticsNumReviews, rtTopCriticsNumFresh, rtTopCriticsNumRotten, rtTopCriticsScore, rtAudienceRating, rtAudienceNumRatings, rtAudienceScore, rtPictureURL
) values (23, 'Ninja Assassin', 1186367, 'Ninja Assassin', 'http://ia.media-imdb.com/images/M/MV5BMTcxNDYzMjU1Ml5BMl5BanBnXkFtZTcwMTYzOTM3Mg@@._V1._SX214_CR0,0,214,314_.jpg', 2009, '1198524-ninja_assassin', 4.3, 106, 27, 79, 25, 4.6, 20, 6, 14, 30, 3.4, 107023, 58, 'http://content6.flixster.com/movie/10/89/12/10891232_det.jpg');

INSERT INTO `MOVIES` (id, title, imdbID, spanishTitle, imdbPictureURL, year, rtID, rtAllCriticsRating, rtAllCriticsNumReviews, rtAllCriticsNumFresh, rtAllCriticsNumRotten, rtAllCriticsScore, rtTopCriticsRating, rtTopCriticsNumReviews, rtTopCriticsNumFresh, rtTopCriticsNumRotten, rtTopCriticsScore, rtAudienceRating, rtAudienceNumRatings, rtAudienceScore, rtPictureURL
) values (24, 'Powder', 0114168, 'Powder - pura energía', 'http://ia.media-imdb.com/images/M/MV5BMTIwMTQ3MjY2M15BMl5BanBnXkFtZTcwMTQ0NDUyMQ@@._V1._SX99_SY140_.jpg', 1995, 'powder', 5.2, 19, 9, 10, 47, 4.9, 5, 0, 5, 0, 3.1, 6650, 67, 'http://content7.flixster.com/movie/25/59/255901_det.jpg');

INSERT INTO `MOVIES` (id, title, imdbID, spanishTitle, imdbPictureURL, year, rtID, rtAllCriticsRating, rtAllCriticsNumReviews, rtAllCriticsNumFresh, rtAllCriticsNumRotten, rtAllCriticsScore, rtTopCriticsRating, rtTopCriticsNumReviews, rtTopCriticsNumFresh, rtTopCriticsNumRotten, rtTopCriticsScore, rtAudienceRating, rtAudienceNumRatings, rtAudienceScore, rtPictureURL
) values (25, 'Leaving Las Vegas', 0113627, 'Leaving Las Vegas', 'http://ia.media-imdb.com/images/M/MV5BMTIzOTEzMzQwNF5BMl5BanBnXkFtZTcwNjE0MTYyMQ@@._V1._SX214_CR0,0,214,314_.jpg', 1995, 'leaving_las_vegas', 7.7, 45, 40, 5, 88, 8.1, 11, 11, 0, 100, 3.6, 12742, 82, 'http://content7.flixster.com/movie/10/90/25/10902561_det.jpg');

INSERT INTO `MOVIES` (id, title, imdbID, spanishTitle, imdbPictureURL, year, rtID, rtAllCriticsRating, rtAllCriticsNumReviews, rtAllCriticsNumFresh, rtAllCriticsNumRotten, rtAllCriticsScore, rtTopCriticsRating, rtTopCriticsNumReviews, rtTopCriticsNumFresh, rtTopCriticsNumRotten, rtTopCriticsScore, rtAudienceRating, rtAudienceNumRatings, rtAudienceScore, rtPictureURL
) values (26, 'Othello', 0114057, 'Otelo', 'http://ia.media-imdb.com/images/M/MV5BMTIxMzA2ODk2NV5BMl5BanBnXkFtZTcwMzQ4ODIyMQ@@._V1._SY314_CR5,0,214,314_.jpg', 1995, '1069707-othello', 6.3, 38, 26, 12, 68, 6.1, 11, 7, 4, 63, 3.3, 2018, 66, 'http://content6.flixster.com/movie/10/92/98/10929892_det.jpg');

INSERT INTO `MOVIES` (id, title, imdbID, spanishTitle, imdbPictureURL, year, rtID, rtAllCriticsRating, rtAllCriticsNumReviews, rtAllCriticsNumFresh, rtAllCriticsNumRotten, rtAllCriticsScore, rtTopCriticsRating, rtTopCriticsNumReviews, rtTopCriticsNumFresh, rtTopCriticsNumRotten, rtTopCriticsScore, rtAudienceRating, rtAudienceNumRatings, rtAudienceScore, rtPictureURL
) values (27, 'Now and Then', 0114011, 'Amigas para siempre', 'http://ia.media-imdb.com/images/M/MV5BMTY4MjMwNzA1NF5BMl5BanBnXkFtZTcwNzEwNTYyMQ@@._V1._SY314_CR4,0,214,314_.jpg', 1995, 'now_and_then', 4.7, 16, 3, 13, 18, 5.2, 5, 1, 4, 20, 3.5, 17168, 78, 'http://content6.flixster.com/movie/55/36/64/5536644_det.jpg');

INSERT INTO `MOVIES` (id, title, imdbID, spanishTitle, imdbPictureURL, year, rtID, rtAllCriticsRating, rtAllCriticsNumReviews, rtAllCriticsNumFresh, rtAllCriticsNumRotten, rtAllCriticsScore, rtTopCriticsRating, rtTopCriticsNumReviews, rtTopCriticsNumFresh, rtTopCriticsNumRotten, rtTopCriticsScore, rtAudienceRating, rtAudienceNumRatings, rtAudienceScore, rtPictureURL
) values (28, 'Persuasion', 0114117, 'Persuasión', 'http://ia.media-imdb.com/images/M/MV5BNTQ2NDkxNzUwNF5BMl5BanBnXkFtZTcwMzE4NTcyMQ@@._V1._SY314_CR14,0,214,314_.jpg', 1995, '1066528-persuasion', 7.7, 23, 19, 4, 82, 8.5, 9, 9, 0, 100, 3.9, 7968, 82, 'http://content6.flixster.com/movie/11/12/73/11127360_det.jpg');

INSERT INTO `MOVIES` (id, title, imdbID, spanishTitle, imdbPictureURL, year, rtID, rtAllCriticsRating, rtAllCriticsNumReviews, rtAllCriticsNumFresh, rtAllCriticsNumRotten, rtAllCriticsScore, rtTopCriticsRating, rtTopCriticsNumReviews, rtTopCriticsNumFresh, rtTopCriticsNumRotten, rtTopCriticsScore, rtAudienceRating, rtAudienceNumRatings, rtAudienceScore, rtPictureURL
) values (29, 'La cité des enfants perdus', 0112682, 'La ciudad de los niños perdidos', 'http://ia.media-imdb.com/images/M/MV5BMTI4MDc0ODgyMV5BMl5BanBnXkFtZTcwNjAzMzAyMQ@@._V1._SY314_CR3,0,214,314_.jpg', 1995, 'city_of_lost_children', 7, 33, 27, 6, 81, 7.2, 7, 5, 2, 71, 4, 22420, 89, 'http://content6.flixster.com/movie/26/78/267824_det.jpg');

INSERT INTO `MOVIES` (id, title, imdbID, spanishTitle, imdbPictureURL, year, rtID, rtAllCriticsRating, rtAllCriticsNumReviews, rtAllCriticsNumFresh, rtAllCriticsNumRotten, rtAllCriticsScore, rtTopCriticsRating, rtTopCriticsNumReviews, rtTopCriticsNumFresh, rtTopCriticsNumRotten, rtTopCriticsScore, rtAudienceRating, rtAudienceNumRatings, rtAudienceScore, rtPictureURL
) values (30, 'Yao a yao yao dao waipo qiao', 0115012, 'La joya de Shangai', 'http://ia.media-imdb.com/images/M/MV5BMTgyMzAwOTQyNF5BMl5BanBnXkFtZTcwNDU1MjgxMQ@@._V1._SY314_CR1,0,214,314_.jpg', 1995, 'shanghai_triad', 6.8, 21, 18, 3, 85, 0, 4, 3, 1, 75, 3.6, 1061, 70, 'http://content8.flixster.com/movie/10/90/31/10903162_det.jpg');

INSERT INTO `MOVIES` (id, title, imdbID, spanishTitle, imdbPictureURL, year, rtID, rtAllCriticsRating, rtAllCriticsNumReviews, rtAllCriticsNumFresh, rtAllCriticsNumRotten, rtAllCriticsScore, rtTopCriticsRating, rtTopCriticsNumReviews, rtTopCriticsNumFresh, rtTopCriticsNumRotten, rtTopCriticsScore, rtAudienceRating, rtAudienceNumRatings, rtAudienceScore, rtPictureURL
) values (31, 'Dangerous Minds', 0112792, 'Mentes peligrosas', 'http://ia.media-imdb.com/images/M/MV5BMTI3NDIyMjIyM15BMl5BanBnXkFtZTYwMzA3NjU5._V1._SY314_CR1,0,214,314_.jpg', 1995, 'dangerous_minds', 4.7, 37, 11, 26, 29, 5, 12, 5, 7, 41, 3.1, 12136, 66, 'http://content7.flixster.com/movie/26/98/269813_det.jpg');

INSERT INTO `MOVIES` (id, title, imdbID, spanishTitle, imdbPictureURL, year, rtID, rtAllCriticsRating, rtAllCriticsNumReviews, rtAllCriticsNumFresh, rtAllCriticsNumRotten, rtAllCriticsScore, rtTopCriticsRating, rtTopCriticsNumReviews, rtTopCriticsNumFresh, rtTopCriticsNumRotten, rtTopCriticsScore, rtAudienceRating, rtAudienceNumRatings, rtAudienceScore, rtPictureURL
) values (32, 'Twelve Monkeys', 0114746, 'Twelve monkeys: doce monos', 'http://ia.media-imdb.com/images/M/MV5BMTQwNzg2OTUzMV5BMl5BanBnXkFtZTYwMTg4ODU5._V1._SX214_CR0,0,214,314_.jpg', 1995, 'prem-no-public-issue', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'http://content6.flixster.com/movie/10/93/02/10930244_det.jpg');

INSERT INTO `MOVIES` (id, title, imdbID, spanishTitle, imdbPictureURL, year, rtID, rtAllCriticsRating, rtAllCriticsNumReviews, rtAllCriticsNumFresh, rtAllCriticsNumRotten, rtAllCriticsScore, rtTopCriticsRating, rtTopCriticsNumReviews, rtTopCriticsNumFresh, rtTopCriticsNumRotten, rtTopCriticsScore, rtAudienceRating, rtAudienceNumRatings, rtAudienceScore, rtPictureURL
) values (33, 'Wings of Courage', 0114952, 'Las alas del coraje', 'http://ia.media-imdb.com/images/M/MV5BMTc3ODY1MjA3OF5BMl5BanBnXkFtZTcwODgzOTgyMQ@@._V1._SX214_CR0,0,214,314_.jpg', 1995, ' ', 0, 4, 2, 2, 50, 0, 2, 1, 1, 50, 0, 0, 0, 'http://content7.flixster.com/movie/10/97/83/10978341_det.jpg');

INSERT INTO `MOVIES` (id, title, imdbID, spanishTitle, imdbPictureURL, year, rtID, rtAllCriticsRating, rtAllCriticsNumReviews, rtAllCriticsNumFresh, rtAllCriticsNumRotten, rtAllCriticsScore, rtTopCriticsRating, rtTopCriticsNumReviews, rtTopCriticsNumFresh, rtTopCriticsNumRotten, rtTopCriticsScore, rtAudienceRating, rtAudienceNumRatings, rtAudienceScore, rtPictureURL
) values (34, 'Babe', 0112431, 'Babe, el cerdito valiente', 'http://ia.media-imdb.com/images/M/MV5BMTIwNzY2OTIzN15BMl5BanBnXkFtZTcwNjcxODAzMQ@@._V1._SY314_CR6,0,214,314_.jpg', 1995, '1065598-babe', 8.2, 54, 53, 1, 98, 8.2, 11, 11, 0, 100, 3, 22954, 54, 'http://content7.flixster.com/movie/25/32/253205_det.jpg');

INSERT INTO `MOVIES` (id, title, imdbID, spanishTitle, imdbPictureURL, year, rtID, rtAllCriticsRating, rtAllCriticsNumReviews, rtAllCriticsNumFresh, rtAllCriticsNumRotten, rtAllCriticsScore, rtTopCriticsRating, rtTopCriticsNumReviews, rtTopCriticsNumFresh, rtTopCriticsNumRotten, rtTopCriticsScore, rtAudienceRating, rtAudienceNumRatings, rtAudienceScore, rtPictureURL
) values (35, 'Carrington', 0112637, 'Carrington', 'http://ia.media-imdb.com/images/M/MV5BMTI5NjcxMjc4MV5BMl5BanBnXkFtZTcwOTEzMDYxMQ@@._V1._SX214_CR0,0,214,314_.jpg', 1995, 'carrington', 6.2, 19, 9, 10, 47, 7.4, 5, 4, 1, 80, 3.5, 781, 68, 'http://content7.flixster.com/movie/28/00/280009_det.jpg');

INSERT INTO `MOVIES` (id, title, imdbID, spanishTitle, imdbPictureURL, year, rtID, rtAllCriticsRating, rtAllCriticsNumReviews, rtAllCriticsNumFresh, rtAllCriticsNumRotten, rtAllCriticsScore, rtTopCriticsRating, rtTopCriticsNumReviews, rtTopCriticsNumFresh, rtTopCriticsNumRotten, rtTopCriticsScore, rtAudienceRating, rtAudienceNumRatings, rtAudienceScore, rtPictureURL
) values (36, 'Dead Man Walking', 0112818, 'Pena de muerte (Dead Man Walking)', 'http://ia.media-imdb.com/images/M/MV5BOTUxMDg5NTAzMF5BMl5BanBnXkFtZTcwNTYyOTYyMQ@@._V1._SY314_CR4,0,214,314_.jpg', 1995, '1068779-dead_man_walking', 8.2, 53, 50, 3, 94, 7.9, 20, 18, 2, 90, 3.6, 15450, 81, 'http://content6.flixster.com/movie/10/88/77/10887764_det.jpg');

INSERT INTO `MOVIES` (id, title, imdbID, spanishTitle, imdbPictureURL, year, rtID, rtAllCriticsRating, rtAllCriticsNumReviews, rtAllCriticsNumFresh, rtAllCriticsNumRotten, rtAllCriticsScore, rtTopCriticsRating, rtTopCriticsNumReviews, rtTopCriticsNumFresh, rtTopCriticsNumRotten, rtTopCriticsScore, rtAudienceRating, rtAudienceNumRatings, rtAudienceScore, rtPictureURL
) values (37, 'Across the Sea of Time', 0112286, 'Across the Sea of Time', 'http://ia.media-imdb.com/images/M/MV5BNTQyMTE3MzY4Nl5BMl5BanBnXkFtZTcwMzY5MTAyMQ@@._V1._SX78_SY140_.jpg', 1995, 'across_the_sea_of_time', 0, 4, 2, 2, 50, 0, 1, 0, 1, 0, 2.9, 237, 27, 'http://content6.flixster.com/movie/10/90/58/10905808_det.jpg');

INSERT INTO `MOVIES` (id, title, imdbID, spanishTitle, imdbPictureURL, year, rtID, rtAllCriticsRating, rtAllCriticsNumReviews, rtAllCriticsNumFresh, rtAllCriticsNumRotten, rtAllCriticsScore, rtTopCriticsRating, rtTopCriticsNumReviews, rtTopCriticsNumFresh, rtTopCriticsNumRotten, rtTopCriticsScore, rtAudienceRating, rtAudienceNumRatings, rtAudienceScore, rtPictureURL
) values (38, 'It Takes Two', 0113442, 'Dos por el precio de una', 'http://ia.media-imdb.com/images/M/MV5BMTcyMjY3NzkwMV5BMl5BanBnXkFtZTcwNzE1NjUyMQ@@._V1._SY314_CR3,0,214,314_.jpg', 1995, '1067137-it_takes_two', 3.9, 24, 2, 22, 8, 4.6, 8, 2, 6, 25, 2.9, 16311, 63, 'http://content7.flixster.com/movie/25/74/257417_det.jpg');

INSERT INTO `MOVIES` (id, title, imdbID, spanishTitle, imdbPictureURL, year, rtID, rtAllCriticsRating, rtAllCriticsNumReviews, rtAllCriticsNumFresh, rtAllCriticsNumRotten, rtAllCriticsScore, rtTopCriticsRating, rtTopCriticsNumReviews, rtTopCriticsNumFresh, rtTopCriticsNumRotten, rtTopCriticsScore, rtAudienceRating, rtAudienceNumRatings, rtAudienceScore, rtPictureURL
) values (39, 'Clueless', 0112697, 'Clueless: fuera de onda', 'http://ia.media-imdb.com/images/M/MV5BNjQxNTA1NjE5Ml5BMl5BanBnXkFtZTYwOTMwNzE5._V1._SY314_CR3,0,214,314_.jpg', 1995, 'school_of_senses', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'http://content8.flixster.com/movie/10/85/01/10850110_det.jpg');

INSERT INTO `MOVIES` (id, title, imdbID, spanishTitle, imdbPictureURL, year, rtID, rtAllCriticsRating, rtAllCriticsNumReviews, rtAllCriticsNumFresh, rtAllCriticsNumRotten, rtAllCriticsScore, rtTopCriticsRating, rtTopCriticsNumReviews, rtTopCriticsNumFresh, rtTopCriticsNumRotten, rtTopCriticsScore, rtAudienceRating, rtAudienceNumRatings, rtAudienceScore, rtPictureURL
) values (40, 'Cry, the Beloved Country', 0112749, 'Llanto por la tierra amada', 'http://ia.media-imdb.com/images/M/MV5BMTcwMDU1OTEwOF5BMl5BanBnXkFtZTcwMTg5NjEyMQ@@._V1._SY314_CR3,0,214,314_.jpg', 1995, '1068781-cry_the_beloved_country', 7.2, 13, 10, 3, 76, 0, 4, 3, 1, 75, 3.5, 520, 66, 'http://content6.flixster.com/movie/10/89/59/10895996_det.jpg');

INSERT INTO `MOVIES` (id, title, imdbID, spanishTitle, imdbPictureURL, year, rtID, rtAllCriticsRating, rtAllCriticsNumReviews, rtAllCriticsNumFresh, rtAllCriticsNumRotten, rtAllCriticsScore, rtTopCriticsRating, rtTopCriticsNumReviews, rtTopCriticsNumFresh, rtTopCriticsNumRotten, rtTopCriticsScore, rtAudienceRating, rtAudienceNumRatings, rtAudienceScore, rtPictureURL
) values (41, 'Richard III', 0114279, 'Ricardo III (Richard III)', 'http://ia.media-imdb.com/images/M/MV5BMjEzMjAxOTQzMV5BMl5BanBnXkFtZTcwMTYyNjIyMQ@@._V1._SY314_CR0,0,214,314_.jpg', 1995, '1068177-richard_iii', 8.1, 43, 41, 2, 95, 7.6, 11, 10, 1, 90, 3.7, 1552, 82, 'http://content7.flixster.com/movie/26/89/268909_det.jpg');

INSERT INTO `MOVIES` (id, title, imdbID, spanishTitle, imdbPictureURL, year, rtID, rtAllCriticsRating, rtAllCriticsNumReviews, rtAllCriticsNumFresh, rtAllCriticsNumRotten, rtAllCriticsScore, rtTopCriticsRating, rtTopCriticsNumReviews, rtTopCriticsNumFresh, rtTopCriticsNumRotten, rtTopCriticsScore, rtAudienceRating, rtAudienceNumRatings, rtAudienceScore, rtPictureURL
) values (42, 'Dead Presidents', 0112819, 'Dinero para quemar', 'http://ia.media-imdb.com/images/M/MV5BMzE0NTI0MTM5MV5BMl5BanBnXkFtZTcwMzYwMTYyMQ@@._V1._SX214_CR0,0,214,314_.jpg', 1995, 'dead_presidents', 5.7, 31, 14, 17, 45, 6.3, 12, 7, 5, 58, 3.3, 4475, 75, 'http://content7.flixster.com/movie/26/95/269521_det.jpg');

INSERT INTO `MOVIES` (id, title, imdbID, spanishTitle, imdbPictureURL, year, rtID, rtAllCriticsRating, rtAllCriticsNumReviews, rtAllCriticsNumFresh, rtAllCriticsNumRotten, rtAllCriticsScore, rtTopCriticsRating, rtTopCriticsNumReviews, rtTopCriticsNumFresh, rtTopCriticsNumRotten, rtTopCriticsScore, rtAudienceRating, rtAudienceNumRatings, rtAudienceScore, rtPictureURL
) values (43, 'Restoration', 0114272, 'Restauración', 'http://ia.media-imdb.com/images/M/MV5BMTI5MDM4OTQ0Ml5BMl5BanBnXkFtZTcwMzU2MTYyMQ@@._V1._SY314_CR1,0,214,314_.jpg', 1995, '1069339-restoration', 6.3, 31, 21, 10, 67, 6.4, 10, 6, 4, 60, 3.3, 1103, 56, 'http://content6.flixster.com/movie/27/04/270404_det.jpg');

INSERT INTO `MOVIES` (id, title, imdbID, spanishTitle, imdbPictureURL, year, rtID, rtAllCriticsRating, rtAllCriticsNumReviews, rtAllCriticsNumFresh, rtAllCriticsNumRotten, rtAllCriticsScore, rtTopCriticsRating, rtTopCriticsNumReviews, rtTopCriticsNumFresh, rtTopCriticsNumRotten, rtTopCriticsScore, rtAudienceRating, rtAudienceNumRatings, rtAudienceScore, rtPictureURL
) values (44, 'Mortal Kombat', 0113855, 'Mortal Kombat', 'http://ia.media-imdb.com/images/M/MV5BMTI3MzM0ODE4Nl5BMl5BanBnXkFtZTcwMDA3MTgyMQ@@._V1._SY314_CR18,0,214,314_.jpg', 1995, 'mortal_kombat', 4.4, 26, 9, 17, 34, 3.9, 6, 2, 4, 33, 2.8, 18291, 55, 'http://content9.flixster.com/movie/25/63/256395_det.jpg');

INSERT INTO `MOVIES` (id, title, imdbID, spanishTitle, imdbPictureURL, year, rtID, rtAllCriticsRating, rtAllCriticsNumReviews, rtAllCriticsNumFresh, rtAllCriticsNumRotten, rtAllCriticsScore, rtTopCriticsRating, rtTopCriticsNumReviews, rtTopCriticsNumFresh, rtTopCriticsNumRotten, rtTopCriticsScore, rtAudienceRating, rtAudienceNumRatings, rtAudienceScore, rtPictureURL
) values (45, 'Live Free or Die Hard', 0337978, 'La jungla 4.0', 'http://ia.media-imdb.com/images/M/MV5BNDQxMDE1OTg4NV5BMl5BanBnXkFtZTcwMTMzOTQzMw@@._V1._SX214_CR0,0,214,314_.jpg', 2007, 'live_free_or_die_hard', 6.8, 197, 161, 36, 81, 6.7, 38, 30, 8, 78, 3.9, 1145097, 86, 'http://content8.flixster.com/movie/10/93/34/10933482_det.jpg');

INSERT INTO `MOVIES` (id, title, imdbID, spanishTitle, imdbPictureURL, year, rtID, rtAllCriticsRating, rtAllCriticsNumReviews, rtAllCriticsNumFresh, rtAllCriticsNumRotten, rtAllCriticsScore, rtTopCriticsRating, rtTopCriticsNumReviews, rtTopCriticsNumFresh, rtTopCriticsNumRotten, rtTopCriticsScore, rtAudienceRating, rtAudienceNumRatings, rtAudienceScore, rtPictureURL
) values (46, 'How to Make an American Quilt', 0113347, 'Donde reside el amor', 'http://ia.media-imdb.com/images/M/MV5BNzY3NTQ0NTM0NV5BMl5BanBnXkFtZTcwODkwMzgxMQ@@._V1._SY314_CR3,0,214,314_.jpg', 1995, 'how_to_make_an_american_quilt', 5.6, 22, 11, 11, 50, 7.6, 6, 5, 1, 83, 3.2, 2626, 58, 'http://content8.flixster.com/movie/10/86/75/10867514_det.jpg');

INSERT INTO `MOVIES` (id, title, imdbID, spanishTitle, imdbPictureURL, year, rtID, rtAllCriticsRating, rtAllCriticsNumReviews, rtAllCriticsNumFresh, rtAllCriticsNumRotten, rtAllCriticsScore, rtTopCriticsRating, rtTopCriticsNumReviews, rtTopCriticsNumFresh, rtTopCriticsNumRotten, rtTopCriticsScore, rtAudienceRating, rtAudienceNumRatings, rtAudienceScore, rtPictureURL
) values (47, 'Shichinin no samurai', 0047478, 'Los siete samuráis', 'http://ia.media-imdb.com/images/M/MV5BNzg5Mzk5Nzc0NF5BMl5BanBnXkFtZTcwNjg3MDQzMQ@@._V1._SY314_CR4,0,214,314_.jpg', 1954, '1018639-seven_samurai', 9.2, 49, 49, 0, 100, 8.6, 10, 10, 0, 100, 4.5, 29509, 97, 'http://content7.flixster.com/movie/39/91/08/3991085_det.jpg');

INSERT INTO `MOVIES` (id, title, imdbID, spanishTitle, imdbPictureURL, year, rtID, rtAllCriticsRating, rtAllCriticsNumReviews, rtAllCriticsNumFresh, rtAllCriticsNumRotten, rtAllCriticsScore, rtTopCriticsRating, rtTopCriticsNumReviews, rtTopCriticsNumFresh, rtTopCriticsNumRotten, rtTopCriticsScore, rtAudienceRating, rtAudienceNumRatings, rtAudienceScore, rtPictureURL
) values (48, 'Pocahontas', 0114148, 'Pocahontas', 'http://ia.media-imdb.com/images/M/MV5BMTM5NDI5MzAwOV5BMl5BanBnXkFtZTcwODcwMjgyMQ@@._V1._SY314_CR5,0,214,314_.jpg', 1995, '1063452-pocahontas', 6, 49, 27, 22, 55, 6.6, 14, 10, 4, 71, 3.2, 37858, 63, 'http://content6.flixster.com/movie/25/15/251508_det.jpg');

INSERT INTO `MOVIES` (id, title, imdbID, spanishTitle, imdbPictureURL, year, rtID, rtAllCriticsRating, rtAllCriticsNumReviews, rtAllCriticsNumFresh, rtAllCriticsNumRotten, rtAllCriticsScore, rtTopCriticsRating, rtTopCriticsNumReviews, rtTopCriticsNumFresh, rtTopCriticsNumRotten, rtTopCriticsScore, rtAudienceRating, rtAudienceNumRatings, rtAudienceScore, rtPictureURL
) values (49, 'When Night Is Falling', 0114916, 'Cuando cae la noche', 'http://ia.media-imdb.com/images/M/MV5BMTI2OTU5MDMzN15BMl5BanBnXkFtZTcwMTkxNTEzMQ@@._V1._SY314_CR2,0,214,314_.jpg', 1995, 'when_night_is_falling', 5.7, 16, 8, 8, 50, 0, 4, 1, 3, 25, 3.9, 1132, 83, 'http://content6.flixster.com/movie/10/89/77/10897780_det.jpg');

INSERT INTO `MOVIES` (id, title, imdbID, spanishTitle, imdbPictureURL, year, rtID, rtAllCriticsRating, rtAllCriticsNumReviews, rtAllCriticsNumFresh, rtAllCriticsNumRotten, rtAllCriticsScore, rtTopCriticsRating, rtTopCriticsNumReviews, rtTopCriticsNumFresh, rtTopCriticsNumRotten, rtTopCriticsScore, rtAudienceRating, rtAudienceNumRatings, rtAudienceScore, rtPictureURL
) values (50, 'The Usual Suspects', 0114814, 'Sospechosos habituales', 'http://ia.media-imdb.com/images/M/MV5BMTg0NzIyMTA3M15BMl5BanBnXkFtZTcwMDQ3MjI3Mw@@._V1._SX214_CR0,0,214,314_.jpg', 1995, 'usual_suspects', 7.5, 47, 41, 6, 87, 6.9, 14, 12, 2, 85, 4.2, 109588, 95, 'http://content7.flixster.com/movie/24/63/48/2463485_det.jpg');

INSERT INTO `MOVIES` (id, title, imdbID, spanishTitle, imdbPictureURL, year, rtID, rtAllCriticsRating, rtAllCriticsNumReviews, rtAllCriticsNumFresh, rtAllCriticsNumRotten, rtAllCriticsScore, rtTopCriticsRating, rtTopCriticsNumReviews, rtTopCriticsNumFresh, rtTopCriticsNumRotten, rtTopCriticsScore, rtAudienceRating, rtAudienceNumRatings, rtAudienceScore, rtPictureURL
) values (52, 'Mighty Aphrodite', 0113819, 'Poderosa Afrodita', 'http://ia.media-imdb.com/images/M/MV5BMTUzMzE3Nzg5Ml5BMl5BanBnXkFtZTcwNTIxNDEyMQ@@._V1._SY314_CR3,0,214,314_.jpg', 1995, 'mighty_aphrodite', 6.7, 33, 25, 8, 75, 7.2, 6, 4, 2, 66, 3.3, 4866, 69, 'http://content7.flixster.com/movie/10/84/18/10841893_det.jpg');


### BEGIN CREATE TABLE MOVIE_ACTORS
DROP TABLE IF EXISTS `MOVIE_ACTORS`;
CREATE TABLE `MOVIE_ACTORS` ( 
`movieID` INTEGER,
`actorID` VARCHAR(255),
`actorName` VARCHAR(255),
`ranking` FLOAT) ENGINE=InnoDB DEFAULT CHARSET=utf8;
#### END CREATE TABLE MOVIE_ACTORS


INSERT INTO `MOVIE_ACTORS` (movieID, actorID, actorName, ranking
) values (1, 'bill_farmer', 'Bill Farmer', 20);

INSERT INTO `MOVIE_ACTORS` (movieID, actorID, actorName, ranking
) values (1, 'don_rickles', 'Don Rickles', 3);

INSERT INTO `MOVIE_ACTORS` (movieID, actorID, actorName, ranking
) values (1, 'erik_von_detten', 'Erik von Detten', 13);

INSERT INTO `MOVIE_ACTORS` (movieID, actorID, actorName, ranking
) values (1, 'greg-berg', 'Greg Berg', 17);

INSERT INTO `MOVIE_ACTORS` (movieID, actorID, actorName, ranking
) values (1, 'jack_angel', 'Jack Angel', 6);

INSERT INTO `MOVIE_ACTORS` (movieID, actorID, actorName, ranking
) values (1, 'jan_rabson', 'Jan Rabson', 19);

INSERT INTO `MOVIE_ACTORS` (movieID, actorID, actorName, ranking
) values (1, 'jim_varney', 'Jim Varney', 4);

INSERT INTO `MOVIE_ACTORS` (movieID, actorID, actorName, ranking
) values (1, 'joan_cusack', 'Joan Cusack', 24);

INSERT INTO `MOVIE_ACTORS` (movieID, actorID, actorName, ranking
) values (1, 'joe-ranft', 'Joe Ranft', 16);

INSERT INTO `MOVIE_ACTORS` (movieID, actorID, actorName, ranking
) values (1, 'john_morris', 'John Morris', 23);

INSERT INTO `MOVIE_ACTORS` (movieID, actorID, actorName, ranking
) values (1, 'john_ratzenberger', 'John Ratzenberger', 12);

INSERT INTO `MOVIE_ACTORS` (movieID, actorID, actorName, ranking
) values (1, 'kendall_cunningham', 'Kendall Cunningham', 21);

INSERT INTO `MOVIE_ACTORS` (movieID, actorID, actorName, ranking
) values (1, 'laurie_metcalf', 'Laurie Metcalf', 8);

INSERT INTO `MOVIE_ACTORS` (movieID, actorID, actorName, ranking
) values (1, 'patrick_pinney', 'Patrick Pinney', 9);

INSERT INTO `MOVIE_ACTORS` (movieID, actorID, actorName, ranking
) values (1, 'penn_jillette', 'Penn Jillette', 15);

INSERT INTO `MOVIE_ACTORS` (movieID, actorID, actorName, ranking
) values (1, 'philip_proctor', 'Philip Proctor', 11);

INSERT INTO `MOVIE_ACTORS` (movieID, actorID, actorName, ranking
) values (1, 'r_lee_ermey', 'R. Lee Ermey', 14);

INSERT INTO `MOVIE_ACTORS` (movieID, actorID, actorName, ranking
) values (1, 'sarah_freeman', 'Sarah Freeman', 22);

INSERT INTO `MOVIE_ACTORS` (movieID, actorID, actorName, ranking
) values (1, 'scott_mcafee', 'Scott McAfee', 18);

INSERT INTO `MOVIE_ACTORS` (movieID, actorID, actorName, ranking
) values (1, 'sherry_lynn', 'Sherry Lynn', 7);

INSERT INTO `MOVIE_ACTORS` (movieID, actorID, actorName, ranking
) values (1, 'tim_allen', 'Tim Allen', 2);

INSERT INTO `MOVIE_ACTORS` (movieID, actorID, actorName, ranking
) values (1, 'tom_hanks', 'Tom Hanks', 1);

INSERT INTO `MOVIE_ACTORS` (movieID, actorID, actorName, ranking
) values (1, 'wallace_shawn', 'Wallace Shawn', 5);

INSERT INTO `MOVIE_ACTORS` (movieID, actorID, actorName, ranking
) values (2, '1135379-peter_bryant', 'Peter Bryant', 16);

INSERT INTO `MOVIE_ACTORS` (movieID, actorID, actorName, ranking
) values (2, 'adam_hannbyrd', 'Adam Hann-Byrd', 13);

INSERT INTO `MOVIE_ACTORS` (movieID, actorID, actorName, ranking
) values (2, 'bebe_neuwirth', 'Bebe Neuwirth', 5);

INSERT INTO `MOVIE_ACTORS` (movieID, actorID, actorName, ranking
) values (2, 'bonnie_hunt', 'Bonnie Hunt', 2);

INSERT INTO `MOVIE_ACTORS` (movieID, actorID, actorName, ranking
) values (2, 'bradley_pierce', 'Bradley Pierce', 4);

INSERT INTO `MOVIE_ACTORS` (movieID, actorID, actorName, ranking
) values (2, 'darryl_henriques', 'Darryl Henriques', 14);

INSERT INTO `MOVIE_ACTORS` (movieID, actorID, actorName, ranking
) values (2, 'david_alan_grier', 'David Alan Grier', 11);

INSERT INTO `MOVIE_ACTORS` (movieID, actorID, actorName, ranking
) values (2, 'david_hyde_pierce', 'David Hyde Pierce', 18);

INSERT INTO `MOVIE_ACTORS` (movieID, actorID, actorName, ranking
) values (2, 'gillian_barber', 'Gillian Barber', 7);

INSERT INTO `MOVIE_ACTORS` (movieID, actorID, actorName, ranking
) values (2, 'james_handy', 'James Handy', 12);

INSERT INTO `MOVIE_ACTORS` (movieID, actorID, actorName, ranking
) values (2, 'jonathan_hyde', 'Jonathan Hyde', 6);

INSERT INTO `MOVIE_ACTORS` (movieID, actorID, actorName, ranking
) values (2, 'kirsten_dunst', 'Kirsten Dunst', 3);

INSERT INTO `MOVIE_ACTORS` (movieID, actorID, actorName, ranking
) values (2, 'laura_bell_bundy', 'Laura Bell Bundy', 17);

INSERT INTO `MOVIE_ACTORS` (movieID, actorID, actorName, ranking
) values (2, 'lloyd_berry', 'Lloyd Berry', 8);

INSERT INTO `MOVIE_ACTORS` (movieID, actorID, actorName, ranking
) values (2, 'malcolm_stewart', 'Malcolm Stewart', 15);

INSERT INTO `MOVIE_ACTORS` (movieID, actorID, actorName, ranking
) values (2, 'patricia_clarkson', 'Patricia Clarkson', 9);

INSERT INTO `MOVIE_ACTORS` (movieID, actorID, actorName, ranking
) values (2, 'robin_driscoll', 'Robin Driscoll', 10);

INSERT INTO `MOVIE_ACTORS` (movieID, actorID, actorName, ranking
) values (2, 'robin_williams', 'Robin Williams', 1);

INSERT INTO `MOVIE_ACTORS` (movieID, actorID, actorName, ranking
) values (3, 'annmargret', 'Ann-Margret', 3);

INSERT INTO `MOVIE_ACTORS` (movieID, actorID, actorName, ranking
) values (3, 'buck_henry', 'Buck Henry', 8);

INSERT INTO `MOVIE_ACTORS` (movieID, actorID, actorName, ranking
) values (3, 'buffy_sedlachek', 'Buffy Sedlachek', 13);

INSERT INTO `MOVIE_ACTORS` (movieID, actorID, actorName, ranking
) values (3, 'burgess_meredith', 'Burgess Meredith', 4);

INSERT INTO `MOVIE_ACTORS` (movieID, actorID, actorName, ranking
) values (3, 'christopher_mcdonald', 'Christopher McDonald', 9);

INSERT INTO `MOVIE_ACTORS` (movieID, actorID, actorName, ranking
) values (3, 'daryl_hannah', 'Daryl Hannah', 5);

INSERT INTO `MOVIE_ACTORS` (movieID, actorID, actorName, ranking
) values (3, 'isabell_oconnor', 'Isabell Monk', 12);

INSERT INTO `MOVIE_ACTORS` (movieID, actorID, actorName, ranking
) values (3, 'jack_lemmon', 'Jack Lemmon', 1);

INSERT INTO `MOVIE_ACTORS` (movieID, actorID, actorName, ranking
) values (3, 'joe_howard', 'Joe Howard', 10);


### BEGIN CREATE TABLE MOVIE_COUNTRIES
DROP TABLE IF EXISTS `MOVIE_COUNTRIES`;
CREATE TABLE `MOVIE_COUNTRIES` ( 
`movieID` INTEGER,
`country` VARCHAR(255)) ENGINE=InnoDB DEFAULT CHARSET=utf8;
#### END CREATE TABLE MOVIE_COUNTRIES


INSERT INTO `MOVIE_COUNTRIES` (movieID, country
) values (2, 'USA');

INSERT INTO `MOVIE_COUNTRIES` (movieID, country
) values (3, 'USA');

INSERT INTO `MOVIE_COUNTRIES` (movieID, country
) values (4, 'USA');

INSERT INTO `MOVIE_COUNTRIES` (movieID, country
) values (5, 'USA');

INSERT INTO `MOVIE_COUNTRIES` (movieID, country
) values (6, 'USA');

INSERT INTO `MOVIE_COUNTRIES` (movieID, country
) values (7, 'USA');

INSERT INTO `MOVIE_COUNTRIES` (movieID, country
) values (8, 'USA');

INSERT INTO `MOVIE_COUNTRIES` (movieID, country
) values (9, 'USA');

INSERT INTO `MOVIE_COUNTRIES` (movieID, country
) values (10, 'UK');

INSERT INTO `MOVIE_COUNTRIES` (movieID, country
) values (11, 'USA');

INSERT INTO `MOVIE_COUNTRIES` (movieID, country
) values (12, 'USA');

INSERT INTO `MOVIE_COUNTRIES` (movieID, country
) values (13, 'USA');

INSERT INTO `MOVIE_COUNTRIES` (movieID, country
) values (14, 'USA');

INSERT INTO `MOVIE_COUNTRIES` (movieID, country
) values (15, 'USA');

INSERT INTO `MOVIE_COUNTRIES` (movieID, country
) values (16, 'USA');

INSERT INTO `MOVIE_COUNTRIES` (movieID, country
) values (17, 'USA');

INSERT INTO `MOVIE_COUNTRIES` (movieID, country
) values (18, 'USA');

INSERT INTO `MOVIE_COUNTRIES` (movieID, country
) values (19, 'USA');

INSERT INTO `MOVIE_COUNTRIES` (movieID, country
) values (20, 'USA');

INSERT INTO `MOVIE_COUNTRIES` (movieID, country
) values (21, 'USA');

INSERT INTO `MOVIE_COUNTRIES` (movieID, country
) values (22, 'USA');

INSERT INTO `MOVIE_COUNTRIES` (movieID, country
) values (23, 'USA');

INSERT INTO `MOVIE_COUNTRIES` (movieID, country
) values (24, 'USA');

INSERT INTO `MOVIE_COUNTRIES` (movieID, country
) values (25, 'France');

INSERT INTO `MOVIE_COUNTRIES` (movieID, country
) values (26, 'USA');

INSERT INTO `MOVIE_COUNTRIES` (movieID, country
) values (27, 'USA');

INSERT INTO `MOVIE_COUNTRIES` (movieID, country
) values (28, 'UK');

INSERT INTO `MOVIE_COUNTRIES` (movieID, country
) values (29, 'France');

INSERT INTO `MOVIE_COUNTRIES` (movieID, country
) values (30, 'France');

INSERT INTO `MOVIE_COUNTRIES` (movieID, country
) values (31, 'USA');

INSERT INTO `MOVIE_COUNTRIES` (movieID, country
) values (32, 'USA');

INSERT INTO `MOVIE_COUNTRIES` (movieID, country
) values (33, 'USA');

INSERT INTO `MOVIE_COUNTRIES` (movieID, country
) values (34, 'Australia');

INSERT INTO `MOVIE_COUNTRIES` (movieID, country
) values (35, 'UK');

INSERT INTO `MOVIE_COUNTRIES` (movieID, country
) values (36, 'UK');

INSERT INTO `MOVIE_COUNTRIES` (movieID, country
) values (37, 'USA');

INSERT INTO `MOVIE_COUNTRIES` (movieID, country
) values (38, 'USA');

INSERT INTO `MOVIE_COUNTRIES` (movieID, country
) values (39, 'USA');

INSERT INTO `MOVIE_COUNTRIES` (movieID, country
) values (40, 'South Africa');

INSERT INTO `MOVIE_COUNTRIES` (movieID, country
) values (41, 'UK');

INSERT INTO `MOVIE_COUNTRIES` (movieID, country
) values (42, 'USA');

INSERT INTO `MOVIE_COUNTRIES` (movieID, country
) values (43, 'USA');

INSERT INTO `MOVIE_COUNTRIES` (movieID, country
) values (44, 'USA');

INSERT INTO `MOVIE_COUNTRIES` (movieID, country
) values (45, 'USA');

INSERT INTO `MOVIE_COUNTRIES` (movieID, country
) values (46, 'USA');

INSERT INTO `MOVIE_COUNTRIES` (movieID, country
) values (47, 'Japan');

INSERT INTO `MOVIE_COUNTRIES` (movieID, country
) values (48, 'USA');

INSERT INTO `MOVIE_COUNTRIES` (movieID, country
) values (49, 'Canada');

INSERT INTO `MOVIE_COUNTRIES` (movieID, country
) values (50, 'USA');

INSERT INTO `MOVIE_COUNTRIES` (movieID, country
) values (52, 'USA');


### BEGIN CREATE TABLE MOVIE_DIRECTORS
DROP TABLE IF EXISTS `MOVIE_DIRECTORS`;
CREATE TABLE `MOVIE_DIRECTORS` ( 
`movieID` INTEGER,
`directorID` VARCHAR(255),
`directorName` VARCHAR(255)) ENGINE=InnoDB DEFAULT CHARSET=utf8;
#### END CREATE TABLE MOVIE_DIRECTORS


INSERT INTO `MOVIE_DIRECTORS` (movieID, directorID, directorName
) values (2, 'joe_johnston', 'Joe Johnston');

INSERT INTO `MOVIE_DIRECTORS` (movieID, directorID, directorName
) values (3, 'donald_petrie', 'Donald Petrie');

INSERT INTO `MOVIE_DIRECTORS` (movieID, directorID, directorName
) values (4, 'forest_whitaker', 'Forest Whitaker');

INSERT INTO `MOVIE_DIRECTORS` (movieID, directorID, directorName
) values (5, 'charles_shyer', 'Charles Shyer');

INSERT INTO `MOVIE_DIRECTORS` (movieID, directorID, directorName
) values (6, 'michael_mann', 'Michael Mann');

INSERT INTO `MOVIE_DIRECTORS` (movieID, directorID, directorName
) values (7, 'billy_wilder', 'Billy Wilder');

INSERT INTO `MOVIE_DIRECTORS` (movieID, directorID, directorName
) values (8, '1052316-peter_hewitt', 'Peter Hewitt');

INSERT INTO `MOVIE_DIRECTORS` (movieID, directorID, directorName
) values (9, 'peter_hyams', 'Peter Hyams');

INSERT INTO `MOVIE_DIRECTORS` (movieID, directorID, directorName
) values (10, 'martin_campbell', 'Martin Campbell');

INSERT INTO `MOVIE_DIRECTORS` (movieID, directorID, directorName
) values (11, 'rob_reiner', 'Rob Reiner');

INSERT INTO `MOVIE_DIRECTORS` (movieID, directorID, directorName
) values (12, 'mel_brooks', 'Mel Brooks');

INSERT INTO `MOVIE_DIRECTORS` (movieID, directorID, directorName
) values (13, 'simon_wells', 'Simon Wells');

INSERT INTO `MOVIE_DIRECTORS` (movieID, directorID, directorName
) values (14, 'oliver_stone', 'Oliver Stone');

INSERT INTO `MOVIE_DIRECTORS` (movieID, directorID, directorName
) values (15, 'renny_harlin', 'Renny Harlin');

INSERT INTO `MOVIE_DIRECTORS` (movieID, directorID, directorName
) values (16, 'martin_scorsese', 'Martin Scorsese');

INSERT INTO `MOVIE_DIRECTORS` (movieID, directorID, directorName
) values (17, 'ang_lee', 'Ang Lee');

INSERT INTO `MOVIE_DIRECTORS` (movieID, directorID, directorName
) values (18, 'alexandre_rockwell', 'Alexandre Rockwell');

INSERT INTO `MOVIE_DIRECTORS` (movieID, directorID, directorName
) values (19, 'steve_oedekerk', 'Steve Oedekerk');

INSERT INTO `MOVIE_DIRECTORS` (movieID, directorID, directorName
) values (20, 'joseph_ruben', 'Joseph Ruben');

INSERT INTO `MOVIE_DIRECTORS` (movieID, directorID, directorName
) values (21, 'barry_sonnenfeld', 'Barry Sonnenfeld');

INSERT INTO `MOVIE_DIRECTORS` (movieID, directorID, directorName
) values (22, 'jon_amiel', 'Jon Amiel');

INSERT INTO `MOVIE_DIRECTORS` (movieID, directorID, directorName
) values (23, '1165744-james_mcteigue', 'James McTeigue');

INSERT INTO `MOVIE_DIRECTORS` (movieID, directorID, directorName
) values (24, 'victor_salva', 'Victor Salva');

INSERT INTO `MOVIE_DIRECTORS` (movieID, directorID, directorName
) values (25, 'mike_figgis', 'Mike Figgis');

INSERT INTO `MOVIE_DIRECTORS` (movieID, directorID, directorName
) values (26, 'oliver_parker', 'Oliver Parker');

INSERT INTO `MOVIE_DIRECTORS` (movieID, directorID, directorName
) values (27, 'lesli_linka_glatter', 'Lesli Linka Glatter');

INSERT INTO `MOVIE_DIRECTORS` (movieID, directorID, directorName
) values (28, 'roger_michell', 'Roger Michell');

INSERT INTO `MOVIE_DIRECTORS` (movieID, directorID, directorName
) values (29, 'jeanpierre_jeunet', 'Jean-Pierre Jeunet');

INSERT INTO `MOVIE_DIRECTORS` (movieID, directorID, directorName
) values (30, 'zhang_yimou', 'Yimou Zhang');

INSERT INTO `MOVIE_DIRECTORS` (movieID, directorID, directorName
) values (31, 'john_n_smith', 'John N. Smith');

INSERT INTO `MOVIE_DIRECTORS` (movieID, directorID, directorName
) values (32, 'siddharth_randeria', 'Siddharth Randeria');

INSERT INTO `MOVIE_DIRECTORS` (movieID, directorID, directorName
) values (33, 'jeanjacques_annaud', 'Jean-Jacques Annaud');

INSERT INTO `MOVIE_DIRECTORS` (movieID, directorID, directorName
) values (34, 'chris_noonan', 'Chris Noonan');

INSERT INTO `MOVIE_DIRECTORS` (movieID, directorID, directorName
) values (35, 'christopher_hampton', 'Christopher Hampton');

INSERT INTO `MOVIE_DIRECTORS` (movieID, directorID, directorName
) values (36, 'tim_robbins', 'Tim Robbins');

INSERT INTO `MOVIE_DIRECTORS` (movieID, directorID, directorName
) values (37, 'stephan_low', 'Stephan Low');

INSERT INTO `MOVIE_DIRECTORS` (movieID, directorID, directorName
) values (38, 'andy_tennant', 'Andy Tennant');

INSERT INTO `MOVIE_DIRECTORS` (movieID, directorID, directorName
) values (39, 'andras-solyom', 'Andras Solyom');

INSERT INTO `MOVIE_DIRECTORS` (movieID, directorID, directorName
) values (40, 'darrell_roodt', 'Darrell Roodt');

INSERT INTO `MOVIE_DIRECTORS` (movieID, directorID, directorName
) values (41, 'richard_loncraine', 'Richard Loncraine');

INSERT INTO `MOVIE_DIRECTORS` (movieID, directorID, directorName
) values (42, 'albert_hughes', 'Albert Hughes');

INSERT INTO `MOVIE_DIRECTORS` (movieID, directorID, directorName
) values (43, 'michael_hoffman', 'Michael Hoffman');

INSERT INTO `MOVIE_DIRECTORS` (movieID, directorID, directorName
) values (44, 'paul_anderson', 'Paul W.S. Anderson');

INSERT INTO `MOVIE_DIRECTORS` (movieID, directorID, directorName
) values (45, 'len_wiseman', 'Len Wiseman');

INSERT INTO `MOVIE_DIRECTORS` (movieID, directorID, directorName
) values (46, 'jocelyn_moorhouse', 'Jocelyn Moorhouse');

INSERT INTO `MOVIE_DIRECTORS` (movieID, directorID, directorName
) values (47, 'akira_kurosawa', 'Akira Kurosawa');

INSERT INTO `MOVIE_DIRECTORS` (movieID, directorID, directorName
) values (48, 'mike-gabriel', 'Mike Gabriel');

INSERT INTO `MOVIE_DIRECTORS` (movieID, directorID, directorName
) values (49, 'patricia_rozema', 'Patricia Rozema');

INSERT INTO `MOVIE_DIRECTORS` (movieID, directorID, directorName
) values (50, 'bryan_singer', 'Bryan Singer');

INSERT INTO `MOVIE_DIRECTORS` (movieID, directorID, directorName
) values (52, 'woody_allen', 'Woody Allen');


### BEGIN CREATE TABLE MOVIE_GENRES
DROP TABLE IF EXISTS `MOVIE_GENRES`;
CREATE TABLE `MOVIE_GENRES` ( 
`movieID` INTEGER,
`genre` VARCHAR(255)) ENGINE=InnoDB DEFAULT CHARSET=utf8;
#### END CREATE TABLE MOVIE_GENRES


INSERT INTO `MOVIE_GENRES` (movieID, genre
) values (1, 'Animation');

INSERT INTO `MOVIE_GENRES` (movieID, genre
) values (1, 'Children');

INSERT INTO `MOVIE_GENRES` (movieID, genre
) values (1, 'Comedy');

INSERT INTO `MOVIE_GENRES` (movieID, genre
) values (1, 'Fantasy');

INSERT INTO `MOVIE_GENRES` (movieID, genre
) values (2, 'Adventure');

INSERT INTO `MOVIE_GENRES` (movieID, genre
) values (2, 'Children');

INSERT INTO `MOVIE_GENRES` (movieID, genre
) values (2, 'Fantasy');

INSERT INTO `MOVIE_GENRES` (movieID, genre
) values (3, 'Comedy');

INSERT INTO `MOVIE_GENRES` (movieID, genre
) values (3, 'Romance');

INSERT INTO `MOVIE_GENRES` (movieID, genre
) values (4, 'Comedy');

INSERT INTO `MOVIE_GENRES` (movieID, genre
) values (4, 'Drama');

INSERT INTO `MOVIE_GENRES` (movieID, genre
) values (4, 'Romance');

INSERT INTO `MOVIE_GENRES` (movieID, genre
) values (5, 'Comedy');

INSERT INTO `MOVIE_GENRES` (movieID, genre
) values (6, 'Action');

INSERT INTO `MOVIE_GENRES` (movieID, genre
) values (6, 'Crime');

INSERT INTO `MOVIE_GENRES` (movieID, genre
) values (6, 'Thriller');

INSERT INTO `MOVIE_GENRES` (movieID, genre
) values (7, 'Comedy');

INSERT INTO `MOVIE_GENRES` (movieID, genre
) values (7, 'Romance');

INSERT INTO `MOVIE_GENRES` (movieID, genre
) values (8, 'Adventure');

INSERT INTO `MOVIE_GENRES` (movieID, genre
) values (8, 'Children');

INSERT INTO `MOVIE_GENRES` (movieID, genre
) values (9, 'Action');

INSERT INTO `MOVIE_GENRES` (movieID, genre
) values (10, 'Action');

INSERT INTO `MOVIE_GENRES` (movieID, genre
) values (10, 'Adventure');

INSERT INTO `MOVIE_GENRES` (movieID, genre
) values (10, 'Thriller');

INSERT INTO `MOVIE_GENRES` (movieID, genre
) values (11, 'Comedy');

INSERT INTO `MOVIE_GENRES` (movieID, genre
) values (11, 'Drama');

INSERT INTO `MOVIE_GENRES` (movieID, genre
) values (11, 'Romance');

INSERT INTO `MOVIE_GENRES` (movieID, genre
) values (12, 'Comedy');

INSERT INTO `MOVIE_GENRES` (movieID, genre
) values (12, 'Horror');

INSERT INTO `MOVIE_GENRES` (movieID, genre
) values (13, 'Animation');

INSERT INTO `MOVIE_GENRES` (movieID, genre
) values (13, 'Children');

INSERT INTO `MOVIE_GENRES` (movieID, genre
) values (14, 'Drama');

INSERT INTO `MOVIE_GENRES` (movieID, genre
) values (15, 'Action');

INSERT INTO `MOVIE_GENRES` (movieID, genre
) values (15, 'Adventure');

INSERT INTO `MOVIE_GENRES` (movieID, genre
) values (15, 'Romance');

INSERT INTO `MOVIE_GENRES` (movieID, genre
) values (16, 'Crime');

INSERT INTO `MOVIE_GENRES` (movieID, genre
) values (16, 'Drama');

INSERT INTO `MOVIE_GENRES` (movieID, genre
) values (17, 'Comedy');

INSERT INTO `MOVIE_GENRES` (movieID, genre
) values (17, 'Drama');

INSERT INTO `MOVIE_GENRES` (movieID, genre
) values (17, 'Romance');

INSERT INTO `MOVIE_GENRES` (movieID, genre
) values (18, 'Comedy');

INSERT INTO `MOVIE_GENRES` (movieID, genre
) values (18, 'Drama');

INSERT INTO `MOVIE_GENRES` (movieID, genre
) values (18, 'Thriller');

INSERT INTO `MOVIE_GENRES` (movieID, genre
) values (19, 'Comedy');

INSERT INTO `MOVIE_GENRES` (movieID, genre
) values (20, 'Action');

INSERT INTO `MOVIE_GENRES` (movieID, genre
) values (20, 'Comedy');

INSERT INTO `MOVIE_GENRES` (movieID, genre
) values (20, 'Crime');

INSERT INTO `MOVIE_GENRES` (movieID, genre
) values (20, 'Drama');

INSERT INTO `MOVIE_GENRES` (movieID, genre
) values (20, 'Thriller');

INSERT INTO `MOVIE_GENRES` (movieID, genre
) values (21, 'Action');


### BEGIN CREATE TABLE MOVIE_LOCATIONS
DROP TABLE IF EXISTS `MOVIE_LOCATIONS`;
CREATE TABLE `MOVIE_LOCATIONS` ( 
`movieID` INTEGER,
`location1` VARCHAR(255),
`location2` VARCHAR(255),
`location3` VARCHAR(255),
`location4` VARCHAR(255)) ENGINE=InnoDB DEFAULT CHARSET=utf8;
#### END CREATE TABLE MOVIE_LOCATIONS


INSERT INTO `MOVIE_LOCATIONS` (movieID, location1, location2, location3, location4
) values (2, 'Canada', 'British Columbia', ' ', ' ');

INSERT INTO `MOVIE_LOCATIONS` (movieID, location1, location2, location3, location4
) values (2, 'Canada', 'British Columbia', 'Delta', ' ');

INSERT INTO `MOVIE_LOCATIONS` (movieID, location1, location2, location3, location4
) values (2, 'Canada', 'British Columbia', 'Delta', 'Tsawwassen');

INSERT INTO `MOVIE_LOCATIONS` (movieID, location1, location2, location3, location4
) values (2, 'Canada', 'British Columbia', 'Maple Ridge', ' ');

INSERT INTO `MOVIE_LOCATIONS` (movieID, location1, location2, location3, location4
) values (2, 'Canada', 'British Columbia', 'Vancouver', ' ');

INSERT INTO `MOVIE_LOCATIONS` (movieID, location1, location2, location3, location4
) values (2, 'USA', 'Maine', ' ', ' ');

INSERT INTO `MOVIE_LOCATIONS` (movieID, location1, location2, location3, location4
) values (2, 'USA', 'Maine', 'Kennebunk', ' ');

INSERT INTO `MOVIE_LOCATIONS` (movieID, location1, location2, location3, location4
) values (2, 'USA', 'Maine', 'North Berwick', ' ');

INSERT INTO `MOVIE_LOCATIONS` (movieID, location1, location2, location3, location4
) values (2, 'USA', 'New Hampshire', ' ', ' ');

INSERT INTO `MOVIE_LOCATIONS` (movieID, location1, location2, location3, location4
) values (2, 'USA', 'New Hampshire', 'Keene', ' ');

INSERT INTO `MOVIE_LOCATIONS` (movieID, location1, location2, location3, location4
) values (2, 'USA', 'New Hampshire', 'Keene', 'Main Street');

INSERT INTO `MOVIE_LOCATIONS` (movieID, location1, location2, location3, location4
) values (2, 'USA', 'New Hampshire', 'Swanzey', ' ');

INSERT INTO `MOVIE_LOCATIONS` (movieID, location1, location2, location3, location4
) values (3, 'USA', 'California', 'Burbank', 'Stage 16, Warner Brothers Burbank Studios - 4000 Warner Boulevard');

INSERT INTO `MOVIE_LOCATIONS` (movieID, location1, location2, location3, location4
) values (3, 'USA', 'Minnesota', 'Center City', ' ');

INSERT INTO `MOVIE_LOCATIONS` (movieID, location1, location2, location3, location4
) values (3, 'USA', 'Minnesota', 'Chanhassen', 'Paisley Park');

INSERT INTO `MOVIE_LOCATIONS` (movieID, location1, location2, location3, location4
) values (3, 'USA', 'Minnesota', 'Chanhassen', 'Paisley Park Studios - 7801 Audubon Road');

INSERT INTO `MOVIE_LOCATIONS` (movieID, location1, location2, location3, location4
) values (3, 'USA', 'Minnesota', 'Faribault', ' ');

INSERT INTO `MOVIE_LOCATIONS` (movieID, location1, location2, location3, location4
) values (3, 'USA', 'Minnesota', 'Red Wing', ' ');

INSERT INTO `MOVIE_LOCATIONS` (movieID, location1, location2, location3, location4
) values (3, 'USA', 'Minnesota', 'Rockford', 'Lake Rebecca');

INSERT INTO `MOVIE_LOCATIONS` (movieID, location1, location2, location3, location4
) values (3, 'USA', 'Minnesota', 'South St. Paul', 'Divine Redeemer Hospital - 724 19th Avenue N.');

INSERT INTO `MOVIE_LOCATIONS` (movieID, location1, location2, location3, location4
) values (3, 'USA', 'Minnesota', 'St. Paul', 'Hyacinth Avenue E & Frank Street');

INSERT INTO `MOVIE_LOCATIONS` (movieID, location1, location2, location3, location4
) values (3, 'USA', 'Minnesota', 'Stillwater', ' ');

INSERT INTO `MOVIE_LOCATIONS` (movieID, location1, location2, location3, location4
) values (4, 'USA', 'Arizona', 'Chandler', ' ');

INSERT INTO `MOVIE_LOCATIONS` (movieID, location1, location2, location3, location4
) values (4, 'USA', 'Arizona', 'Fountain Hills', ' ');

INSERT INTO `MOVIE_LOCATIONS` (movieID, location1, location2, location3, location4
) values (4, 'USA', 'Arizona', 'Paradise Valley', 'Hermosa Inn - 5532 N. Palo Cristi Road');

INSERT INTO `MOVIE_LOCATIONS` (movieID, location1, location2, location3, location4
) values (4, 'USA', 'Arizona', 'Phoenix', ' ');

INSERT INTO `MOVIE_LOCATIONS` (movieID, location1, location2, location3, location4
) values (4, 'USA', 'Utah', 'Monument Valley', ' ');

INSERT INTO `MOVIE_LOCATIONS` (movieID, location1, location2, location3, location4
) values (5, 'USA', 'California', 'Altadena', ' ');

INSERT INTO `MOVIE_LOCATIONS` (movieID, location1, location2, location3, location4
) values (5, 'USA', 'California', 'Pasadena', ' ');

INSERT INTO `MOVIE_LOCATIONS` (movieID, location1, location2, location3, location4
) values (5, 'USA', 'California', 'Pasadena', '843 S. El Molino Avenue');

INSERT INTO `MOVIE_LOCATIONS` (movieID, location1, location2, location3, location4
) values (5, 'USA', 'California', 'Whittier', ' ');

INSERT INTO `MOVIE_LOCATIONS` (movieID, location1, location2, location3, location4
) values (6, 'USA', 'California', 'Beverly Hills', 'Kate Mantilini - 9101 Wilshire Boulevard');

INSERT INTO `MOVIE_LOCATIONS` (movieID, location1, location2, location3, location4
) values (6, 'USA', 'California', 'El Segundo', 'Interstate 105');

INSERT INTO `MOVIE_LOCATIONS` (movieID, location1, location2, location3, location4
) values (6, 'USA', 'California', 'Gardena', 'Metro Green Line, Marine/Redondo Station - 2406 Marine Avenue');

INSERT INTO `MOVIE_LOCATIONS` (movieID, location1, location2, location3, location4
) values (6, 'USA', 'California', 'Long Beach', 'Harbor Place Tower - 525 E. Seaside Way');

INSERT INTO `MOVIE_LOCATIONS` (movieID, location1, location2, location3, location4
) values (6, 'USA', 'California', 'Los Angeles', ' ');

INSERT INTO `MOVIE_LOCATIONS` (movieID, location1, location2, location3, location4
) values (6, 'USA', 'California', 'Los Angeles', '444 S. Flower Street, Downtown');

INSERT INTO `MOVIE_LOCATIONS` (movieID, location1, location2, location3, location4
) values (6, 'USA', 'California', 'Los Angeles', '5th Street, Flower Street and Figueroa Street.');

INSERT INTO `MOVIE_LOCATIONS` (movieID, location1, location2, location3, location4
) values (6, 'USA', 'California', 'Los Angeles', 'Angeleno Hotel - 170 N. Church Lane');

INSERT INTO `MOVIE_LOCATIONS` (movieID, location1, location2, location3, location4
) values (6, 'USA', 'California', 'Los Angeles', 'Centinela Drive-In Theater - 5700 Centinela Avenue, Westchester');

INSERT INTO `MOVIE_LOCATIONS` (movieID, location1, location2, location3, location4
) values (6, 'USA', 'California', 'Los Angeles', 'Far East Bank - 350 S. Grand Avenue');

INSERT INTO `MOVIE_LOCATIONS` (movieID, location1, location2, location3, location4
) values (6, 'USA', 'California', 'Los Angeles', 'Los Angeles Airport Hilton and Towers - 5711 W. Century Blvd., Westchester');

INSERT INTO `MOVIE_LOCATIONS` (movieID, location1, location2, location3, location4
) values (6, 'USA', 'California', 'Los Angeles', 'Los Angeles Harbor, San Pedro');

INSERT INTO `MOVIE_LOCATIONS` (movieID, location1, location2, location3, location4
) values (6, 'USA', 'California', 'Los Angeles', 'Los Angeles International Airport - 1 World Way');

INSERT INTO `MOVIE_LOCATIONS` (movieID, location1, location2, location3, location4
) values (6, 'USA', 'California', 'Los Angeles', 'San Pedro');

INSERT INTO `MOVIE_LOCATIONS` (movieID, location1, location2, location3, location4
) values (6, 'USA', 'California', 'Los Angeles', 'Venice');

INSERT INTO `MOVIE_LOCATIONS` (movieID, location1, location2, location3, location4
) values (6, 'USA', 'California', 'Los Angeles', 'Venice Blvd. and Interstate 110');

INSERT INTO `MOVIE_LOCATIONS` (movieID, location1, location2, location3, location4
) values (6, 'USA', 'California', 'Los Angeles', 'Westin Bonaventure Hotel & Suites - 404 S. Figueroa Street, Downtown');

INSERT INTO `MOVIE_LOCATIONS` (movieID, location1, location2, location3, location4
) values (6, 'USA', 'California', 'Malibu', ' ');

INSERT INTO `MOVIE_LOCATIONS` (movieID, location1, location2, location3, location4
) values (6, 'USA', 'California', 'Santa Monica', 'Pacific Ocean Park');


### BEGIN CREATE TABLE MOVIE_TAGS
DROP TABLE IF EXISTS `MOVIE_TAGS`;
CREATE TABLE `MOVIE_TAGS` ( 
`movieID` INTEGER,
`tagID` INTEGER,
`tagWeight` FLOAT) ENGINE=InnoDB DEFAULT CHARSET=utf8;
#### END CREATE TABLE MOVIE_TAGS


INSERT INTO `MOVIE_TAGS` (movieID, tagID, tagWeight
) values (1, 13, 3);

INSERT INTO `MOVIE_TAGS` (movieID, tagID, tagWeight
) values (1, 25, 3);

INSERT INTO `MOVIE_TAGS` (movieID, tagID, tagWeight
) values (1, 55, 3);

INSERT INTO `MOVIE_TAGS` (movieID, tagID, tagWeight
) values (1, 60, 1);

INSERT INTO `MOVIE_TAGS` (movieID, tagID, tagWeight
) values (1, 146, 1);

INSERT INTO `MOVIE_TAGS` (movieID, tagID, tagWeight
) values (1, 326, 10);

INSERT INTO `MOVIE_TAGS` (movieID, tagID, tagWeight
) values (1, 351, 1);

INSERT INTO `MOVIE_TAGS` (movieID, tagID, tagWeight
) values (1, 362, 1);

INSERT INTO `MOVIE_TAGS` (movieID, tagID, tagWeight
) values (1, 382, 2);

INSERT INTO `MOVIE_TAGS` (movieID, tagID, tagWeight
) values (1, 459, 2);

INSERT INTO `MOVIE_TAGS` (movieID, tagID, tagWeight
) values (1, 465, 17);

INSERT INTO `MOVIE_TAGS` (movieID, tagID, tagWeight
) values (1, 501, 1);

INSERT INTO `MOVIE_TAGS` (movieID, tagID, tagWeight
) values (1, 528, 1);

INSERT INTO `MOVIE_TAGS` (movieID, tagID, tagWeight
) values (1, 605, 2);

INSERT INTO `MOVIE_TAGS` (movieID, tagID, tagWeight
) values (1, 672, 1);

INSERT INTO `MOVIE_TAGS` (movieID, tagID, tagWeight
) values (1, 752, 2);

INSERT INTO `MOVIE_TAGS` (movieID, tagID, tagWeight
) values (1, 819, 1);

INSERT INTO `MOVIE_TAGS` (movieID, tagID, tagWeight
) values (1, 896, 2);

INSERT INTO `MOVIE_TAGS` (movieID, tagID, tagWeight
) values (1, 900, 9);

INSERT INTO `MOVIE_TAGS` (movieID, tagID, tagWeight
) values (1, 1290, 1);

INSERT INTO `MOVIE_TAGS` (movieID, tagID, tagWeight
) values (1, 1925, 1);

INSERT INTO `MOVIE_TAGS` (movieID, tagID, tagWeight
) values (1, 2049, 1);

INSERT INTO `MOVIE_TAGS` (movieID, tagID, tagWeight
) values (1, 2119, 5);

INSERT INTO `MOVIE_TAGS` (movieID, tagID, tagWeight
) values (1, 2293, 4);

INSERT INTO `MOVIE_TAGS` (movieID, tagID, tagWeight
) values (1, 2481, 1);

INSERT INTO `MOVIE_TAGS` (movieID, tagID, tagWeight
) values (1, 4339, 1);

INSERT INTO `MOVIE_TAGS` (movieID, tagID, tagWeight
) values (1, 4342, 1);

INSERT INTO `MOVIE_TAGS` (movieID, tagID, tagWeight
) values (1, 4924, 1);

INSERT INTO `MOVIE_TAGS` (movieID, tagID, tagWeight
) values (1, 5289, 1);

INSERT INTO `MOVIE_TAGS` (movieID, tagID, tagWeight
) values (1, 6323, 1);

INSERT INTO `MOVIE_TAGS` (movieID, tagID, tagWeight
) values (1, 6535, 1);

INSERT INTO `MOVIE_TAGS` (movieID, tagID, tagWeight
) values (1, 6675, 1);

INSERT INTO `MOVIE_TAGS` (movieID, tagID, tagWeight
) values (1, 7705, 1);

INSERT INTO `MOVIE_TAGS` (movieID, tagID, tagWeight
) values (1, 10376, 1);

INSERT INTO `MOVIE_TAGS` (movieID, tagID, tagWeight
) values (1, 10420, 1);

INSERT INTO `MOVIE_TAGS` (movieID, tagID, tagWeight
) values (1, 10422, 1);

INSERT INTO `MOVIE_TAGS` (movieID, tagID, tagWeight
) values (1, 11344, 1);

INSERT INTO `MOVIE_TAGS` (movieID, tagID, tagWeight
) values (1, 11477, 1);

INSERT INTO `MOVIE_TAGS` (movieID, tagID, tagWeight
) values (1, 14562, 1);

INSERT INTO `MOVIE_TAGS` (movieID, tagID, tagWeight
) values (1, 15045, 1);

INSERT INTO `MOVIE_TAGS` (movieID, tagID, tagWeight
) values (1, 15123, 1);

INSERT INTO `MOVIE_TAGS` (movieID, tagID, tagWeight
) values (1, 15170, 1);

INSERT INTO `MOVIE_TAGS` (movieID, tagID, tagWeight
) values (2, 13, 2);

INSERT INTO `MOVIE_TAGS` (movieID, tagID, tagWeight
) values (2, 117, 3);

INSERT INTO `MOVIE_TAGS` (movieID, tagID, tagWeight
) values (2, 146, 3);

INSERT INTO `MOVIE_TAGS` (movieID, tagID, tagWeight
) values (2, 413, 1);

INSERT INTO `MOVIE_TAGS` (movieID, tagID, tagWeight
) values (2, 438, 2);

INSERT INTO `MOVIE_TAGS` (movieID, tagID, tagWeight
) values (2, 488, 8);

INSERT INTO `MOVIE_TAGS` (movieID, tagID, tagWeight
) values (2, 742, 1);

INSERT INTO `MOVIE_TAGS` (movieID, tagID, tagWeight
) values (2, 1224, 1);


### BEGIN CREATE TABLE TAGS
DROP TABLE IF EXISTS `TAGS`;
CREATE TABLE `TAGS` ( 
`id` INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
`value` VARCHAR(255)) ENGINE=InnoDB DEFAULT CHARSET=utf8;
#### END CREATE TABLE TAGS


INSERT INTO `TAGS` (id, value
) values (2, 'police');

INSERT INTO `TAGS` (id, value
) values (3, 'boxing');

INSERT INTO `TAGS` (id, value
) values (4, 'painter');

INSERT INTO `TAGS` (id, value
) values (5, 'whale');

INSERT INTO `TAGS` (id, value
) values (6, 'medieval');

INSERT INTO `TAGS` (id, value
) values (7, 'funny');

INSERT INTO `TAGS` (id, value
) values (8, 'almodovar');

INSERT INTO `TAGS` (id, value
) values (9, 'finnish');

INSERT INTO `TAGS` (id, value
) values (10, 'brothers quay');

INSERT INTO `TAGS` (id, value
) values (11, 'satoshi kon');

INSERT INTO `TAGS` (id, value
) values (12, 'robots');

INSERT INTO `TAGS` (id, value
) values (13, 'time travel');

INSERT INTO `TAGS` (id, value
) values (15, 'dreamdontcatch');

INSERT INTO `TAGS` (id, value
) values (16, 'excellent characters');

INSERT INTO `TAGS` (id, value
) values (17, 'seriously scary');

INSERT INTO `TAGS` (id, value
) values (18, 'frightfully accurate political commentary');

INSERT INTO `TAGS` (id, value
) values (19, 'very moving');

INSERT INTO `TAGS` (id, value
) values (21, 'bill murray');

INSERT INTO `TAGS` (id, value
) values (22, 'bruce campbell');

INSERT INTO `TAGS` (id, value
) values (23, 'wes anderson');

INSERT INTO `TAGS` (id, value
) values (24, 'dystopia');

INSERT INTO `TAGS` (id, value
) values (25, 'tim allen');

INSERT INTO `TAGS` (id, value
) values (27, 'great movie');

INSERT INTO `TAGS` (id, value
) values (28, 'fav 06');

INSERT INTO `TAGS` (id, value
) values (29, 'overrated');

INSERT INTO `TAGS` (id, value
) values (31, 'watch again');

INSERT INTO `TAGS` (id, value
) values (34, 'satire');

INSERT INTO `TAGS` (id, value
) values (35, 'computers');

INSERT INTO `TAGS` (id, value
) values (36, 'cold war');

INSERT INTO `TAGS` (id, value
) values (37, 'not a war movie');

INSERT INTO `TAGS` (id, value
) values (38, 'ghosts/afterlife');

INSERT INTO `TAGS` (id, value
) values (39, 'inspiring');

INSERT INTO `TAGS` (id, value
) values (40, 'not seen it');

INSERT INTO `TAGS` (id, value
) values (41, 'sexy');

INSERT INTO `TAGS` (id, value
) values (42, 'gothic');

INSERT INTO `TAGS` (id, value
) values (43, 'no good');

INSERT INTO `TAGS` (id, value
) values (44, 'awsome');

INSERT INTO `TAGS` (id, value
) values (45, 'revolutionary');

INSERT INTO `TAGS` (id, value
) values (46, 'horrible');

INSERT INTO `TAGS` (id, value
) values (47, 'oddly moving');

INSERT INTO `TAGS` (id, value
) values (48, 'not at cml');

INSERT INTO `TAGS` (id, value
) values (49, 'comic book');

INSERT INTO `TAGS` (id, value
) values (50, 'nicholas cage');

INSERT INTO `TAGS` (id, value
) values (51, 'available at cml');

INSERT INTO `TAGS` (id, value
) values (52, 'horro');

INSERT INTO `TAGS` (id, value
) values (53, 'crime');

INSERT INTO `TAGS` (id, value
) values (54, 'serial killer');

INSERT INTO `TAGS` (id, value
) values (55, 'comedy');

INSERT INTO `TAGS` (id, value
) values (56, 'sam raimi');

INSERT INTO `TAGS` (id, value
) values (57, 'horror');


### BEGIN CREATE TABLE USER_RATEDMOVIES_TIMESTAMPS
DROP TABLE IF EXISTS `USER_RATEDMOVIES_TIMESTAMPS`;
CREATE TABLE `USER_RATEDMOVIES_TIMESTAMPS` ( 
`userID` INTEGER,
`movieID` INTEGER,
`rating` INTEGER,
`timestamp` TIMESTAMP) ENGINE=InnoDB DEFAULT CHARSET=utf8;
#### END CREATE TABLE USER_RATEDMOVIES_TIMESTAMPS


INSERT INTO `USER_RATEDMOVIES_TIMESTAMPS` (userID, movieID, rating, timestamp
) values (75, 32, 4.5, 1162160624000);

INSERT INTO `USER_RATEDMOVIES_TIMESTAMPS` (userID, movieID, rating, timestamp
) values (75, 110, 4, 1162161008000);

INSERT INTO `USER_RATEDMOVIES_TIMESTAMPS` (userID, movieID, rating, timestamp
) values (75, 160, 2, 1162160212000);

INSERT INTO `USER_RATEDMOVIES_TIMESTAMPS` (userID, movieID, rating, timestamp
) values (75, 163, 4, 1162160970000);

INSERT INTO `USER_RATEDMOVIES_TIMESTAMPS` (userID, movieID, rating, timestamp
) values (75, 165, 4.5, 1162160715000);

INSERT INTO `USER_RATEDMOVIES_TIMESTAMPS` (userID, movieID, rating, timestamp
) values (75, 173, 3.5, 1162160257000);

INSERT INTO `USER_RATEDMOVIES_TIMESTAMPS` (userID, movieID, rating, timestamp
) values (75, 296, 5, 1162160689000);

INSERT INTO `USER_RATEDMOVIES_TIMESTAMPS` (userID, movieID, rating, timestamp
) values (75, 353, 3.5, 1162160220000);

INSERT INTO `USER_RATEDMOVIES_TIMESTAMPS` (userID, movieID, rating, timestamp
) values (75, 420, 2, 1162160202000);

INSERT INTO `USER_RATEDMOVIES_TIMESTAMPS` (userID, movieID, rating, timestamp
) values (75, 589, 4, 1162160901000);

INSERT INTO `USER_RATEDMOVIES_TIMESTAMPS` (userID, movieID, rating, timestamp
) values (75, 653, 3, 1162160225000);

INSERT INTO `USER_RATEDMOVIES_TIMESTAMPS` (userID, movieID, rating, timestamp
) values (75, 832, 4.5, 1162160269000);

INSERT INTO `USER_RATEDMOVIES_TIMESTAMPS` (userID, movieID, rating, timestamp
) values (75, 920, 0.5, 1162160228000);

INSERT INTO `USER_RATEDMOVIES_TIMESTAMPS` (userID, movieID, rating, timestamp
) values (75, 996, 4.5, 1162160777000);

INSERT INTO `USER_RATEDMOVIES_TIMESTAMPS` (userID, movieID, rating, timestamp
) values (75, 1036, 4, 1162160685000);

INSERT INTO `USER_RATEDMOVIES_TIMESTAMPS` (userID, movieID, rating, timestamp
) values (75, 1127, 3.5, 1162160932000);

INSERT INTO `USER_RATEDMOVIES_TIMESTAMPS` (userID, movieID, rating, timestamp
) values (75, 1215, 4.5, 1162160936000);

INSERT INTO `USER_RATEDMOVIES_TIMESTAMPS` (userID, movieID, rating, timestamp
) values (75, 1233, 4, 1162161005000);

INSERT INTO `USER_RATEDMOVIES_TIMESTAMPS` (userID, movieID, rating, timestamp
) values (75, 1304, 2.5, 1162160216000);

INSERT INTO `USER_RATEDMOVIES_TIMESTAMPS` (userID, movieID, rating, timestamp
) values (75, 1370, 4, 1162160711000);

INSERT INTO `USER_RATEDMOVIES_TIMESTAMPS` (userID, movieID, rating, timestamp
) values (75, 1374, 4, 1162160240000);

INSERT INTO `USER_RATEDMOVIES_TIMESTAMPS` (userID, movieID, rating, timestamp
) values (75, 1485, 4, 1162160266000);

INSERT INTO `USER_RATEDMOVIES_TIMESTAMPS` (userID, movieID, rating, timestamp
) values (75, 1527, 4.5, 1162160641000);

INSERT INTO `USER_RATEDMOVIES_TIMESTAMPS` (userID, movieID, rating, timestamp
) values (75, 1917, 2.5, 1162160763000);

INSERT INTO `USER_RATEDMOVIES_TIMESTAMPS` (userID, movieID, rating, timestamp
) values (75, 2011, 2, 1162160199000);

INSERT INTO `USER_RATEDMOVIES_TIMESTAMPS` (userID, movieID, rating, timestamp
) values (75, 2054, 1.5, 1162160253000);

INSERT INTO `USER_RATEDMOVIES_TIMESTAMPS` (userID, movieID, rating, timestamp
) values (75, 2058, 4, 1162160965000);

INSERT INTO `USER_RATEDMOVIES_TIMESTAMPS` (userID, movieID, rating, timestamp
) values (75, 2490, 4, 1162160975000);

INSERT INTO `USER_RATEDMOVIES_TIMESTAMPS` (userID, movieID, rating, timestamp
) values (75, 2571, 4.5, 1162161050000);

INSERT INTO `USER_RATEDMOVIES_TIMESTAMPS` (userID, movieID, rating, timestamp
) values (75, 2640, 3, 1162160276000);

INSERT INTO `USER_RATEDMOVIES_TIMESTAMPS` (userID, movieID, rating, timestamp
) values (75, 2688, 3, 1162160546000);

INSERT INTO `USER_RATEDMOVIES_TIMESTAMPS` (userID, movieID, rating, timestamp
) values (75, 2700, 4.5, 1162160272000);

INSERT INTO `USER_RATEDMOVIES_TIMESTAMPS` (userID, movieID, rating, timestamp
) values (75, 2762, 3.5, 1162160694000);

INSERT INTO `USER_RATEDMOVIES_TIMESTAMPS` (userID, movieID, rating, timestamp
) values (75, 2959, 4.5, 1162161012000);

INSERT INTO `USER_RATEDMOVIES_TIMESTAMPS` (userID, movieID, rating, timestamp
) values (75, 3258, 1.5, 1162160768000);

INSERT INTO `USER_RATEDMOVIES_TIMESTAMPS` (userID, movieID, rating, timestamp
) values (75, 3793, 3, 1162160956000);

INSERT INTO `USER_RATEDMOVIES_TIMESTAMPS` (userID, movieID, rating, timestamp
) values (75, 3889, 3, 1162160563000);

INSERT INTO `USER_RATEDMOVIES_TIMESTAMPS` (userID, movieID, rating, timestamp
) values (75, 3994, 3.5, 1162160724000);

INSERT INTO `USER_RATEDMOVIES_TIMESTAMPS` (userID, movieID, rating, timestamp
) values (75, 4993, 3.5, 1162161034000);

INSERT INTO `USER_RATEDMOVIES_TIMESTAMPS` (userID, movieID, rating, timestamp
) values (75, 5107, 3, 1162160771000);

INSERT INTO `USER_RATEDMOVIES_TIMESTAMPS` (userID, movieID, rating, timestamp
) values (75, 5833, 2.5, 1162160991000);

INSERT INTO `USER_RATEDMOVIES_TIMESTAMPS` (userID, movieID, rating, timestamp
) values (75, 5952, 3.5, 1162161040000);

INSERT INTO `USER_RATEDMOVIES_TIMESTAMPS` (userID, movieID, rating, timestamp
) values (75, 6213, 4, 1162160781000);

INSERT INTO `USER_RATEDMOVIES_TIMESTAMPS` (userID, movieID, rating, timestamp
) values (75, 6225, 0.5, 1162160485000);

INSERT INTO `USER_RATEDMOVIES_TIMESTAMPS` (userID, movieID, rating, timestamp
) values (75, 6333, 4, 1162160892000);

INSERT INTO `USER_RATEDMOVIES_TIMESTAMPS` (userID, movieID, rating, timestamp
) values (75, 7000, 3.5, 1162160708000);

INSERT INTO `USER_RATEDMOVIES_TIMESTAMPS` (userID, movieID, rating, timestamp
) values (75, 7007, 4.5, 1162160655000);

INSERT INTO `USER_RATEDMOVIES_TIMESTAMPS` (userID, movieID, rating, timestamp
) values (75, 7153, 3.5, 1162161036000);

INSERT INTO `USER_RATEDMOVIES_TIMESTAMPS` (userID, movieID, rating, timestamp
) values (75, 32029, 4.5, 1162160718000);

INSERT INTO `USER_RATEDMOVIES_TIMESTAMPS` (userID, movieID, rating, timestamp
) values (75, 32587, 5, 1162160691000);


### BEGIN CREATE TABLE USER_RATEDMOVIES
DROP TABLE IF EXISTS `USER_RATEDMOVIES`;
CREATE TABLE `USER_RATEDMOVIES` ( 
`userID` INTEGER,
`movieID` INTEGER,
`rating` INTEGER,
`date_day` INTEGER,
`date_month` INTEGER,
`date_year` INTEGER,
`date_hour` INTEGER,
`date_minute` INTEGER,
`date_second` FLOAT) ENGINE=InnoDB DEFAULT CHARSET=utf8;
#### END CREATE TABLE USER_RATEDMOVIES


INSERT INTO `USER_RATEDMOVIES` (userID, movieID, rating, date_day, date_month, date_year, date_hour, date_minute, date_second
) values (75, 32, 4.5, 29, 10, 2006, 23, 23, 44);

INSERT INTO `USER_RATEDMOVIES` (userID, movieID, rating, date_day, date_month, date_year, date_hour, date_minute, date_second
) values (75, 110, 4, 29, 10, 2006, 23, 30, 8);

INSERT INTO `USER_RATEDMOVIES` (userID, movieID, rating, date_day, date_month, date_year, date_hour, date_minute, date_second
) values (75, 160, 2, 29, 10, 2006, 23, 16, 52);

INSERT INTO `USER_RATEDMOVIES` (userID, movieID, rating, date_day, date_month, date_year, date_hour, date_minute, date_second
) values (75, 163, 4, 29, 10, 2006, 23, 29, 30);

INSERT INTO `USER_RATEDMOVIES` (userID, movieID, rating, date_day, date_month, date_year, date_hour, date_minute, date_second
) values (75, 165, 4.5, 29, 10, 2006, 23, 25, 15);

INSERT INTO `USER_RATEDMOVIES` (userID, movieID, rating, date_day, date_month, date_year, date_hour, date_minute, date_second
) values (75, 173, 3.5, 29, 10, 2006, 23, 17, 37);

INSERT INTO `USER_RATEDMOVIES` (userID, movieID, rating, date_day, date_month, date_year, date_hour, date_minute, date_second
) values (75, 296, 5, 29, 10, 2006, 23, 24, 49);

INSERT INTO `USER_RATEDMOVIES` (userID, movieID, rating, date_day, date_month, date_year, date_hour, date_minute, date_second
) values (75, 353, 3.5, 29, 10, 2006, 23, 17, 0);

INSERT INTO `USER_RATEDMOVIES` (userID, movieID, rating, date_day, date_month, date_year, date_hour, date_minute, date_second
) values (75, 420, 2, 29, 10, 2006, 23, 16, 42);

INSERT INTO `USER_RATEDMOVIES` (userID, movieID, rating, date_day, date_month, date_year, date_hour, date_minute, date_second
) values (75, 589, 4, 29, 10, 2006, 23, 28, 21);

INSERT INTO `USER_RATEDMOVIES` (userID, movieID, rating, date_day, date_month, date_year, date_hour, date_minute, date_second
) values (75, 653, 3, 29, 10, 2006, 23, 17, 5);

INSERT INTO `USER_RATEDMOVIES` (userID, movieID, rating, date_day, date_month, date_year, date_hour, date_minute, date_second
) values (75, 832, 4.5, 29, 10, 2006, 23, 17, 49);

INSERT INTO `USER_RATEDMOVIES` (userID, movieID, rating, date_day, date_month, date_year, date_hour, date_minute, date_second
) values (75, 920, 0.5, 29, 10, 2006, 23, 17, 8);

INSERT INTO `USER_RATEDMOVIES` (userID, movieID, rating, date_day, date_month, date_year, date_hour, date_minute, date_second
) values (75, 996, 4.5, 29, 10, 2006, 23, 26, 17);

INSERT INTO `USER_RATEDMOVIES` (userID, movieID, rating, date_day, date_month, date_year, date_hour, date_minute, date_second
) values (75, 1036, 4, 29, 10, 2006, 23, 24, 45);

INSERT INTO `USER_RATEDMOVIES` (userID, movieID, rating, date_day, date_month, date_year, date_hour, date_minute, date_second
) values (75, 1127, 3.5, 29, 10, 2006, 23, 28, 52);

INSERT INTO `USER_RATEDMOVIES` (userID, movieID, rating, date_day, date_month, date_year, date_hour, date_minute, date_second
) values (75, 1215, 4.5, 29, 10, 2006, 23, 28, 56);

INSERT INTO `USER_RATEDMOVIES` (userID, movieID, rating, date_day, date_month, date_year, date_hour, date_minute, date_second
) values (75, 1233, 4, 29, 10, 2006, 23, 30, 5);

INSERT INTO `USER_RATEDMOVIES` (userID, movieID, rating, date_day, date_month, date_year, date_hour, date_minute, date_second
) values (75, 1304, 2.5, 29, 10, 2006, 23, 16, 56);

INSERT INTO `USER_RATEDMOVIES` (userID, movieID, rating, date_day, date_month, date_year, date_hour, date_minute, date_second
) values (75, 1370, 4, 29, 10, 2006, 23, 25, 11);

INSERT INTO `USER_RATEDMOVIES` (userID, movieID, rating, date_day, date_month, date_year, date_hour, date_minute, date_second
) values (75, 1374, 4, 29, 10, 2006, 23, 17, 20);

INSERT INTO `USER_RATEDMOVIES` (userID, movieID, rating, date_day, date_month, date_year, date_hour, date_minute, date_second
) values (75, 1485, 4, 29, 10, 2006, 23, 17, 46);

INSERT INTO `USER_RATEDMOVIES` (userID, movieID, rating, date_day, date_month, date_year, date_hour, date_minute, date_second
) values (75, 1527, 4.5, 29, 10, 2006, 23, 24, 1);

INSERT INTO `USER_RATEDMOVIES` (userID, movieID, rating, date_day, date_month, date_year, date_hour, date_minute, date_second
) values (75, 1917, 2.5, 29, 10, 2006, 23, 26, 3);

INSERT INTO `USER_RATEDMOVIES` (userID, movieID, rating, date_day, date_month, date_year, date_hour, date_minute, date_second
) values (75, 2011, 2, 29, 10, 2006, 23, 16, 39);

INSERT INTO `USER_RATEDMOVIES` (userID, movieID, rating, date_day, date_month, date_year, date_hour, date_minute, date_second
) values (75, 2054, 1.5, 29, 10, 2006, 23, 17, 33);

INSERT INTO `USER_RATEDMOVIES` (userID, movieID, rating, date_day, date_month, date_year, date_hour, date_minute, date_second
) values (75, 2058, 4, 29, 10, 2006, 23, 29, 25);

INSERT INTO `USER_RATEDMOVIES` (userID, movieID, rating, date_day, date_month, date_year, date_hour, date_minute, date_second
) values (75, 2490, 4, 29, 10, 2006, 23, 29, 35);

INSERT INTO `USER_RATEDMOVIES` (userID, movieID, rating, date_day, date_month, date_year, date_hour, date_minute, date_second
) values (75, 2571, 4.5, 29, 10, 2006, 23, 30, 50);

INSERT INTO `USER_RATEDMOVIES` (userID, movieID, rating, date_day, date_month, date_year, date_hour, date_minute, date_second
) values (75, 2640, 3, 29, 10, 2006, 23, 17, 56);

INSERT INTO `USER_RATEDMOVIES` (userID, movieID, rating, date_day, date_month, date_year, date_hour, date_minute, date_second
) values (75, 2688, 3, 29, 10, 2006, 23, 22, 26);

INSERT INTO `USER_RATEDMOVIES` (userID, movieID, rating, date_day, date_month, date_year, date_hour, date_minute, date_second
) values (75, 2700, 4.5, 29, 10, 2006, 23, 17, 52);

INSERT INTO `USER_RATEDMOVIES` (userID, movieID, rating, date_day, date_month, date_year, date_hour, date_minute, date_second
) values (75, 2762, 3.5, 29, 10, 2006, 23, 24, 54);

INSERT INTO `USER_RATEDMOVIES` (userID, movieID, rating, date_day, date_month, date_year, date_hour, date_minute, date_second
) values (75, 2959, 4.5, 29, 10, 2006, 23, 30, 12);

INSERT INTO `USER_RATEDMOVIES` (userID, movieID, rating, date_day, date_month, date_year, date_hour, date_minute, date_second
) values (75, 3258, 1.5, 29, 10, 2006, 23, 26, 8);

INSERT INTO `USER_RATEDMOVIES` (userID, movieID, rating, date_day, date_month, date_year, date_hour, date_minute, date_second
) values (75, 3793, 3, 29, 10, 2006, 23, 29, 16);

INSERT INTO `USER_RATEDMOVIES` (userID, movieID, rating, date_day, date_month, date_year, date_hour, date_minute, date_second
) values (75, 3889, 3, 29, 10, 2006, 23, 22, 43);

INSERT INTO `USER_RATEDMOVIES` (userID, movieID, rating, date_day, date_month, date_year, date_hour, date_minute, date_second
) values (75, 3994, 3.5, 29, 10, 2006, 23, 25, 24);

INSERT INTO `USER_RATEDMOVIES` (userID, movieID, rating, date_day, date_month, date_year, date_hour, date_minute, date_second
) values (75, 4993, 3.5, 29, 10, 2006, 23, 30, 34);

INSERT INTO `USER_RATEDMOVIES` (userID, movieID, rating, date_day, date_month, date_year, date_hour, date_minute, date_second
) values (75, 5107, 3, 29, 10, 2006, 23, 26, 11);

INSERT INTO `USER_RATEDMOVIES` (userID, movieID, rating, date_day, date_month, date_year, date_hour, date_minute, date_second
) values (75, 5833, 2.5, 29, 10, 2006, 23, 29, 51);

INSERT INTO `USER_RATEDMOVIES` (userID, movieID, rating, date_day, date_month, date_year, date_hour, date_minute, date_second
) values (75, 5952, 3.5, 29, 10, 2006, 23, 30, 40);

INSERT INTO `USER_RATEDMOVIES` (userID, movieID, rating, date_day, date_month, date_year, date_hour, date_minute, date_second
) values (75, 6213, 4, 29, 10, 2006, 23, 26, 21);

INSERT INTO `USER_RATEDMOVIES` (userID, movieID, rating, date_day, date_month, date_year, date_hour, date_minute, date_second
) values (75, 6225, 0.5, 29, 10, 2006, 23, 21, 25);

INSERT INTO `USER_RATEDMOVIES` (userID, movieID, rating, date_day, date_month, date_year, date_hour, date_minute, date_second
) values (75, 6333, 4, 29, 10, 2006, 23, 28, 12);

INSERT INTO `USER_RATEDMOVIES` (userID, movieID, rating, date_day, date_month, date_year, date_hour, date_minute, date_second
) values (75, 7000, 3.5, 29, 10, 2006, 23, 25, 8);

INSERT INTO `USER_RATEDMOVIES` (userID, movieID, rating, date_day, date_month, date_year, date_hour, date_minute, date_second
) values (75, 7007, 4.5, 29, 10, 2006, 23, 24, 15);

INSERT INTO `USER_RATEDMOVIES` (userID, movieID, rating, date_day, date_month, date_year, date_hour, date_minute, date_second
) values (75, 7153, 3.5, 29, 10, 2006, 23, 30, 36);

INSERT INTO `USER_RATEDMOVIES` (userID, movieID, rating, date_day, date_month, date_year, date_hour, date_minute, date_second
) values (75, 32029, 4.5, 29, 10, 2006, 23, 25, 18);

INSERT INTO `USER_RATEDMOVIES` (userID, movieID, rating, date_day, date_month, date_year, date_hour, date_minute, date_second
) values (75, 32587, 5, 29, 10, 2006, 23, 24, 51);


### BEGIN CREATE TABLE USER_TAGGEDMOVIES_TIMESTAMPS
DROP TABLE IF EXISTS `USER_TAGGEDMOVIES_TIMESTAMPS`;
CREATE TABLE `USER_TAGGEDMOVIES_TIMESTAMPS` ( 
`userID` INTEGER,
`movieID` INTEGER,
`tagID` INTEGER,
`timestamp` TIMESTAMP) ENGINE=InnoDB DEFAULT CHARSET=utf8;
#### END CREATE TABLE USER_TAGGEDMOVIES_TIMESTAMPS


INSERT INTO `USER_TAGGEDMOVIES_TIMESTAMPS` (userID, movieID, tagID, timestamp
) values (78, 4223, 5264, 1176691425000);

INSERT INTO `USER_TAGGEDMOVIES_TIMESTAMPS` (userID, movieID, tagID, timestamp
) values (127, 1343, 1544, 1188265347000);

INSERT INTO `USER_TAGGEDMOVIES_TIMESTAMPS` (userID, movieID, tagID, timestamp
) values (127, 1343, 12330, 1188265347000);

INSERT INTO `USER_TAGGEDMOVIES_TIMESTAMPS` (userID, movieID, tagID, timestamp
) values (127, 2080, 1451, 1188265367000);

INSERT INTO `USER_TAGGEDMOVIES_TIMESTAMPS` (userID, movieID, tagID, timestamp
) values (127, 2080, 1574, 1188265367000);

INSERT INTO `USER_TAGGEDMOVIES_TIMESTAMPS` (userID, movieID, tagID, timestamp
) values (127, 2953, 4121, 1188265544000);

INSERT INTO `USER_TAGGEDMOVIES_TIMESTAMPS` (userID, movieID, tagID, timestamp
) values (127, 2953, 11860, 1188265544000);

INSERT INTO `USER_TAGGEDMOVIES_TIMESTAMPS` (userID, movieID, tagID, timestamp
) values (127, 4270, 914, 1188265509000);

INSERT INTO `USER_TAGGEDMOVIES_TIMESTAMPS` (userID, movieID, tagID, timestamp
) values (127, 4270, 5215, 1188265509000);

INSERT INTO `USER_TAGGEDMOVIES_TIMESTAMPS` (userID, movieID, tagID, timestamp
) values (127, 4447, 7, 1188265463000);

INSERT INTO `USER_TAGGEDMOVIES_TIMESTAMPS` (userID, movieID, tagID, timestamp
) values (127, 4447, 1996, 1188265463000);

INSERT INTO `USER_TAGGEDMOVIES_TIMESTAMPS` (userID, movieID, tagID, timestamp
) values (127, 4447, 2571, 1188265463000);

INSERT INTO `USER_TAGGEDMOVIES_TIMESTAMPS` (userID, movieID, tagID, timestamp
) values (127, 5679, 742, 1188265447000);

INSERT INTO `USER_TAGGEDMOVIES_TIMESTAMPS` (userID, movieID, tagID, timestamp
) values (127, 6934, 1537, 1188265437000);

INSERT INTO `USER_TAGGEDMOVIES_TIMESTAMPS` (userID, movieID, tagID, timestamp
) values (127, 6934, 1538, 1188265437000);

INSERT INTO `USER_TAGGEDMOVIES_TIMESTAMPS` (userID, movieID, tagID, timestamp
) values (127, 6934, 9062, 1188265437000);

INSERT INTO `USER_TAGGEDMOVIES_TIMESTAMPS` (userID, movieID, tagID, timestamp
) values (127, 7147, 146, 1188265408000);

INSERT INTO `USER_TAGGEDMOVIES_TIMESTAMPS` (userID, movieID, tagID, timestamp
) values (127, 7147, 150, 1188265408000);

INSERT INTO `USER_TAGGEDMOVIES_TIMESTAMPS` (userID, movieID, tagID, timestamp
) values (127, 7147, 1878, 1188265408000);

INSERT INTO `USER_TAGGEDMOVIES_TIMESTAMPS` (userID, movieID, tagID, timestamp
) values (127, 7147, 2596, 1188265408000);

INSERT INTO `USER_TAGGEDMOVIES_TIMESTAMPS` (userID, movieID, tagID, timestamp
) values (127, 7147, 13087, 1188265408000);

INSERT INTO `USER_TAGGEDMOVIES_TIMESTAMPS` (userID, movieID, tagID, timestamp
) values (127, 8622, 55, 1188265497000);

INSERT INTO `USER_TAGGEDMOVIES_TIMESTAMPS` (userID, movieID, tagID, timestamp
) values (127, 8622, 11371, 1188265497000);

INSERT INTO `USER_TAGGEDMOVIES_TIMESTAMPS` (userID, movieID, tagID, timestamp
) values (127, 8622, 13086, 1188265497000);

INSERT INTO `USER_TAGGEDMOVIES_TIMESTAMPS` (userID, movieID, tagID, timestamp
) values (170, 47830, 93, 1162209176000);

INSERT INTO `USER_TAGGEDMOVIES_TIMESTAMPS` (userID, movieID, tagID, timestamp
) values (175, 2819, 11407, 1188441420000);

INSERT INTO `USER_TAGGEDMOVIES_TIMESTAMPS` (userID, movieID, tagID, timestamp
) values (175, 51540, 79, 1192990133000);

INSERT INTO `USER_TAGGEDMOVIES_TIMESTAMPS` (userID, movieID, tagID, timestamp
) values (190, 741, 712, 1151700107000);

INSERT INTO `USER_TAGGEDMOVIES_TIMESTAMPS` (userID, movieID, tagID, timestamp
) values (190, 1274, 712, 1151700139000);

INSERT INTO `USER_TAGGEDMOVIES_TIMESTAMPS` (userID, movieID, tagID, timestamp
) values (190, 2116, 410, 1140037169000);

INSERT INTO `USER_TAGGEDMOVIES_TIMESTAMPS` (userID, movieID, tagID, timestamp
) values (190, 2810, 712, 1151700125000);

INSERT INTO `USER_TAGGEDMOVIES_TIMESTAMPS` (userID, movieID, tagID, timestamp
) values (190, 3000, 712, 1151699945000);

INSERT INTO `USER_TAGGEDMOVIES_TIMESTAMPS` (userID, movieID, tagID, timestamp
) values (190, 3997, 410, 1140032030000);

INSERT INTO `USER_TAGGEDMOVIES_TIMESTAMPS` (userID, movieID, tagID, timestamp
) values (190, 4993, 410, 1140037056000);

INSERT INTO `USER_TAGGEDMOVIES_TIMESTAMPS` (userID, movieID, tagID, timestamp
) values (190, 5039, 410, 1140032022000);

INSERT INTO `USER_TAGGEDMOVIES_TIMESTAMPS` (userID, movieID, tagID, timestamp
) values (190, 5069, 712, 1151700015000);

INSERT INTO `USER_TAGGEDMOVIES_TIMESTAMPS` (userID, movieID, tagID, timestamp
) values (190, 5072, 712, 1208365260000);

INSERT INTO `USER_TAGGEDMOVIES_TIMESTAMPS` (userID, movieID, tagID, timestamp
) values (190, 5146, 712, 1151699986000);

INSERT INTO `USER_TAGGEDMOVIES_TIMESTAMPS` (userID, movieID, tagID, timestamp
) values (190, 5618, 712, 1151699951000);

INSERT INTO `USER_TAGGEDMOVIES_TIMESTAMPS` (userID, movieID, tagID, timestamp
) values (190, 5690, 712, 1151700035000);

INSERT INTO `USER_TAGGEDMOVIES_TIMESTAMPS` (userID, movieID, tagID, timestamp
) values (190, 5952, 410, 1140037068000);

INSERT INTO `USER_TAGGEDMOVIES_TIMESTAMPS` (userID, movieID, tagID, timestamp
) values (190, 5971, 712, 1151699978000);

INSERT INTO `USER_TAGGEDMOVIES_TIMESTAMPS` (userID, movieID, tagID, timestamp
) values (190, 6283, 712, 1151700010000);

INSERT INTO `USER_TAGGEDMOVIES_TIMESTAMPS` (userID, movieID, tagID, timestamp
) values (190, 6350, 712, 1151700002000);

INSERT INTO `USER_TAGGEDMOVIES_TIMESTAMPS` (userID, movieID, tagID, timestamp
) values (190, 6857, 712, 1151700128000);

INSERT INTO `USER_TAGGEDMOVIES_TIMESTAMPS` (userID, movieID, tagID, timestamp
) values (190, 7099, 712, 1151699959000);

INSERT INTO `USER_TAGGEDMOVIES_TIMESTAMPS` (userID, movieID, tagID, timestamp
) values (190, 7153, 410, 1140031954000);

INSERT INTO `USER_TAGGEDMOVIES_TIMESTAMPS` (userID, movieID, tagID, timestamp
) values (190, 8607, 712, 1151700134000);

INSERT INTO `USER_TAGGEDMOVIES_TIMESTAMPS` (userID, movieID, tagID, timestamp
) values (190, 26662, 712, 1151700111000);

INSERT INTO `USER_TAGGEDMOVIES_TIMESTAMPS` (userID, movieID, tagID, timestamp
) values (190, 27728, 712, 1208365236000);


### BEGIN CREATE TABLE USER_TAGGEDMOVIES
DROP TABLE IF EXISTS `USER_TAGGEDMOVIES`;
CREATE TABLE `USER_TAGGEDMOVIES` ( 
`userID` INTEGER,
`movieID` INTEGER,
`tagID` INTEGER,
`date_day` INTEGER,
`date_month` INTEGER,
`date_year` INTEGER,
`date_hour` INTEGER,
`date_minute` INTEGER,
`date_second` FLOAT) ENGINE=InnoDB DEFAULT CHARSET=utf8;
#### END CREATE TABLE USER_TAGGEDMOVIES


INSERT INTO `USER_TAGGEDMOVIES` (userID, movieID, tagID, date_day, date_month, date_year, date_hour, date_minute, date_second
) values (78, 4223, 5264, 16, 4, 2007, 4, 43, 45);

INSERT INTO `USER_TAGGEDMOVIES` (userID, movieID, tagID, date_day, date_month, date_year, date_hour, date_minute, date_second
) values (127, 1343, 1544, 28, 8, 2007, 3, 42, 27);

INSERT INTO `USER_TAGGEDMOVIES` (userID, movieID, tagID, date_day, date_month, date_year, date_hour, date_minute, date_second
) values (127, 1343, 12330, 28, 8, 2007, 3, 42, 27);

INSERT INTO `USER_TAGGEDMOVIES` (userID, movieID, tagID, date_day, date_month, date_year, date_hour, date_minute, date_second
) values (127, 2080, 1451, 28, 8, 2007, 3, 42, 47);

INSERT INTO `USER_TAGGEDMOVIES` (userID, movieID, tagID, date_day, date_month, date_year, date_hour, date_minute, date_second
) values (127, 2080, 1574, 28, 8, 2007, 3, 42, 47);

INSERT INTO `USER_TAGGEDMOVIES` (userID, movieID, tagID, date_day, date_month, date_year, date_hour, date_minute, date_second
) values (127, 2953, 4121, 28, 8, 2007, 3, 45, 44);

INSERT INTO `USER_TAGGEDMOVIES` (userID, movieID, tagID, date_day, date_month, date_year, date_hour, date_minute, date_second
) values (127, 2953, 11860, 28, 8, 2007, 3, 45, 44);

INSERT INTO `USER_TAGGEDMOVIES` (userID, movieID, tagID, date_day, date_month, date_year, date_hour, date_minute, date_second
) values (127, 4270, 914, 28, 8, 2007, 3, 45, 9);

INSERT INTO `USER_TAGGEDMOVIES` (userID, movieID, tagID, date_day, date_month, date_year, date_hour, date_minute, date_second
) values (127, 4270, 5215, 28, 8, 2007, 3, 45, 9);

INSERT INTO `USER_TAGGEDMOVIES` (userID, movieID, tagID, date_day, date_month, date_year, date_hour, date_minute, date_second
) values (127, 4447, 7, 28, 8, 2007, 3, 44, 23);

INSERT INTO `USER_TAGGEDMOVIES` (userID, movieID, tagID, date_day, date_month, date_year, date_hour, date_minute, date_second
) values (127, 4447, 1996, 28, 8, 2007, 3, 44, 23);

INSERT INTO `USER_TAGGEDMOVIES` (userID, movieID, tagID, date_day, date_month, date_year, date_hour, date_minute, date_second
) values (127, 4447, 2571, 28, 8, 2007, 3, 44, 23);

INSERT INTO `USER_TAGGEDMOVIES` (userID, movieID, tagID, date_day, date_month, date_year, date_hour, date_minute, date_second
) values (127, 5679, 742, 28, 8, 2007, 3, 44, 7);

INSERT INTO `USER_TAGGEDMOVIES` (userID, movieID, tagID, date_day, date_month, date_year, date_hour, date_minute, date_second
) values (127, 6934, 1537, 28, 8, 2007, 3, 43, 57);

INSERT INTO `USER_TAGGEDMOVIES` (userID, movieID, tagID, date_day, date_month, date_year, date_hour, date_minute, date_second
) values (127, 6934, 1538, 28, 8, 2007, 3, 43, 57);

INSERT INTO `USER_TAGGEDMOVIES` (userID, movieID, tagID, date_day, date_month, date_year, date_hour, date_minute, date_second
) values (127, 6934, 9062, 28, 8, 2007, 3, 43, 57);

INSERT INTO `USER_TAGGEDMOVIES` (userID, movieID, tagID, date_day, date_month, date_year, date_hour, date_minute, date_second
) values (127, 7147, 146, 28, 8, 2007, 3, 43, 28);

INSERT INTO `USER_TAGGEDMOVIES` (userID, movieID, tagID, date_day, date_month, date_year, date_hour, date_minute, date_second
) values (127, 7147, 150, 28, 8, 2007, 3, 43, 28);

INSERT INTO `USER_TAGGEDMOVIES` (userID, movieID, tagID, date_day, date_month, date_year, date_hour, date_minute, date_second
) values (127, 7147, 1878, 28, 8, 2007, 3, 43, 28);

INSERT INTO `USER_TAGGEDMOVIES` (userID, movieID, tagID, date_day, date_month, date_year, date_hour, date_minute, date_second
) values (127, 7147, 2596, 28, 8, 2007, 3, 43, 28);

INSERT INTO `USER_TAGGEDMOVIES` (userID, movieID, tagID, date_day, date_month, date_year, date_hour, date_minute, date_second
) values (127, 7147, 13087, 28, 8, 2007, 3, 43, 28);

INSERT INTO `USER_TAGGEDMOVIES` (userID, movieID, tagID, date_day, date_month, date_year, date_hour, date_minute, date_second
) values (127, 8622, 55, 28, 8, 2007, 3, 44, 57);

INSERT INTO `USER_TAGGEDMOVIES` (userID, movieID, tagID, date_day, date_month, date_year, date_hour, date_minute, date_second
) values (127, 8622, 11371, 28, 8, 2007, 3, 44, 57);

INSERT INTO `USER_TAGGEDMOVIES` (userID, movieID, tagID, date_day, date_month, date_year, date_hour, date_minute, date_second
) values (127, 8622, 13086, 28, 8, 2007, 3, 44, 57);

INSERT INTO `USER_TAGGEDMOVIES` (userID, movieID, tagID, date_day, date_month, date_year, date_hour, date_minute, date_second
) values (170, 47830, 93, 30, 10, 2006, 12, 52, 56);

INSERT INTO `USER_TAGGEDMOVIES` (userID, movieID, tagID, date_day, date_month, date_year, date_hour, date_minute, date_second
) values (175, 2819, 11407, 30, 8, 2007, 4, 37, 0);

INSERT INTO `USER_TAGGEDMOVIES` (userID, movieID, tagID, date_day, date_month, date_year, date_hour, date_minute, date_second
) values (175, 51540, 79, 21, 10, 2007, 20, 8, 53);

INSERT INTO `USER_TAGGEDMOVIES` (userID, movieID, tagID, date_day, date_month, date_year, date_hour, date_minute, date_second
) values (190, 741, 712, 30, 6, 2006, 22, 41, 47);

INSERT INTO `USER_TAGGEDMOVIES` (userID, movieID, tagID, date_day, date_month, date_year, date_hour, date_minute, date_second
) values (190, 1274, 712, 30, 6, 2006, 22, 42, 19);

INSERT INTO `USER_TAGGEDMOVIES` (userID, movieID, tagID, date_day, date_month, date_year, date_hour, date_minute, date_second
) values (190, 2116, 410, 15, 2, 2006, 21, 59, 29);

INSERT INTO `USER_TAGGEDMOVIES` (userID, movieID, tagID, date_day, date_month, date_year, date_hour, date_minute, date_second
) values (190, 2810, 712, 30, 6, 2006, 22, 42, 5);

INSERT INTO `USER_TAGGEDMOVIES` (userID, movieID, tagID, date_day, date_month, date_year, date_hour, date_minute, date_second
) values (190, 3000, 712, 30, 6, 2006, 22, 39, 5);

INSERT INTO `USER_TAGGEDMOVIES` (userID, movieID, tagID, date_day, date_month, date_year, date_hour, date_minute, date_second
) values (190, 3997, 410, 15, 2, 2006, 20, 33, 50);

INSERT INTO `USER_TAGGEDMOVIES` (userID, movieID, tagID, date_day, date_month, date_year, date_hour, date_minute, date_second
) values (190, 4993, 410, 15, 2, 2006, 21, 57, 36);

INSERT INTO `USER_TAGGEDMOVIES` (userID, movieID, tagID, date_day, date_month, date_year, date_hour, date_minute, date_second
) values (190, 5039, 410, 15, 2, 2006, 20, 33, 42);

INSERT INTO `USER_TAGGEDMOVIES` (userID, movieID, tagID, date_day, date_month, date_year, date_hour, date_minute, date_second
) values (190, 5069, 712, 30, 6, 2006, 22, 40, 15);

INSERT INTO `USER_TAGGEDMOVIES` (userID, movieID, tagID, date_day, date_month, date_year, date_hour, date_minute, date_second
) values (190, 5072, 712, 16, 4, 2008, 19, 1, 0);

INSERT INTO `USER_TAGGEDMOVIES` (userID, movieID, tagID, date_day, date_month, date_year, date_hour, date_minute, date_second
) values (190, 5146, 712, 30, 6, 2006, 22, 39, 46);

INSERT INTO `USER_TAGGEDMOVIES` (userID, movieID, tagID, date_day, date_month, date_year, date_hour, date_minute, date_second
) values (190, 5618, 712, 30, 6, 2006, 22, 39, 11);

INSERT INTO `USER_TAGGEDMOVIES` (userID, movieID, tagID, date_day, date_month, date_year, date_hour, date_minute, date_second
) values (190, 5690, 712, 30, 6, 2006, 22, 40, 35);

INSERT INTO `USER_TAGGEDMOVIES` (userID, movieID, tagID, date_day, date_month, date_year, date_hour, date_minute, date_second
) values (190, 5952, 410, 15, 2, 2006, 21, 57, 48);

INSERT INTO `USER_TAGGEDMOVIES` (userID, movieID, tagID, date_day, date_month, date_year, date_hour, date_minute, date_second
) values (190, 5971, 712, 30, 6, 2006, 22, 39, 38);

INSERT INTO `USER_TAGGEDMOVIES` (userID, movieID, tagID, date_day, date_month, date_year, date_hour, date_minute, date_second
) values (190, 6283, 712, 30, 6, 2006, 22, 40, 10);

INSERT INTO `USER_TAGGEDMOVIES` (userID, movieID, tagID, date_day, date_month, date_year, date_hour, date_minute, date_second
) values (190, 6350, 712, 30, 6, 2006, 22, 40, 2);

INSERT INTO `USER_TAGGEDMOVIES` (userID, movieID, tagID, date_day, date_month, date_year, date_hour, date_minute, date_second
) values (190, 6857, 712, 30, 6, 2006, 22, 42, 8);

INSERT INTO `USER_TAGGEDMOVIES` (userID, movieID, tagID, date_day, date_month, date_year, date_hour, date_minute, date_second
) values (190, 7099, 712, 30, 6, 2006, 22, 39, 19);

INSERT INTO `USER_TAGGEDMOVIES` (userID, movieID, tagID, date_day, date_month, date_year, date_hour, date_minute, date_second
) values (190, 7153, 410, 15, 2, 2006, 20, 32, 34);

INSERT INTO `USER_TAGGEDMOVIES` (userID, movieID, tagID, date_day, date_month, date_year, date_hour, date_minute, date_second
) values (190, 8607, 712, 30, 6, 2006, 22, 42, 14);

INSERT INTO `USER_TAGGEDMOVIES` (userID, movieID, tagID, date_day, date_month, date_year, date_hour, date_minute, date_second
) values (190, 26662, 712, 30, 6, 2006, 22, 41, 51);

INSERT INTO `USER_TAGGEDMOVIES` (userID, movieID, tagID, date_day, date_month, date_year, date_hour, date_minute, date_second
) values (190, 27728, 712, 16, 4, 2008, 19, 0, 36);
