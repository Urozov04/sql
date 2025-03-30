-- DATABASE yaratish
CREATE DATABASE psql_db;

-- Yaratilgan DATABASE ga ulanish
\c psql_db;

-- users jadvalini yaratamiz
CREATE TABLE users (
    users_id SERIAL PRIMARY KEY,
    first_name VARCHAR(100),
    email VARCHAR(100),
    last_name VARCHAR(100),
    password VARCHAR(100),
    phone_number VARCHAR(100),
    address VARCHAR(100)
);

-- Yaratilgan users jadvalini ko'rish
select * from users;

-- posts jadvalini yaratamiz
CREATE TABLE posts (
    posts_id SERIAL PRIMARY KEY,
    title VARCHAR(100),
    content TEXT,
    slug VARCHAR(100),
    user_id INTEGER REFERENCES users(users_id)
);

-- Yaratilgan posts jadvalini ko'rish
select * from posts;

-- comments jadvalini yaratamiz
CREATE TABLE comments (
    comments_id SERIAL PRIMARY KEY,
    content TEXT,
    post_id INTEGER REFERENCES posts(posts_id),
    user_id INTEGER REFERENCES users(users_id),
    created_at TIMESTAMP
);

-- Yaratilgan comments jadvalini ko'rish
select * from comments;

-- users jadvaliga ma'lumotlar kirgizamiz
INSERT INTO users (first_name, email, last_name, password, phone_number, address) VALUES
('Yagshigeldi', 'yagshigeldi5425@gmail.com', 'Avezgeldiyev', 'qwer12345', '+998888975425', 'To''rtko''l'),
('Lutfiddin', 'lutfiddin5425@gmail.com', 'Zuxriddinov', '12345qwer', '+998996825425', 'Namangan'),
('Ali', 'ali@gmail.com', 'Valiyev', 'asdfg12345', '+998912345678', 'Andijon'),
('Nodir', 'nodir@gmail.com', 'Eliboyev', 'poiuy12345', '+998907654321', 'Xorazm'),
('Eldor', 'eldor@gmail.com', 'Shomuradov', 'nbvcx321', '+998975679832', 'Qarshi');

-- users jadvalidagi ma'lumotlarni ko'ramiz
select * from users;

-- posts jadvaliga ma'lumotlar kirgizamiz
INSERT INTO posts (title, content, slug, user_id) VALUES 
('Dasturlashning asosiy tamoyillari', 'Bu maqolada dasturlashning muhim tamoyillari haqida gapiramiz', 'dasturlash-tamoyillari', 1),
('Python va uning imkoniyatlari', 'Python dasturlash tili haqida batafsil malumot.', 'python-imkoniyatlari', 2),
('Web dasturlashda muhim vositalar', 'Web dasturlashda ishlatiladigan eng mashhur texnologiyalar.', 'web-dasturlash-vositalari', 3),
('Database dizayni', 'Yaxshi malumotlar bazasi dizayni qanday bolishi kerak?', 'database-dizayn', 4),
('JavaScript asoslari', 'JavaScriptning eng asosiy tushunchalari.', 'javascript-asoslari', 5);

-- posts jadvalidagi ma'lumotlarni ko'ramiz
select * from posts;

-- comments jadvaliga ma'lumotlar kirgizamiz
INSERT INTO comments (content, post_id, user_id) VALUES
('Juda foydali maqola rahmat', 1, 3),
('Python haqida batafsilroq yozing', 2, 1),
('Yaxshi maqola davom eting', 3, 4),
('Malumotlar bazasi dizayni muhim mavzu juda foydali', 4, 2),
('JavaScript boyicha qiziqarli misollar qoshing', 5, 5);

-- comments jadvalidagi ma'lumotlarni ko'ramiz
select * from comments;