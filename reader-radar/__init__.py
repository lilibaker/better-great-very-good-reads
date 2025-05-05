import os

from flask import Flask
from flask import (
    render_template,
)  # note that I added this but we prob dont need it if we use blueprints


def create_app(test_config=None):
    """
    Create and configure an instance of the Flask application.
    """
    app = Flask(__name__, instance_relative_config=True)
    app.config.from_mapping(
        # a default secret that should be overridden by instance config
        SECRET_KEY="better-great-very-good-reads",
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

    # simple html page to test the app
    @app.route("/hello")
    def hello():
        return render_template("helloworld.html")

    # register the database commands
    from . import db

    db.init_app(app)

    # apply the blueprints to the app
    # from . import auth
    from . import book
    # from . import home
    # from . import library
    # from . import search

    # app.register_blueprint(auth.bp)
    app.register_blueprint(book.bp)
    # app.register_blueprint(home.bp)
    # app.register_blueprint(library.bp)
    # app.register_blueprint(search.bp)

    app.add_url_rule("/", endpoint="home")

    app.debug = True

    return app
