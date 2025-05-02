-- Initialize the database.
-- Drop any existing data and create empty tables.

DROP TABLE IF EXISTS user;
DROP TABLE IF EXISTS relationships;
DROP TABLE IF EXISTS book_lists;
DROP TABLE IF EXISTS book_lists_items;
DROP TABLE IF EXISTS books;
DROP TABLE IF EXISTS reviews;


CREATE TABLE user (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  username TEXT UNIQUE NOT NULL,
  password TEXT NOT NULL
);

CREATE TABLE relationships (
  follower_id INTEGER NOT NULL,
  followed_id INTEGER NOT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (follower_id, followed_id),
  FOREIGN KEY (follower_id) REFERENCES user (id),
  FOREIGN KEY (followed_id) REFERENCES user (id)
);

CREATE TABLE book_lists (
  id INTEGER PRIMARY KEY,
  user_id INTEGER NOT NULL,
  name TEXT NOT NULL,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE book_list_items (
  id INTEGER PRIMARY KEY,
  book_list_id INTEGER NOT NULL,
  book_id INTEGER NOT NULL,
  added_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (book_list_id) REFERENCES book_lists(id)
  FOREIGN KEY (book_id) REFERENCES books(id),
  UNIQUE(book_list_id, book_id) -- one instance of book per list
);

CREATE TABLE books (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  title TEXT NOT NULL,
  author TEXT NOT NULL,
  -- TODO
);

CREATE TABLE reviews (
  -- TODO
);
