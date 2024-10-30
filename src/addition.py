from flask import Flask, render_template_string

app = Flask(__name__)

@app.route('/')
def home():
    return render_template_string('''
        <!doctype html>
        <html lang="en">
        <head>
            <meta charset="utf-8">
            <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
            <title>Simple Flask App</title>
        </head>
        <body>
            <h1>Hello, World!</h1>
            <p>This is a simple Flask application!</p>
        </body>
        </html>
    ''')

if __name__ == '__main__':
    app.run(debug=True)
