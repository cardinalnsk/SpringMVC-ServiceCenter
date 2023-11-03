create extension if not exists pgcrypto;

update user_entity set password = crypt(password, gen_salt('bf', 8));