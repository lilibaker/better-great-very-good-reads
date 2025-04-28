import functools
import hashlib

from flask import Blueprint
from flask import flash
from flask import g
from flask import redirect
from flask import render_template
from flask import request
from flask import session
from flask import url_for
from werkzeug.security import check_password_hash
from werkzeug.security import generate_password_hash

from .db import get_db

bp = Blueprint("auth", __name__, url_prefix="/auth")


def login_required(view):
    """View decorator that redirects anonymous users to the login page."""

    @functools.wraps(view)
    def wrapped_view(**kwargs):
        if g.user is None:
            return redirect(url_for("auth.login"))

        return view(**kwargs)

    return wrapped_view


@bp.before_app_request
def load_logged_in_user():
    """If a user id is stored in the session, load the user object from
    the database into ``g.user``."""
    user_id = session.get("user_id")

    if user_id is None:
        g.user = None
    else:
        g.user = (
            get_db().execute("SELECT * FROM user WHERE id = ?", (user_id,)).fetchone()
        )


def hash_password(password):
    """
    Calculate the SHA-256 hash of a password.

    Args:
        password: A string representing the password to hash.

    Returns:
        A string representing the hex digits of the SHA-256 hash of the
        password.
    """
    password_bytes = password.encode("utf-8")
    return hashlib.sha256(password_bytes).hexdigest()


@bp.route("/register", methods=("GET", "POST"))
def register():
    """Register a new user.

    Validates that the username is not already taken. Hashes the
    password for security.
    """
    if request.method == "POST":
        username = request.form["username"]
        password = request.form["password"]
        db = get_db()
        error = None

        if not username:
            error = "Username is required."
        elif not password:
            error = "Password is required."

        if error is None:
            try:
                new_user_command = (
                    f"INSERT INTO user (username, password)"
                    f" VALUES ('{username}', '{hash_password(password)}')"
                )
                db.execute(new_user_command)
                db.commit()
            except db.IntegrityError:
                # The username was already taken, which caused the
                # commit to fail. Show a validation error.
                error = f"User {username} is already registered."
            else:
                # Success, go to the login page.
                return redirect(url_for("auth.login"))

        flash(error)

    return render_template("auth/register.html")


@bp.route("/login", methods=("GET", "POST"))
def login():
    """Log in a registered user by adding the user id to the session."""
    if request.method == "POST":
        username = request.form["username"]
        password = request.form["password"]
        db = get_db()
        error = None
        query = (
            f"SELECT * FROM user WHERE username = '{username}' AND"
            f" password = '{hash_password(password)}';"
        )
        user = db.execute(query).fetchone()

        if user is None:
            error = "Incorrect username/password."

        if error is None:
            # store the user id in a new session and return to the index
            session.clear()
            session["user_id"] = user["id"]
            return redirect(url_for("index"))

        flash(error)

    return render_template("auth/login.html")


@bp.route("/logout")
def logout():
    """Clear the current session, including the stored user id."""
    session.clear()
    return redirect(url_for("index"))
