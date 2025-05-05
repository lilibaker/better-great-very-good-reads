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

bp = Blueprint("book", __name__)


@bp.route("/book/<int:id>", methods=["GET"])
def book(id):
    """Show a specific book and its reviews."""
    book = queries.get_book(id)
    reviews = queries.get_reviews(id)

    if book is None:
        abort(404, f"Book with id {id} doesn't exist.")

    return render_template("book.html", book=book, reviews=reviews)


@bp.route("/book/<int:id>/submit-review", methods=["GET", "POST"])
@login_required
def add_review(id):
    """Create a new post for the current user."""
    if request.method == "POST":
        review_text = request.form["review_text"]
        rating = request.form["rating"]
        error = None

        if not review_text or rating:
            error = "Review or rating required."

        if error is not None:
            flash(error)
        else:
            db = get_db()
            db.execute(
                "INSERT INTO reviews (book_id, user_id, rating, review_text) VALUES (?, ?, ?, ?)",
                (id, g.user["id"], rating, review_text),
            )
            db.commit()
            return redirect(url_for("book/<int:id>"))

    return render_template(
        "book/<int:id>.html"
    )  #! not sure if routes are accurate / will need to check with frontend
