from flask import Blueprint
from flask import flash
from flask import g
from flask import redirect
from flask import render_template
from flask import request
from flask import url_for
from werkzeug.exceptions import abort

from .db import get_db

from . import queries

bp = Blueprint("book", __name__)


@bp.route("/book/<int:id>", methods=["GET"])
def book(id):
    """Show a specific book and its reviews."""
    book = queries.get_book(id)
    reviews = queries.get_reviews(id)

    if book is None:
        abort(404, f"Book with id {id} doesn't exist.")

    return render_template("book.html", book=book, reviews=reviews)


@bp.route("/book/submit-review", methods=["POST"])
def add_review():
    """Create a new post for the current user."""
    book_id = request.form["book_id"]
    review_text = request.form["review_text"]
    rating = request.form["rating"]
    
    if review_text == "" and not rating:
        flash("Please enter a review or rating.")
    
    else:
        db = get_db()
        db.execute(
            "INSERT INTO reviews (book_id, user_id, rating, review_text) VALUES (?, ?, ?, ?)",
            (book_id, g.user["id"], rating, review_text),
        )
        db.commit()

    return redirect(url_for("book.book", id=book_id))
