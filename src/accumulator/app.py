"""
accumulator/app.py

A simple Flask based REST accumulator for use as a demo.
"""
import json

from flask import Flask, make_response
from typing import Dict

app = Flask(__name__)
data: Dict[str, int] = {}


def _build_response():
    r = make_response(json.dumps(data))
    r.headers['Content-Type'] = 'application/json; charset=utf-8'

    return r


@app.route('/add/<key>/<value>')
def add(key: str, value: int):
    # pylint: disable=global-variable-not-assigned
    global data
    if key not in data:
        data[key] = 0

    data[key] = data[key] + int(value)

    return _build_response()


@app.route('/data')
def get_data():
    return _build_response()


@app.route('/increment/<key>')
def increment(key: str):
    return add(key, 1)
