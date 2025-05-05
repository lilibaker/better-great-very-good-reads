import sqlite3

import click  # command line interface
from flask import current_app
from flask import g  # store data for current request


def get_db():
    """Connect to the application's configured database. The connection
    is unique for each request and will be reused if this is called
    again.
    """
    if "db" not in g:
        g.db = sqlite3.connect(
            current_app.config["DATABASE"], detect_types=sqlite3.PARSE_DECLTYPES
        )
        g.db.row_factory = sqlite3.Row  # rows can be accessed like dicts

    return g.db


def close_db(e=None):
    """If this request connected to the database, close the
    connection.
    """
    # remove connection from current request
    db = g.pop("db", None)

    if db is not None:
        db.close()


def init_db():
    """Clear existing data and create new tables."""
    db = get_db()

    with current_app.open_resource("schema.sql") as f:
        db.executescript(f.read().decode("utf8"))


def seed_db():
    """Seed the database with initial data."""
    db = get_db()

    with current_app.open_resource("seed.sql") as f:
        db.executescript(f.read().decode("utf8"))


@click.command("init-db")
def init_db_command():
    """Clear existing data and create new tables."""
    init_db()
    click.echo("Initialized the database.")


@click.command("seed-db")
def seed_db_command():
    """Seed the database with initial data."""
    seed_db()
    click.echo("Seeded the database.")


@click.command("init-seed-db")
def init_seed_db_command():
    """Clear existing data, create new tables, and seed the database."""
    init_db()
    seed_db()
    click.echo("Initialized and seeded the database.")


def init_app(app):
    """Register database functions with the Flask app. This is called by
    the application factory.
    """
    app.teardown_appcontext(close_db)
    app.cli.add_command(init_db_command)
    app.cli.add_command(seed_db_command)
    app.cli.add_command(init_seed_db_command)
