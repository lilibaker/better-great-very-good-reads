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

bp = Blueprint("library", __name__)


@bp.route("/library")
@login_required
def library():
    """Show all the booklists"""
    current = queries.get_book_list_books("Current Reads", g.user["id"])
    unread = queries.get_book_list_books("Unread", g.user["id"])
    wish_list = queries.get_book_list_books("Wish List", g.user["id"])
    finished = queries.get_book_list_books("Finished", g.user["id"])
    return render_template(
        "library.html",
        current=current,
        unread=unread,
        wish_list=wish_list,
        finished=finished,
    )


@bp.route("/move-book", methods=["GET", "POST"])
@login_required
def move_book():
    """Add book to new list"""
    if request.method == "POST":
        book_id = request.form["book_id"]
        new_list_id = request.form["list_id"]
        old_list_id = request.form["old_list_id"]
        error = None

        if not book_id or new_list_id:
            error = "No book or list"

        if error is not None:
            flash(error)
        else:
            db = get_db()
            db.execute(
                "INSERT INTO book_list_items (list_id, book_id) VALUES (?, ?)",
                (new_list_id, book_id),
            )
            db.execute(
                "DELETE FROM book_list_items WHERE book_id = ? AND book_list_id = ?'",
                (book_id, old_list_id)
            )
            db.commit()
            return redirect(url_for("library"))

    return render_template(
        "library.html"
    ) 