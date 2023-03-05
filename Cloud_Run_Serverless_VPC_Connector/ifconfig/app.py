import os
import requests

from flask import Flask, request

app = Flask(__name__)


@app.route("/")
def hello_world():
    r = requests.get('https://ifconfig.me/ip')
    return 'You are connected from IP address: ' + r.text

if __name__ == "__main__":
    app.run(debug=True, host="0.0.0.0", port=int(os.environ.get("PORT", 8080)))