INSERT INTO roles (role_name) VALUES ('Admin'), ('User');

INSERT INTO rules (role_id, rule_name) VALUES
                                           (1, 'Create Item'),
                                           (1, 'Edit Item'),
                                           (1, 'Delete Item'),
                                           (2, 'View Item');

INSERT INTO states (state_name) VALUES ('New'), ('In Progress'), ('Closed');

INSERT INTO categories (category_name) VALUES ('Hardware'), ('Software'), ('Networking');