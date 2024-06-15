create database Product;


create table Product.Product (
  Pname varchar(20) primary key,
  price float not null,
  category varchar(20) check (category in ('Gadget', 'Photography', 'Household')),
  manufacturer varchar(20)
  );
  
  desc Product.Product;

  
