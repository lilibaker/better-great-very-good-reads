from flask import Blueprint
from flask import redirect
from flask import render_template
from flask import request
from flask import url_for


from . import queries

bp = Blueprint("search", __name__)


@bp.route("/search", methods=["POST"])
def search_post():
    """Handle the search form submission and redirect to the search results page."""
    query = request.form.get("query", "").strip()
    return redirect(url_for("search.search", query=query))


@bp.route("/search/<string:query>", methods=["GET"])
def search(query):
    """Show all the books and reviews"""
    books = queries.broad_search(query)
    return render_template("search.html", books=books)
