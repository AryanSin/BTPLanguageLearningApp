from flask import Flask, request
import random

app = Flask(__name__)

@app.route('/')
def index():
    return 'Hello, World!'


@app.route('/process_audio', methods=['POST'])
def process_audio():
    # Get the audio file from the request
    audio_file = request.files['audio']

    # Process the audio file here
    # ...

    # Generate a random integer
    random_int = random.randint(0, 100)

    # Return the random integer as a JSON response
    return {'random_int': random_int}

if __name__ == '__main__':
    app.run(debug=True)
