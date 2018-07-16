use pension;
 -- 메세지 테이블
create table message(
message_id int(11) auto_increment,
message_sender varchar(45),
message_receiver varchar(45),
message_content text,
message_sendTime datetime default now(),
CHATROOM_chatroom_id int(11),
message_readTime datetime default now(),
User_user_id varchar(45),
TUTOR_USER_user_id varchar(45),
CLASS_class_id int(11),
primary key(message_id)
);

create table chatroom(
	chatroom_id int(11) auto_increment,
    USER_user_id varchar(45),
    TUTOR_USER_user_id varchar(45),
    CLASS_class_id int(11)
    primary key(chatroom_id)
);