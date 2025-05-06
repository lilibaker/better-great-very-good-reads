# Reader Radar

Reader Radar is a Flask-based web application for book lovers to track their
reading, explore recommendations, and manage personalized book lists. The app
allows users to search for books, view recommendations, and organize their
reading into the categories "Current Reads," "Unread," "Wish List," and
"Finished."

## Features

- **Book Lists**: Organize books into categories like "Current Reads," "Unread,"
  "Wish List," and "Finished."
- **Search**: Search for books by title or author.
- **Recommendations**: View book recommendations based on external ratings.
- **Reviews**: Add reviews and ratings for books.

## Setup

### Prerequisites

- Python 3.11 or higher
- Flask
- SQLite

### Installation

1. Clone the repository:

   ```bash
   git clone https://github.com/your-username/better-great-very-good-reads.git
   cd better-great-very-good-reads
   ```

2. Set up a virtual environment (optional but recommended):

    ```bash
    python3 -m venv venv
    source venv/bin/activate
    ```

3. Set the Flask application environment variable:

    ```bash
    export FLASK_APP=reader-radar/__init__.py
    ```

4. Test that flask is properly installed

    ```bash
    flask run
    ```

    Ctr+C to exit

5. Initialize the database

    ```bash
    flask init-seed-db
    ```

    - Use flask init-db to create the database without seeding.
    - Use flask seed-db to populate an existing database with seed data.

6. Run the application

    ```bash
    flask run
    ```

## Acknowledgments

- [Flask](https://flask.palletsprojects.com/) - Web framework
- [Font Awesome](https://fontawesome.com/) - Icons
- [Open Library API](https://openlibrary.org/developers/api) - Book cover images
