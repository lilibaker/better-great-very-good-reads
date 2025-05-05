from flask import Blueprint
from flask import flash
from flask import g
from flask import redirect
from flask import render_template
from flask import render_template_string
from flask import request
from flask import url_for
from werkzeug.exceptions import abort

from .auth import login_required
from .db import get_db
from . import queries

bp = Blueprint("/", __name__)


@bp.route("/")
def index():
    """Show recommended books"""
    books = queries.get_top_books()
    recommendation = queries.get_random_recommendation()
    current = queries.get_book_list_books("Current Reads", g.user["id"])
    unread = queries.get_book_list_books("Unread", g.user["id"])
    wish_list = queries.get_book_list_books("Wish List", g.user["id"])
    finished = queries.get_book_list_books("Finished", g.user["id"])
    return render_template(
        "home.html",
        books=books,
        recommendation=recommendation,
        current=current,
        unread=unread,
        wish_list=wish_list,
        finished=finished,
    )


# add book to book list
@bp.route("/add-book", methods=["GET", "POST"])
def add_from_home():
    return queries.add_book()
