CREATE TABLE users (
                       user_id INT PRIMARY KEY,
                       username VARCHAR(50),
                       role_id INT
);

CREATE TABLE roles (
                       role_id INT PRIMARY KEY,
                       role_name VARCHAR(50)
);

CREATE TABLE rules (
                       rule_id INT PRIMARY KEY,
                       rule_name VARCHAR(50)
);

CREATE TABLE roles_rules (
                             role_id INT,
                             rule_id INT,
                             PRIMARY KEY (role_id, rule_id),
                             FOREIGN KEY (role_id) REFERENCES roles(role_id),
                             FOREIGN KEY (rule_id) REFERENCES rules(rule_id)
);

CREATE TABLE items (
                       item_id INT PRIMARY KEY,
                       user_id INT,
                       category_id INT,
                       state_id INT
);

CREATE TABLE comments (
                          comment_id INT PRIMARY KEY,
                          item_id INT,
                          comment_text TEXT
);

CREATE TABLE attachs (
                         attach_id INT PRIMARY KEY,
                         item_id INT,
                         file_name VARCHAR(100)
);

CREATE TABLE states (
                        state_id INT PRIMARY KEY,
                        state_name VARCHAR(50)
);

CREATE TABLE categories (
                            category_id INT PRIMARY KEY,
                            category_name VARCHAR(50)
);
