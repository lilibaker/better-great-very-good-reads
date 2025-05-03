import sqlite3

from flask import Blueprint
from flask import flash
from flask import g  # store data for current request
from flask import redirect
from flask import render_template
from flask import render_template_string
from flask import request
from flask import url_for
from werkzeug.exceptions import abort

from .auth import login_required
from .db import get_db


# init my lists
# def render_my_lists(user_id):
#   """Get books lists and books for my lists page."""
#   book_lists = get_book_lists(user_id)
#   books = get_user_books(user.id)
#   return render_template("mylists.html", book_lists, books)


# def get_book_list_books(list_name):
#     """
#     Get books for list given id.
#     """
#     books_lists = (
#         get_db()
#         .execute(
#             "SELECT b.id, user_id, list_name"
#             "FROM book_list b JOIN user u ON b.user_id = u.id"  #! change this if login logic knows user id
#             "WHERE b.list_name = ?"(
#                 list_name,
#             ),
#         )
#         .fetchall()
#     )

#     return books_lists


# def get_book_list_items()

# get books in list

# get ratings

# get review text


# get books by title or author
def broad_search(search_string):
    """Get books that match in author or title"""

    books = (
        get_db()
        .execute(
            "SELECT b.id, title, author"
            " FROM books b "
            " WHERE title LIKE '%' || ? || '%' OR author LIKE '%' || ? || '%'",
            (search_string, search_string),
        )
        .fetchall()
    )

    return books


# get book page
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
