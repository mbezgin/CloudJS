const {
  getRandomItem,
  getQuotesByTag,
  saveQuotes,
  getID,
} = require('../lib');
const quotesData = require('../../../data');

module.exports.getAll = (req, res) => {
  res.send(quotesData);
};

module.exports.getRandom = (req, res) => {
  const { query: { tag } } = req;
  const quotes = tag ? getQuotesByTag(tag, quotesData) : quotesData;

  if (tag && !quotes.length) {
    return res.status(404).send('No quotes for provided tag.');
  }

  res.send(getRandomItem(quotes));
};

module.exports.create = (req, res) => {
  const {
    author,
    text,
  } = req.body;

  if (!author || !text) {
    return res.status(400).send('"Author" & "text" are required');
  }

  const newQuote = {
    author,
    text,
    id: getID(),
    createdAt: Date.now(),
  };

  quotesData.push(newQuote);
  saveQuotes(quotesData);

  res.status(200).send(newQuote);
};

module.exports.getByID = (req, res) => {
  const { params: { id } } = req;

  const requestedQuote = quotesData.find((quote) => quote.id === id);

  if (!requestedQuote) {
    return res.status(404).send('No quote found.');
  }

  res.status(200).send(requestedQuote);
};

module.exports.update = (req, res) => {
  const {
    params: { id },
    body,
  } = req;

  const quoteIndex = quotesData.findIndex((quote) => quote.id === id);

  if (quoteIndex === -1) {
    return res.status(404).send('No quote found.');
  }

  const updatedQuote = {
    ...quotesData[quoteIndex],
    ...body,
    updatedAt: Date.now(),
  };

  quotesData[quoteIndex] = updatedQuote;
  saveQuotes(quotesData);

  res.status(200).send(updatedQuote);
};

module.exports.delete = (req, res) => {
  const { params: { id } } = req;

  const quoteIndex = quotesData.findIndex((quote) => quote.id === id);

  if (!~quoteIndex) {
    return res.status(404).send('No quote found.');
  }

  const deletedQuote = quotesData.splice(quoteIndex, 1);
  saveQuotes(quotesData);

  res.status(200).send(deletedQuote);
};
