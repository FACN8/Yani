BEGIN;

DROP TABLE IF EXISTS users CASCADE;
DROP TABLE IF EXISTS courses CASCADE;
DROP TABLE IF EXISTS subs CASCADE;


CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(20) NOT NULL,
    password VARCHAR(255) NOT NULL,
    pic text
);

CREATE TABLE courses (
    id SERIAL PRIMARY KEY,
    title VARCHAR(40) NOT NULL,
    pic text,
    descr text NOT NULL
);

CREATE TABLE subs (
    id SERIAL PRIMARY KEY,
    user_id int NOT NULL,
    FOREIGN KEY (user_id) references users (id),
    course_id int NOT NULL,
    FOREIGN KEY (course_id) references courses (id)
);

INSERT INTO users (username, password, pic) VALUES
    ('lina', 'almajd', 'https://i.ytimg.com/vi/h30Whv_Ubwg/maxresdefault.jpg'),
    ('ivan', 'naz', 'https://i.pinimg.com/originals/a1/30/86/a130864e6d6db6899ca996b0691113f8.jpg'),
    ('rabea', 'haifa', 'https://www.muhtwa.com/wp-content/uploads/%D8%B3%D9%86%D8%AF%D8%A8%D8%A7%D8%AF-111.jpg'),
    ('fake', 'fake', 'https://pbs.twimg.com/media/B8IHvwdIgAApGQ4.png');

INSERT INTO courses (title,pic,descr) VALUES
    ('Salesforce bullshit day','https://upload.wikimedia.org/wikipedia/en/thumb/8/83/Salesforce_logo.svg/1200px-Salesforce_logo.svg.png','2020-02-02', '16:00','A Hijje to go home early'),
    ('Oracle day','https://ir0.mobify.com/project-oss-www-fujitsu-com/c8/webp80/1536/https://www.fujitsu.com/il/Images/oracle-db580x224_tcm152-40873.jpg','2020-01-24', '13:00','A trip to petah tikva'),
    ('Valentines day','https://www.myjewishlearning.com/wp-content/uploads/2003/02/love2-1598x900.jpg','2020-02-14', '19:00','A Hijje to consume love'),
    ('Fatmeeh Birthday','https://cdn.mos.cms.futurecdn.net/vChK6pTy3vN3KbYZ7UU7k3-1200-80.jpg','2020-03-24', '15:30','The only real celebration');

INSERT INTO subs (user_id,course_id) VALUES
    (2,2),(3,2),(1,2),(2,4),(4,2),(4,1),
    (4,3),(4,4),(3,1),(3,4),(1,4),(2,3);


COMMIT;