drop table if exists house_badge;
drop table if exists house_image;
drop table if exists favorite;
drop table if exists booking;
drop table if exists house;
drop table if exists user;


create table house (
    house_id int primary key auto_increment,
    house_name varchar (255),
    host_name varchar (255),
    host_is_super boolean,
    host_image varchar (512),
    address varchar (512),
    latitude float,
    longitude float,
    room_type varchar (255),
    bath_count int  default 0,
    bed_room_count int default 0,
    bed_count int default 0,
    original_price int default 0,
    sale_price int default 0,
    cleaning_fee int default 0,
    review_count int default 0,
    rate int default 0,
    adult_count int default 0,
    child_count int default 0,
    infant_count int default 0,
    guest_count int default 0
    );

create table house_badge (
    house_badge_id int primary key auto_increment,
    house_id int references house(house_id),
    cancellation_policy varchar (255),
    transit varchar (255),
    host_response_time varchar (255),
    amenities varchar (255)
);

create table house_image (
    house_image_id int primary key auto_increment,
    house_id int references house(house_id),
    url varchar (255)
);

create table user (
    user_id int primary key auto_increment,
    email varchar (255)
);

create table favorite (
    favorite_id int primary key auto_increment,
    house_id int references house(house_id),
    user_id int references user(user_id)
);

create table booking (
    booking_id int primary key auto_increment,
    house_id int references house(house_id),
    user_id int references user(user_id),
    check_in_date date,
    check_out_date date,
    guest_count int,
    night_count int
);



