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
# @login_required
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
# @login_required
def move_book():
    """Add book to new list"""
    if request.method == "POST":
        book_id = request.form["book_id"]
        new_list_name = request.form["new_list_name"]
        old_list_name = request.form["old_list_name"]
        print("first one works")
        print(book_id)
        print(new_list_name)
        print(old_list_name)

        db = get_db()
        if old_list_name != "":
            old_list_id = queries.get_book_list_id(old_list_name, g.user["id"])
            db.execute(
                "DELETE FROM book_list_items WHERE book_id = ? AND book_list_id = ?",
                (book_id, old_list_id),
            )
        if new_list_name != "Remove Book":
            new_list_id = queries.get_book_list_id(new_list_name, g.user["id"])
            db.execute(
                "INSERT INTO book_list_items (book_list_id, book_id) VALUES (?, ?)",
                (new_list_id, book_id),
            )
        db.commit()
        print("Book moved successfully")
        return redirect(url_for("library.library"))

    print("Error moving book")
    return redirect(url_for("library.library"))
