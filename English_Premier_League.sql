create database English_Premier_League;
use English_Premier_League;

Create table Club
(ClubID mediumint not null auto_increment,
ClubName varchar(50), 
ClubCity varchar(25),
AwayWins int,
primary key(ClubID)
);

Create table Referee
(RefereeID mediumint not null auto_increment,
FirstName varchar(35),
LastName varchar(35),
DOB date,
Nationality varchar(50),
primary key(RefereeID)
);

Create table ManagerAssistant
(ManagerID mediumint not null auto_increment,
FirstName varchar(35),
LastName varchar(35),
Type_ varchar(50),
DOB date,
Nationality varchar(50),
primary key(ManagerID)
);

Create table Player
(PlayerID mediumint not null auto_increment,
FirstName varchar(35),
LastName varchar(35),
Height char(6),
Weight numeric(3),
DOB date,
Nationality varchar(50),
primary key(PlayerID)
);

Create table Match_
(MatchID mediumint not null auto_increment,
Season year,
GameDate date,
HomeClubID mediumint not null,
AwayClubID mediumint not null,
HomeScore smallint,
AwayScore smallint,
RefereeID mediumint not null,
primary key(MatchID),
foreign key (HomeClubID) references club(ClubID),
foreign key (AwayClubID) references club(ClubID)
);
alter table Match_
add foreign key (RefereeID) references referee(RefereeID);


Create table Goals
(GoalTime time,
PlayerID mediumint not null,
MatchID mediumint not null,
Type_ varchar(50),
primary key(GoalTime, PlayerID, MatchID),
foreign key (PlayerID) references player(PlayerID),
foreign key (MatchID) references match_(MatchID)
);

Create table Payer_Club_History 
(Season year, 
PlayerID mediumint not null,
ClubID mediumint not null, 
StartDate date,
EndDate date,
Primary key(Season, PlayerID, ClubID), 
foreign key (PlayerID) references player(PlayerID),
foreign key (ClubID) references club(ClubID)
);

Create table Manager_Club_History 
(Season year, 
ManagerID mediumint not null,
ClubID mediumint not null, 
StartDate date,
EndDate date,
Primary key(Season, ManagerID, ClubID), 
foreign key (ManagerID) references managerassistant(ManagerID),
foreign key (ClubID) references club(ClubID)
);


insert into club(ClubName, ClubCity, AwayWins)
		Value('Arsenal', 'London', '23'),
			('Aston Villa', 'Birmingham', '16'),
            ('Chelsea', 'Fulham', '10'),
            ('Liverpool', 'Liverpool', '15'),
            ('Tottenham Hotspur','Tottenham', '16'),
            ('Manchester United', 'Greater Manchester', '18'),
            ('Leicester City', 'Leicester', '8'), 
            ('Derby County', 'Derby', '4' ),
            ('Everton', 'Liverpool', '15'),
            ('Swansea City', 'Swansea', '5'),
            ('Cardiff City', 'Cardiff', '2'),
            ('D.C. United', ' Washington, D.C.', '5' );
            
            
Insert into player(FirstName, LastName, Height, Weight, DOB, Nationality)
		Value('Matt', 'Turner', "5'9", '170', '1994-05-25', 'United States'),
		('Ezri', 'Konsa', "5'11", '175', '1990-05-10', 'England'),
        ('Thiago', 'Silva', "5'11", '185', '1999-05-22', 'Brazil'),
		('Kalidou', 'Koulibaly', "6'0", '175', '1994-02-24', 'Senegal'), 
        ('Joël', 'Matip', "6'0", '175', '1994-02-24', 'Cameroon'), 
        ('Davinson', 'Sánchez', "6'0", '175', '1994-02-24', 'Colombia'), 
		('Diogo', 'Dalot', "5'7", '185', '1999-03-18', 'Portugal'), 
        ('Jannik', 'Vestergaard', "5'7", '185', '1992-03-08', 'Denmark'), 
        ('Mason', 'Holgate', "5'11", '185', '1992-03-08', 'England'), 
        ('Mason', 'Holgate', "5'11", '185', '1992-03-08', 'England'),
        ('Wayne', 'Rooney', "5'9", '175', '1984-09-24', 'United Kindom');        
        
Insert into referee(FirstName, LastName, DOB, Nationality)
			value('Martin',  'Atkinson', '1971-05-29', 'England'),
            ('Anthony',  'Taylor', '1980-05-04', 'England'), 
            ('Craig',  'Pawson', '1980-05-04', 'England'),
            ('Michael', 'Oliver', '1980-05-04', 'Spain');
            
Insert into payer_club_history (Season, PlayerID, ClubID, StartDate, EndDate)
			value('2020', '11', '8', '2020-01-1', '2021-12-30'),
				('2018', '11', '12', '2018-01-1', '2019-12-30'),
                ('2016', '11', '9', '2017-01-1', '2018-12-30'), 
                ('2020', '1', '1', '2020-01-1', '2021-12-30'),
				('2020', '2', '2', '2020-01-1', '2021-12-30'), 
                ('2020', '3', '3', '2020-01-1', '2021-12-30'), 
                ('2020', '4', '3', '2020-01-1', '2021-12-30'), 
                ('2020', '5', '4', '2020-01-1', '2021-12-30'), 
                ('2020', '6', '5', '2020-01-1', '2021-12-30'),
                ('2020', '7', '6', '2020-01-1', '2021-12-30'),
                ('2020', '8', '7', '2020-01-1', '2021-12-30'), 
                ('2020', '9', '8', '2020-01-1', '2021-12-30');
                
insert into managerassistant (FirstName, LastName, Type_, DOB, Nationality)
			value('Jürgen', 'Klopp', 'Manager', '1979-01-25', 'Germany'),
				('Graham', 'Potter', 'Manager', '1968-04-15', 'England'),
                ('Frank', 'Lampard', 'Assistant', '1978-06-20', 'England'),
                ('David', 'Moyes', 'Manager', '1963-06-20', 'England'),
                ('Mikel', 'Arteta', 'Manager', '1982-04-26', 'Spanish'),
                ('Antonio', 'Conte', 'Manager', '1969-04-26', 'Italian'),
                ('Alex', 'Ferguson', 'Manager', '1941-12-31', 'England'),
                ('Brendan', 'Rodgers', 'Manager', '1973-01-26', 'Northern Ireland');
            
            
            
insert into manager_club_history (Season, ManagerID, ClubID, StartDate, EndDate)
			Value('2020', '1', '4', '2020-01-1', '2021-12-30'),
				('2020', '2', '3', '2020-01-1', '2021-12-30'), 
                ('2020', '3', '3', '2020-01-1', '2021-12-30'), 
                ('2018', '4', '6', '2018-01-1', '2019-12-30'),
                ('2020', '5', '1', '2020-01-1', '2021-12-30'),
                ('2020', '6', '5', '2020-01-1', '2021-12-30'),
                ('2013', '7', '6', '2020-01-1', '2021-12-30'),
                ('2020', '8', '7', '2020-01-1', '2021-12-30');
                
insert into match_ (Season, GameDate, HomeClubID, AwayClubID, HomeScore, AwayScore, RefereeID)
			Value ('2018', '2018-03-01', '6', '7', '5', '2', '2'),
				('2018', '2018-03-15', '4', '5', '3', '2', '4'),
				('2020', '2020-02-24', '1', '2', '4', '2', '1'),
				('2020', '2020-03-01', '2', '3', '0', '2', '2'),
                ('2020', '2020-03-08', '3', '4', '0', '1', '3'),
                ('2020', '2020-03-15', '4', '5', '3', '2', '4'),
                ('2017', '2020-03-22', '5', '6', '1', '2', '1'),
                ('2020', '2020-03-01', '9', '10', '5', '2', '3');

insert into goals (GoalTime, PlayerID, MatchID, Type_)
			Value('002025', '7', '1', 'Normal'), 
				('002525', '7', '1', 'Normal'), 
                ('003000', '7', '1', 'Normal'), 
                ('002010', '7', '1', 'Normal'), 
                ('002027', '7', '1', 'Normal'), 
				('003045', '8', '1', 'Normal'),
                ('003542', '8', '1', 'Normal'),
                ('012017', '8', '1', 'Normal'),
				('003540', '4', '4', 'Normal'),
                ('005700', '4', '4', 'Normal'),
                ('005800', '5', '4', 'Normal');



#1 
Select p.PlayerID, p.FirstName, p.LastName
from player p
join payer_club_history h
on p.PlayerID = h.PlayerID
where h.Season = '2016' 
and h.ClubID = (SELECT ClubID 
FROM club 
WHERE ClubName = 'Chelsea');

select r.RefereeID, r.FirstName, r.LastName
From match_ m
join referee r
on m.RefereeID = r.RefereeID;



















                
            
            
                