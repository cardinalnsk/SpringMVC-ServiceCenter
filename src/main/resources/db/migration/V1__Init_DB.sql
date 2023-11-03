create table binary_data (
    id bigserial not null,
    bytes oid,
    content_type varchar(255),
    name varchar(255),
    original_file_name varchar(255),
    preview_image boolean not null,
    size bigint,
    device_id bigint,
    primary key (id)
                         );


create table category_entity (
    id bigserial not null,
    name varchar(255),
    primary key (id)
                             );

create table client (
    id bigserial not null,
    name varchar(255),
    phone varchar(255),
    primary key (id)
                    );


create table device_entity (
    id bigserial not null,
    created_at timestamp(6),
    description varchar(255),
    filename varchar(255),
    issue_date timestamp(6),
    device_name varchar(255),
    repair_status varchar(255) check (
        repair_status in ('ACCEPTED_FOR_REPAIR',
                          'WAITING_FOR_PARTS',
                          'TO_BE_AGREED',
                          'ISSUED')
        ),
    trouble varchar(255),
    category_id bigint,
    client_id bigint,
    primary key (id)
                           );


create table user_entity (
    id bigserial not null,
    is_active boolean,
    password varchar(255),
    username varchar(255),
    primary key (id)
                         );

create table user_role (
    user_id bigint not null,
    roles varchar(255) check (
        roles in ('USER',
                  'ADMIN',
                  'MODERATOR')
        )
                       );


alter table if exists binary_data
    add constraint binary_data_device_fk
        foreign key (device_id) references device_entity;

alter table if exists device_entity
    add constraint device_category_fk
        foreign key (category_id) references category_entity;

alter table if exists device_entity
    add constraint device_client_fk
        foreign key (client_id) references client;

alter table if exists user_role
    add constraint user_role_user_fk
        foreign key (user_id) references user_entity;