# Getting Started

## Available Scripts

In the project directory, you can run:

### `npm start`

Runs the app in the production mode.\
Open [http://localhost:{APP_PORT}](http://localhost:{APP_PORT}) to view it in the browser.

### `npm run dev`

Runs the app in the development mode.\
The server will reload if you make edits.
Open [http://localhost:{APP_PORT}](http://localhost:{APP_PORT}) to view it in the browser.

### `npm run build:client`

Builds the client for production to the `static` folder.\

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