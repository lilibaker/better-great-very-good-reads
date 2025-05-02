-- seed data for dev

-- Insert dummy data into the user table
INSERT INTO user (username, password) VALUES
('user1', 'password1'),
('user2', 'password2'),
('user3', 'password3');

-- Insert dummy data into the relationships table
INSERT INTO relationships (follower_id, followed_id) VALUES
(1, 2),
(2, 3),
(3, 1);

-- Insert dummy data into the book_lists table
INSERT INTO book_lists (user_id, name) VALUES
(1, 'Favorites'),
(2, 'Hated'),
(3, 'Sci-fi');

-- Insert dummy data into the book_list_items table
INSERT INTO book_list_items (book_list_id, book_id) VALUES
(1, 1),
(1, 2),
(2, 3);

-- Insert dummy data into the books table
INSERT INTO books (id) VALUES
(1, '1984', 'George Orwell'),
(2, 'To Kill a Mockingbird', 'Harper Lee'),
(3, 'Dune', 'Frank Herbert');

-- Insert dummy data into the reviews table
-- TODO: Add columns to the reviews table before inserting data
