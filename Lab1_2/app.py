import psycopg2
from flask import Flask, jsonify
from psycopg2 import sql
from psycopg2.extras import RealDictCursor

app = Flask(__name__)

@app.route('/get_polygon', methods=['GET'])
def get_polygon():
    connection= psycopg2.connect(host = '34.27.240.213 ',
                             database = 'lab0',
                             user = 'postgres',
                             password = 'Homework13')

    cursor = connection.cursor(cursor_factory=RealDictCursor)
    cursor.execute(sql.SQL("SELECT geom_table, ST_AsGeoJSON(columnLocation)::json AS geometry FROM geom_table"), (1,))
    result = cursor.fetchone()
    cursor.close()
    connection.close()
    return jsonify(result)
