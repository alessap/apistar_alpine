from apistar import App, Route
from datetime import datetime
import socket


def welcome(name="Ale"):
    """Example function with PEP 484 type annotations.

    Args:
        name: The first parameter.

    Returns:
        The return a message.

    """
    if name is None:
        return {"message": "Welcome to API Star!"}
    return {"message": "Welcome to API Star, %s!" % name}


def get_time():
    """ This function returns the UTC time."""
    return {"message": "The time is: %s!" % datetime.utcnow()}


def get_ip_address():
    """ This function returns the IP of your machine."""
    return {
        "message": "The IP address is: %s!" % socket.gethostbyname(socket.gethostname())
    }


def get_pwd():
    """ This function returns the working directory your machine."""
    import os

    return {"message": "PWD : %s" % os.getcwd()}


routes = [
    Route("/", method="GET", handler=welcome),
    Route("/time", method="GET", handler=get_time),
    Route("/ip", method="GET", handler=get_ip_address),
    Route("/pwd", method="GET", handler=get_pwd),
]

app = App(routes=routes)
