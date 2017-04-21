drop table Heros cascade constraints;
create table Heros (
	name varchar2(20),
	basic varchar2(2),
	ability varchar2(2),
	durability varchar2(2),
	mobility varchar2(2),
	type varchar2(6),
	primary key (name)
);

insert into heros values ('Gideon', 9, 5, 5, 5, 'ranged');
insert into heros values ('Sparrow', 10, 4, 2, 2, 'ranged');
insert into heros values ('Aurora', 7, 6, 3, 8, 'melee');
insert into heros values ('Countess', 2, 9, 1, 7, 'melee');
insert into heros values ('Crunch', 6, 4, 5, 6, 'melee');
insert into heros values ('Dekker', 1, 6, 4, 6, 'ranged');
insert into heros values ('Feng Mao', 7, 2, 5, 7, 'ranged');
insert into heros values ('Greystone', 7, 3, 9, 6, 'melee');
insert into heros values ('GRIM.exe', 8, 5, 3, 1, 'ranged');
insert into heros values ('Grux', 7, 5, 5, 5, 'melee');
insert into heros values ('Howitzer', 2, 8, 3, 4, 'ranged');
insert into heros values ('Iggy', 3, 7, 3, 5, 'melee');
insert into heros values ('Kallari', 8, 4, 1, 9, 'melee');
insert into heros values ('Khaimera', 6, 4, 7, 4, 'melee');
insert into heros values ('Gadget', 2, 8, 2, 3, 'ranged');
insert into heros values ('Kwang', 6, 4, 7, 5, 'melee');
insert into heros values ('Lt. Bellica', 2, 7, 4, 2, 'ranged');
insert into heros values ('Murdock', 10, 5, 2, 1, 'ranged');
insert into heros values ('Muriel', 1, 5, 3, 6, 'ranged');
insert into heros values ('Narbash', 3, 3, 8, 4, 'melee');
insert into heros values ('Rampage', 4, 2, 8, 7, 'melee');
insert into heros values ('Riktor', 3, 3, 10, 1, 'melee');
insert into heros values ('Serath', 8, 6, 2, 5, 'melee');
insert into heros values ('Sevarog', 4, 4, 10, 3, 'melee');
insert into heros values ('Shinbi', 2, 9, 3, 6, 'melee');
insert into heros values ('Steel', 2, 3, 10, 6, 'melee');
insert into heros values ('Fey', 3, 8, 3, 1, 'ranged');
insert into heros values ('TwinBlast', 9, 4, 2, 4, 'ranged');
insert into heros values ('Yin', 9, 3, 5, 6, 'melee');

drop table PlayerStats cascade constraints;
create table PlayerStats ( 
	gamerTag varchar2(20),
	kills varchar2(4),
	deaths varchar2(4),
	wins varchar2(4),
	losses varchar2(4),
	favHero varchar2(20),
	primary key (GamerTag)
);

insert into PlayerStats values ('kondadon2332', '945', '232', '334', '111', 'Gideon');
insert into PlayerStats values ('TommyC', '1032', '435', '444', '222', 'Sparrow');
insert into PlayerStats values ('MarkK', '121', '422', '19', '109', 'Aurora');
insert into PlayerStats values ('barcon', '987', '456', '422', '232', 'Countess');
insert into PlayerStats values ('LaughingCabbage', '455', '444', '555', '666', 'Kwang');
insert into PlayerStats values ('Slipkid13', '122', '333', '345', '543', 'TwinBlast');
insert into PlayerStats values ('Eggnog', '999', '877', '576', '501', 'Grux');
insert into PlayerStats values ('ian', '0', '9000', '0', '5328', 'Muriel');


drop table Games cascade constraints;
create table Games (
	gameID varchar2(6),
	home varchar2(20),
	away varchar2(20),
	homeHero varchar2(20),
	awayHero varchar2(20),
	winner varchar2(20),
	primary key (gameID)
);

insert into Games values ('111111', 'kondadon2332', 'TommyC', 'Gideon', 'Sparrow', 'kondadon2332');
insert into Games values ('222222', 'MarkK', 'barcon', 'Aurora', 'Countess', 'barcon');
insert into Games values ('333333', 'LaughingCabbage', 'SlipKid13', 'TwinBlast', 'Kwang', 'LaughingCabbage');
insert into Games values ('444444', 'Eggnog', 'TommyC', 'Grux', 'Yin', 'TommyC');
insert into Games values ('555555', 'kondadon2332', 'Slipkid13', 'Sparrow', 'TwinBlast', 'kondadon2332');
insert into Games values ('666666', 'barcon', 'Eggnog', 'Gideon', 'Khaimera', 'Eggnog');
insert into Games values ('777777', 'MarkK', 'TommyC', 'Howitzer', 'Sparrow', 'TommyC');
insert into Games values ('888888', 'Eggnog', 'LaughingCabbage', 'Lt. Bellica', 'Sevarog', 'Eggnog');
insert into Games values ('999999', 'kondadon2332', 'ian', 'Khaimera', 'Muriel', 'kondadon2332');
insert into Games values ('122222', 'TommyC', 'ian', 'Sparrow', 'Muriel', 'TommyC');
insert into Games values ('233333', 'Eggnog', 'ian', 'Grux', 'Muriel', 'Eggnog');
insert into Games values ('344444', 'Slipkid13', 'MarkK', 'TwinBlast', 'Khaimera', 'Slipkid13');
insert into Games values ('455555', 'Eggnog', 'kondadon2332', 'Rampage', 'Greystone', 'kondadon2332');
insert into Games values ('566666', 'ian', 'Slipkid13', 'Muriel', 'Shinbi', 'Slipkid13');
insert into Games values ('677777', '', 'Slipkid13', 'Muriel', 'Shinbi', 'Slipkid13');


drop table Winner cascade constraints;
create table Winner (
	gameID varchar2(6),
	winnerName varchar2(20),
	kills varchar2(2),
	deaths varchar2(2),
	structursDestroyed varchar2(1),
	primary key (gameID)
);

insert into Winner values ('111111', 'kondadon2332', 20, 5, 8);
insert into Winner values ('222222', 'barcon', 14, 5, 8);
insert into Winner values ('333333', 'LaughingCabbage', 12, 7, 8);
insert into Winner values ('444444', 'TommyC', 19, 5, 8);
insert into Winner values ('555555', 'kondadon2332', 23, 2, 8);
insert into Winner values ('666666', 'Eggnog', 18, 4, 8);
insert into Winner values ('777777', 'TommyC', 15, 5, 8);
insert into Winner values ('888888', 'Eggnog', 10, 8, 8);
insert into Winner values ('122222', 'TommyC', 50, 0, 8);
insert into Winner values ('233333', 'Eggnog', 38, 0, 8);
insert into Winner values ('344444', 'Slipkid', 12, 6, 8);
insert into Winner values ('455555', 'kondadon2332', 19, 12, 8);
insert into Winner values ('566666', 'Slipkid13', 28, 0, 8);

drop table Loser cascade constraints;
create table Loser (
	gameID varchar2(6),
	loserName varchar2(20),
	kills varchar2(2),
	deaths varchar2(2),
	structursDestroyed varchar2(1),
	primary key (gameID)
);

insert into Loser values ('111111', 'TommyC', 5, 20, 6);
insert into Loser values ('222222', 'MarkK', 5, 14, 2);
insert into Loser values ('333333', 'SlipKid13', 12, 7, 4);
insert into Loser values ('444444', 'Eggnog', 5, 19, 7);
insert into Loser values ('555555', 'Slipkid13', 2, 23, 1);
insert into Loser values ('666666', 'barcon', 4, 18, 6);
insert into Loser values ('777777', 'MarkK', 5, 15, 1);
insert into Loser values ('888888', 'LaughingCabbage', 8, 10, 7);
insert into Loser values ('999999', 'ian', 0, 40, 0);
insert into Loser values ('122222', 'ian', 0, 50, 0);
insert into Loser values ('233333', 'ian', 0, 38, 0);
insert into Loser values ('344444', 'MarkK', 6, 12, 2);
insert into Loser values ('455555', 'Eggnog', 12, 19, 5);
insert into Loser values ('566666', 'ian', 0, 28, 0);



