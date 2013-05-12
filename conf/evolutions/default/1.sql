# Users schema

# --- !Ups

create table Customer (
  username                  varchar(64) not null,
  name                      varchar(255),
  password                  varchar(255),
  constraint pk_customer    primary key (username)
);

create table Hotel (
  id                   bigint not null auto_increment,
  name                 varchar(255),
  address              varchar(255),
  city                 varchar(255),
  state                varchar(255),
  zip                  varchar(255),
  country              varchar(255),
  price                double,
  constraint pk_hotel  primary key (id)
);

--
-- create table Booking (
--   id                    bigint not null auto_increment,
--   user_id               varchar(64) not null,
--   hotel_id              bigint not null,
--   checkinDate           date,
--   checkoutDate          date,
--   creditCard            varchar(255),
--   creditCardName        varchar(255),
--   creditCardExpiryMonth int2 not null,
--   creditCardExpiryYear  int4 not null,
--   smoking               boolean not null,
--   beds                  int2 not null,
-- );


-- alter table computer add constraint fk_computer_company_1 foreign key (company_id) references company (id) on delete restrict on update restrict;
-- create index ix_computer_company_1 on computer (company_id);

insert into Customer (username, name, password) values ('keith', 'Keith', '417c7382b16c395bc25b5da1398cf076');
insert into Customer (username, name, password) values ('erwin', 'Erwin', '12430911a8af075c6f41c6976af22b09');
insert into Customer (username, name, password) values ('jeremy', 'Jeremy', '57c6cbff0d421449be820763f03139eb');
insert into Customer (username, name, password) values ('scott', 'Scott', '942f2339bf50796de535a384f0d1af3e');
insert into Hotel (id, price, name, address, city, state, zip, country) values (1, 199, 'Westin Diplomat', '3555 S. Ocean Drive', 'Hollywood', 'FL', '33019', 'USA');
insert into Hotel (id, price, name, address, city, state, zip, country) values (2, 60, 'Jameson Inn', '890 Palm Bay Rd NE', 'Palm Bay', 'FL', '32905', 'USA');
insert into Hotel (id, price, name, address, city, state, zip, country) values (3, 199, 'Chilworth Manor', 'The Cottage, Southampton Business Park', 'Southampton', 'Hants', 'SO16 7JF', 'UK');
insert into Hotel (id, price, name, address, city, state, zip, country) values (4, 120, 'Marriott Courtyard', 'Tower Place, Buckhead', 'Atlanta', 'GA', '30305', 'USA');
insert into Hotel (id, price, name, address, city, state, zip, country) values (5, 180, 'Doubletree', 'Tower Place, Buckhead', 'Atlanta', 'GA', '30305', 'USA');
insert into Hotel (id, price, name, address, city, state, zip, country) values (6, 450, 'W Hotel', 'Union Square, Manhattan', 'NY', 'NY', '10011', 'USA');
insert into Hotel (id, price, name, address, city, state, zip, country) values (7, 450, 'W Hotel', 'Lexington Ave, Manhattan', 'NY', 'NY', '10011', 'USA');
insert into Hotel (id, price, name, address, city, state, zip, country) values (8, 250, 'Hotel Rouge', '1315 16th Street NW', 'Washington', 'DC', '20036', 'USA');
insert into Hotel (id, price, name, address, city, state, zip, country) values (9, 300, '70 Park Avenue Hotel', '70 Park Avenue', 'NY', 'NY', '10011', 'USA');
insert into Hotel (id, price, name, address, city, state, zip, country) values (10, 300, 'Conrad Miami', '1395 Brickell Ave', 'Miami', 'FL', '33131', 'USA');
insert into Hotel (id, price, name, address, city, state, zip, country) values (11, 80, 'Sea Horse Inn', '2106 N Clairemont Ave', 'Eau Claire', 'WI', '54703', 'USA');
insert into Hotel (id, price, name, address, city, state, zip, country) values (12, 90, 'Super 8 Eau Claire Campus Area', '1151 W Macarthur Ave', 'Eau Claire', 'WI', '54701', 'USA');
insert into Hotel (id, price, name, address, city, state, zip, country) values (13, 160, 'Marriot Downtown', '55 Fourth Street', 'San Francisco', 'CA', '94103', 'USA');
insert into Hotel (id, price, name, address, city, state, zip, country) values (14, 200, 'Hilton Diagonal Mar', 'Passeig del Taulat 262-264', 'Barcelona', 'Catalunya', '08019', 'Spain');
insert into Hotel (id, price, name, address, city, state, zip, country) values (15, 210, 'Hilton Tel Aviv', 'Independence Park', 'Tel Aviv', '', '63405', 'Israel');
insert into Hotel (id, price, name, address, city, state, zip, country) values (16, 240, 'InterContinental Tokyo Bay', 'Takeshiba Pier', 'Tokyo', '', '105', 'Japan');
insert into Hotel (id, price, name, address, city, state, zip, country) values (17, 130, 'Hotel Beaulac', ' Esplanade L�opold-Robert 2', 'Neuchatel', '', '2000', 'Switzerland');
insert into Hotel (id, price, name, address, city, state, zip, country) values (18, 140, 'Conrad Treasury Place', 'William & George Streets', 'Brisbane', 'QLD', '4001', 'Australia');
insert into Hotel (id, price, name, address, city, state, zip, country) values (19, 230, 'Ritz Carlton', '1228 Sherbrooke St', 'West Montreal', 'Quebec', 'H3G1H6', 'Canada');
insert into Hotel (id, price, name, address, city, state, zip, country) values (20, 460, 'Ritz Carlton', 'Peachtree Rd, Buckhead', 'Atlanta', 'GA', '30326', 'USA');
insert into Hotel (id, price, name, address, city, state, zip, country) values (21, 220, 'Swissotel', '68 Market Street', 'Sydney', 'NSW', '2000', 'Australia');
insert into Hotel (id, price, name, address, city, state, zip, country) values (22, 250, 'Meli� White House', 'Albany Street', 'Regents Park London', '', 'NW13UP', 'Great Britain');
insert into Hotel (id, price, name, address, city, state, zip, country) values (23, 210, 'Hotel Allegro', '171 West Randolph Street', 'Chicago', 'IL', '60601', 'USA');

# --- !Downs
drop table Customer;
drop table Hotel;
