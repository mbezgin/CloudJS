const express = require('express');
const quotesRouter = require('./routers/quotes');
const pingRouter = require('./routers/ping');

const app = express();

app.use(express.static('./static'));
app.use(express.json());
app.use('/api/quotes', quotesRouter);
app.use('/ping', pingRouter);

module.exports = app;
