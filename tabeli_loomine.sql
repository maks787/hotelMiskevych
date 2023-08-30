insert into guest(first_name,last_name,member_since)
values('maksim','miskev','2022-04-22');
insert into guest(first_name,last_name,member_since)
values('oleg','aye','2022-03-25');
insert into guest(first_name,last_name,member_since)
values('sasha','lox','2022-03-23');
insert into guest(first_name,last_name,member_since)
values('artur','shish','2022-02-21');

insert into room_type(description,max_capacity)
values('ahsausguas','2');
insert into room_type(description,max_capacity)
values('ufdfgdf','3');
insert into room_type(description,max_capacity)
values('ahsausguas','4');
insert into room_type(description,max_capacity)
values('ahsausguas','5');
insert into room_type(description,max_capacity)
values('fdfdufud','6');

insert into reservation(date_in,date_out,made_by,guest_id)
values('2023-03-05','2023-03-07','china',2);
insert into reservation(date_in,date_out,made_by,guest_id)
values('2023-03-10','2023-03-12','japan',3);
insert into reservation(date_in,date_out,made_by,guest_id)
values('2023-03-01','2023-03-13','estonia',4);
insert into reservation(date_in,date_out,made_by,guest_id)
values('2023-03-05','2023-03-09','usa',5);
insert into reservation(date_in,date_out,made_by,guest_id)
values('2023-03-05','2023-03-07','china',1);


insert into reserved_room(number_of_rooms,room_type_id,reservation_id)
values(3,'1','1');
insert into reserved_room(number_of_rooms,room_type_id,reservation_id)
values(2,'2','2');
insert into reserved_room(number_of_rooms,room_type_id,reservation_id)
values(4,'3','3');
insert into reserved_room(number_of_rooms,room_type_id,reservation_id)
values(5,'4','5');
insert into reserved_room(number_of_rooms,room_type_id,reservation_id)
values(7,'5','5');


insert into room(number,name,status,smoke,room_type_id)
values(2,'max','OK','1',1);
insert into room(number,name,status,smoke,room_type_id)
values(2,'sasha','OK','1',2);
insert into room(number,name,status,smoke,room_type_id)
values(2,'oleg','OK','1',3);
insert into room(number,name,status,smoke,room_type_id)
values(2,'alex','NO','0',4);
insert into room(number,name,status,smoke,room_type_id)
values(2,'dodik','NO','0',5);

insert into occupied_room(check_in,check_out,room_id,reservation_id)
values('2022-03-04','2022-03-07',1,1);
insert into occupied_room(check_in,check_out,room_id,reservation_id)
values('2022-03-19','2022-03-20',2,2);
insert into occupied_room(check_in,check_out,room_id,reservation_id)
values('2022-03-12','2022-03-15',1,3);
insert into occupied_room(check_in,check_out,room_id,reservation_id)
values('2022-03-02','2022-03-03',4,5);
insert into occupied_room(check_in,check_out,room_id,reservation_id)
values('2022-03-05','2022-03-08',2,1);

insert into hosted_at(guest_id,occupied_room_id)
values(1,1);
insert into hosted_at(guest_id,occupied_room_id)
values(2,1);
insert into hosted_at(guest_id,occupied_room_id)
values(3,4);
insert into hosted_at(guest_id,occupied_room_id)
values(3,2);
insert into hosted_at(guest_id,occupied_room_id)
values(1,3);

select * from reserved_room


