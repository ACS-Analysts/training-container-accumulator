# Training Containers: accumulator
This project creates a very simple Flask application written in Python that exposes a REST API for a very basic
accumulator. The values are stored in memory and have no other state.

## Prerequisites
You must have Python and the `pipenv` package installed.

```shell
$ python3 -m pip install pipenv --user
$ pipenv install
```

The `pipenv install` command will create a Python virtual environment with the required Python versions and packages to
run the application.

## Running Flask in dev mode
```shell
$ cd src/accumulator
$ pipenv run flask run --reload
```

The `pipenv run` will run the command `flask run` inside the Python virtual environment that was setup above. The
`flask run` command looks for a file named `app.py` and runs it as a Flask application in development mode. This should
start a web server on port 5000 that you can use to test the code.

## Running gUnicorn
```shell
$ pipenv run gunicorn --chdir src accumulator:app -b 0.0.0.0:8000
```

The `pipenv run` will run the command `gunicorn` inside the Python virtual environment that was setup above. The app
will run on port 8000 on your localhost.

## Using the REST API
### add
This endpoint adds a specified value to the named accumulator. The call returns all current accumulator values as a JSON
document. For example, to add `2` to the `foo` accumulator:
```shell
$ curl -q -X GET http://localhost:8000/add/foo/2
```

### data
This endpoint returns the all current accumulator values as a JSON document. For example:
```shell
$ curl -q -X GET http://localhost:8000/data
```

### increment
This endpoint increments the specified accumulator by one. The call returns all current accumulator values as a JSON
document. For example, to increment the `bar` accumulator:
```shell
$ curl -q -X GET http://localhost:8000/increment/foo
```

## Docker
### Building the Image
The first step to using the docker image is to build the image:

```shell
$ docker build -t accumulator:1.0.0 .
```

### Running the image locally
```shell
$ docker run -d -P 8000:8000 --name accumulator accumulator:1.0.0
```
