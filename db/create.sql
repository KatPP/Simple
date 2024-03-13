CREATE TABLE roles (
                       role_id SERIAL PRIMARY KEY,
                       role_name VARCHAR(50) NOT NULL
);


CREATE TABLE users (
                       user_id SERIAL PRIMARY KEY,
                       username VARCHAR(50) NOT NULL,
                       role_id INT,
                       FOREIGN KEY (role_id) REFERENCES roles(role_id)
);


CREATE TABLE rules (
                       role_id INT,
                       rule_name VARCHAR(50),
                       PRIMARY KEY (role_id, rule_name),
                       FOREIGN KEY (role_id) REFERENCES roles(role_id)
);

CREATE TABLE categories (
                            category_id SERIAL PRIMARY KEY,
                            category_name VARCHAR(50) NOT NULL
);

CREATE TABLE states (
                        state_id SERIAL PRIMARY KEY,
                        state_name VARCHAR(50) NOT NULL
);



CREATE TABLE items (
                       item_id SERIAL PRIMARY KEY,
                       user_id INT,
                       category_id INT,
                       state_id INT,
                       item_name VARCHAR(100) NOT NULL,
                       FOREIGN KEY (user_id) REFERENCES users(user_id),
                       FOREIGN KEY (category_id) REFERENCES categories(category_id),
                       FOREIGN KEY (state_id) REFERENCES states(state_id)
);

CREATE TABLE comments (
                          comment_id SERIAL PRIMARY KEY,
                          item_id INT,
                          user_id INT,
                          comment_text TEXT NOT NULL,
                          FOREIGN KEY (item_id) REFERENCES items(item_id),
                          FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE attachs (
                         attach_id SERIAL PRIMARY KEY,
                         item_id INT,
                         attach_name VARCHAR(100) NOT NULL,
                         FOREIGN KEY (item_id) REFERENCES items(item_id)
);




CREATE TABLE item_category (
                               item_id INT,
                               category_id INT,
                               PRIMARY KEY (item_id, category_id),
                               FOREIGN KEY (item_id) REFERENCES items(item_id),
                               FOREIGN KEY (category_id) REFERENCES categories(category_id)
);