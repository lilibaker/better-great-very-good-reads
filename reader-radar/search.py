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
import queries

bp = Blueprint("search", __name__)


@bp.route("/search/<string:query>", methods=("GET"))
def search(query):
    """Show all the books and reviews"""
    books = queries.broad_search(query)
    return render_template("search.html", books=books)
