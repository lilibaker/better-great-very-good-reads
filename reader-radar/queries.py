import sqlite3

from werkzeug.exceptions import abort

from .auth import login_required
from .db import get_db


# get books in a given book list
def get_book_list_books(list_name, user_id):
    """
    Get books for list given id.
    """
    # step 1
    book_list = (
        get_db()
        .execute(
            "SELECT id FROM book_lists WHERE user_id = ? AND list_name = ?",
            (user_id, list_name),
        )
        .fetchone()
    )

    if book_list is None:
        return None

    books = (
        get_db()
        .execute(
            "SELECT b.id, b.title, b.author, b.isbn "
            "FROM books b "
            "JOIN book_list_items bli ON b.id = bli.book_id "
            "WHERE bli.book_list_id = ?",
            (book_list["id"],),
        )
        .fetchall()
    )

    return books


# get review text
def get_reviews(book_id):
    """Get reviews based on book_id"""
    reviews = (
        get_db()
        .execute(
            "SELECT r.id, book_id, user_id, rating, review_text, created_at"
            " FROM reviews r"
            " WHERE r.book_id = ?",
            (book_id,),
        )
        .fetchall()
    )
    return reviews


# get books by title or author
def broad_search(search_string):
    """Get books that match in author or title"""

    books = (
        get_db()
        .execute(
            "SELECT b.id, title, author, isbn, synopsis "
            " FROM books b "
            " WHERE title LIKE '%' || ? || '%' OR author LIKE '%' || ? || '%'",
            (search_string, search_string),
        )
        .fetchall()
    )

    return books


def get_book(id):
    """Get book by id"""
    book = (
        get_db()
        .execute(
            "SELECT b.id, title, author, isbn, page_length, synopsis"
            " FROM books b"
            " WHERE b.id = ? ",
            (id,),
        )
        .fetchone()
    )
    if book is None:
        abort(404, f"Book id {id} doesn't exist")
    return book


# get top books
def get_top_books():
    """Get top three books based on ratings"""
    books = (
        get_db()
        .execute("SELECT * FROM books ORDER BY external_ratings DESC LIMIT 3")
        .fetchall()
    )
    return books


# get random book recommendation
def get_random_recommendation():
    """Get random recommendation between 4 and 5 stars"""
    book = (
        get_db()
        .execute(
            "SELECT * FROM books "
            "WHERE external_ratings >= 4 "
            "ORDER BY RANDOM() LIMIT 1"
        )
        .fetchone()
    )
    return book
