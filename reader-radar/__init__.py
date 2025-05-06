import os

from flask import Flask
from flask import g
from flask import session


def create_app(test_config=None):
    """
    Create and configure an instance of the Flask application.
    """
    app = Flask(__name__, instance_relative_config=True)
    app.config.from_mapping(
        # store the database in the instance folder
        DATABASE=os.path.join(app.instance_path, "flaskr.sqlite"),
    )

    if test_config is None:
        # load the instance config, if it exists, when not testing
        app.config.from_pyfile("config.py", silent=True)
    else:
        # load the test config if passed in
        app.config.update(test_config)

    # ensure the instance folder exists
    try:
        os.makedirs(app.instance_path)
    except OSError:
        pass

    # register the database commands
    from . import db

    db.init_app(app)

    # apply the blueprints to the app
    from . import auth
    from . import book
    from . import home
    from . import library
    from . import search

    app.register_blueprint(auth.bp)
    app.register_blueprint(book.bp)
    app.register_blueprint(home.bp)
    app.register_blueprint(library.bp)
    app.register_blueprint(search.bp)

    # Set a user ID to bypass the login requirement for development
    @app.before_request
    def load_logged_in_user():
        # check if there's a session
        if "user_id" in session:
            # if there is, set the user to the session user
            g.user = {"id": session["user_id"]}

        else:
            # make the default user id 1 for dev to bypass login
            # this is a temporary solution to avoid login for dev
            # in prod, the user should be redirected to the login page
            g.user = {"id": 1}

    app.debug = True

    @app.route("/test")
    def test():
        return "<h1>Test Page</h1>"

    return app
