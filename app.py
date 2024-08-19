import mysql.connector
from mysql.connector import Error

def connect_to_k8s_db():
    try:
        connection = mysql.connector.connect(
            host='deployment-db.default.svc.cluster.local',  # Service name and namespace
            user='enklau',
            password='4-v3ry-53cr37-p455w0rd',
            database='mysql'
        )

        if connection.is_connected():
            db_info = connection.get_server_info()
            print("Connected to MySQL Server version ", db_info)
            cursor = connection.cursor()
            cursor.execute("SELECT DATABASE();")
            record = cursor.fetchone()
            print("You're connected to database: ", record)

            # Example query
            cursor.execute("SELECT * FROM your_table;")
            records = cursor.fetchall()
            for row in records:
                print(row)

    except Error as e:
        print("Error while connecting to MySQL", e)
    finally:
        if connection.is_connected():
            cursor.close()
            connection.close()
            print("MySQL connection is closed")

if __name__ == "__main__":
    connect_to_k8s_db()