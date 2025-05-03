-- Seed data for the database in dev

-- Insert users
INSERT INTO users (username, password) VALUES
('rose_tyler', 'badwolf'),
('martha_jones', 'freedom'),
('donna_noble', 'noble123');

-- Insert names
INSERT INTO names (user_id, first_name, last_name) VALUES
(1, 'Rose', 'Tyler'),
(2, 'Martha', 'Jones'),
(3, 'Donna', 'Noble');

-- Insert relationships
INSERT INTO relationships (follower_id, followed_id) VALUES
(1, 2),
(2, 3),
(3, 1);

-- Insert books
INSERT INTO books (title, author) VALUES
("The Time Traveler's Wife", "Audrey Niffenegger"),
("The Hitchhiker's Guide to the Galaxy", "Douglas Adams"),
("Harry Potter and the Sorcerer's Stone", "J.K. Rowling"),
("The Martian", "Andy Weir"),
("Dune", "Frank Herbert");

-- Insert book lists
INSERT INTO book_lists (user_id, book_name) VALUES
(1, 'Favorites'),
(2, 'Recommended'),
(3, 'My Library');

-- Insert book list items
INSERT INTO book_list_items (book_list_id, book_id) VALUES
(1, 1),
(1, 2),
(2, 2),
(2, 3),
(3, 1),
(3, 3);

-- Insert reviews
INSERT INTO reviews (book_id, user_id, rating, review_text) VALUES
(1, 1, 5, 'A thought-provoking masterpiece.'),
(2, 2, 4, 'A timeless classic.'),
(3, 3, 5, 'An iconic piece of literature.');
