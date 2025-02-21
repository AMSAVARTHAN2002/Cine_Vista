from flask import Flask, request, jsonify
import mysql.connector

app = Flask(__name__)

# Database connection
conn = mysql.connector.connect(
    host='localhost',
    user='root',  # Change as needed
    password='Amsa2002#',  # Change as needed
    database='Movie'
)
cursor = conn.cursor(dictionary=True)

@app.route('/')
def home():
    return "Welcome to the Flask Movie API! Use /movies to see the list of movies."


# GET Route: Fetch all movies
@app.route('/movies', methods=['GET'])
def get_movies():
    cursor.execute("SELECT * FROM Movies")
    movies = cursor.fetchall()
    return jsonify(movies)
# GET Route: Fetch all movies
@app.route('/reviews', methods=['GET'])
def get_reviews():
    cursor.execute("SELECT * FROM reviews")
    review = cursor.fetchall()
    return jsonify(review)

# POST Route: Add a new movie
@app.route('/movie', methods=['POST'])
def add_movie():
    data = request.json
    query = "INSERT INTO Movies (MovieID, Title, Genre, ReleaseYear, Rating) VALUES (%s, %s, %s, %s, %s)"
    values = (data['MovieID'], data['Title'], data['Genre'], data['ReleaseYear'], data['Rating'])
    cursor.execute(query, values)
    conn.commit()
    return jsonify({'message': 'Movie added successfully'})

# POST Route: Add a review
@app.route('/reviews', methods=['POST'])
def add_review():
    data = request.json
    query = "INSERT INTO Reviews (ReviewID, UserID, MovieID, ReviewText, Rating, ReviewDate) VALUES (%s, %s, %s, %s, %s, %s)"
    values = (data['ReviewID'], data['UserID'], data['MovieID'], data['ReviewText'], data['Rating'], data['ReviewDate'])
    cursor.execute(query, values)
    conn.commit()
    return jsonify({'message': 'Review added successfully'})

# PUT Route: Update a movie
@app.route('/movies_update/<int:movie_id>', methods=['PUT'])
def update_movie(movie_id):
    data = request.json  # Get JSON data from request

    query = " UPDATE Movies SET Title = %s, Genre = %s, ReleaseYear = %s, Rating = %s WHERE MovieID = %s"
    values = (data['Title'], data['Genre'], data['ReleaseYear'], data['Rating'], movie_id)
    
    cursor.execute(query, values)
    conn.commit()

    return jsonify({'message': 'Movie updated successfully'})

# DELETE Route: Delete a movie
@app.route('/delete_movie/<int:movie_id>', methods=['DELETE'])
def delete_movie(movie_id):
    query = "DELETE FROM Movies WHERE MovieID = %s"
    cursor.execute(query, (movie_id,))
    conn.commit()

    return jsonify({'message': 'Movie deleted successfully'}), 200



if __name__ == '__main__':
    app.run(debug=True)
