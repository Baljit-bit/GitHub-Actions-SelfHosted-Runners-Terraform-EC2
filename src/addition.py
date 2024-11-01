from flask import Flask, render_template_string

app = Flask(__name__)

def add(a, b):
    return a + b

@app.route('/')
def home():
    result = add(3, 5)  # Example values
    return render_template_string("<h1>The result of addition is: {{ result }}</h1>", result=result)

if __name__ == "__main__":
    app.run(host='0.0.0.0', port=5000)  # Expose the app to all interfaces
