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


@bp.route("/home")
def index():
    """Show recommended books"""
    books = queries.get_top_books()
    recommendation = queries.get_random_recommendation()
    return render_template("home.html", books=books, recommendation=recommendation)
