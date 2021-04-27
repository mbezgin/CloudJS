# Getting Started

## NGINX setup for windows
Open [http://nginx.org/ru/docs/windows.html](http://nginx.org/ru/docs/windows.html) and follow instructions
to download and start Nginx.
In the project root directory you can find Nginx configuration file `nginx.conf`.
Move it to downloaded folder `{yourNginxFolder}/conf`.
In `{yourNginxFolder}` create `ssl` folder (`{yourNginxFolder}/ssl`)
and put `localhost.crt` & `localhost.key` inside.
(in `nginx.conf` update `ssl_certificate` & `ssl_certificate_key` if needed).
In the project root directory run `npm start`, it will build client app to `static` folder and run API.
In `nginx.conf` update `root` field to `{path\to\projectRoot}\static`
To start server open terminal from `{yourNginxFolder}` and run `start nginx`,
`./nginx -s reload` - to apply changes from config file.
Open [http://localhost](http://localhost) or [https://localhost](https://localhost)

## Environment variables
In the project root directory you can find `.env` file to cofigure `APP_PORT` and `NODE_ENV` variables

## Available Scripts

In the project directory, you can run:

### `npm start`

Runs the app in the production mode.
Open [http://localhost:{APP_PORT}](http://localhost:{APP_PORT}) to view it in the browser.

### `npm run dev`

Runs the app in the development mode.
The server will reload if you make edits.
Open [http://localhost:{APP_PORT}](http://localhost:{APP_PORT}) to view it in the browser.

### `npm run build:client`

Builds the client for production to the `static` folder.

## Available endpoints

### GET `/ping`

will return the following json object:
`{ “statusCode”: 200, “message”: “OK”, time: “{serverTime}*” }`
where {serverTime} - is a value of server’s time at the moment of response.

### GET `/api/quotes`

returns a list of all available quotes

### GET `/api/quotes/random`

returns a random quote from the list

### GET `/api/quotes/random?tag={tag}`

returns a random quote which has appropriate {tag} from query string or 
contains appropriate word/phrase int its text

### POST `/api/quotes`

creates a new quote

### GET `/api/quotes/:id`

returns a quote with specified id if exist

### PUT `/api/quotes/:id`

updates a quote with specified id if exist

### DELETE `/api/quotes/:id`

deletes a quote with specified id if exist