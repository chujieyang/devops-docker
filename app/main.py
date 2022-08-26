import json
import os
from flask import Flask
import sqlalchemy as db
from sqlalchemy import text

app = Flask(__name__)
engine = db.create_engine(os.getenv("mysql_connection"))  # type: ignore


@app.route("/hc")
def index():
    return "success"


@app.route("/api/test")
def testApi():
    with engine.connect() as conn:
        result = conn.execute(
            text("select name, score from student_scores where name='John'"))
        results = result.all()
        print(results)
    return "docker in practice. John's score is {}".format(results[0]['score'])


if __name__ == "__main__":
    app.run(debug=True, host="0.0.0.0", port=6666)
