import flask_hello
import os
from flask import Flask

app = Flask(__name__)


@app.route("/")
def hello():
    return "Hello World!"


home = os.environ["HOME"]

if __name__ == "__main__":
    app.run(
        host="0.0.0.0",
        port="8443",
        # ssl_context=(
        #     f'{home}/secrets/cert.pem',
        #     f'{home}/secrets/key.pem')
    )
