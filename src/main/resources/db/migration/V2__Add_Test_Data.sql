insert into user_entity (id, is_active, username, password)
values (1, true, 'admin', '123');

insert into user_role (user_id, roles)
values (1, 'USER'), (1, 'ADMIN');

insert into category_entity (id, name)
values (1, 'Без категории');