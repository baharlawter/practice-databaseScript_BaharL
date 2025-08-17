start transaction;

DROP TABLE IF EXISTS comments;
DROP TABLE IF EXISTS posts;
DROP TABLE IF EXISTS users;

CREATE TABLE users (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) NOT NULL,
    email VARCHAR(100) DEFAULT 'N/A',
    password VARCHAR(255) NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE posts (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    title VARCHAR(100) NOT NULL,
    content TEXT NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE comments (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    post_id INT NOT NULL,
    user_id INT NOT NULL,
    comment TEXT NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (post_id) REFERENCES posts(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);
-- Inserting data to users
insert into users(username, email, password) values
( 'bahar-dev','bahar@example.com', '12345'),
('jane-dev', 'jane@example.com', '4567');
 select * from users;
 
 --  inserting data to posts
INSERT INTO posts (user_id, title, content) VALUES
(1, 'My first post', 'Hello I am excited to post'),
(2, 'React tips', 'Here are some tips about React');
 select * from posts;
 
 -- inserting data to comments
INSERT INTO comments (post_id, user_id, comment) VALUES
(1, 2, 'Welcome to the blogosphere!'),
(2, 1, 'Thanks for the React tips—super helpful.');
select * from comments;
 