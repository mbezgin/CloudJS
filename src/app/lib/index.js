const fs = require('fs');
const path = require('path');

const randomItem = (items) => items[Math.floor(Math.random() * items.length)];

const getQuotesByTag = (tag, quotes) => quotes.filter(({ tags, text }) => {
  const tagsString = tags ? tags.join(' ') : '';
  return `${tagsString} ${text}`.toLowerCase().includes(tag.toLowerCase());
});

const saveQuotes = (quotes) => {
  fs.writeFile(path.resolve(__dirname, '../../../data/index.json'), JSON.stringify(quotes, null, 2), (error) => {
    if (error) throw error;
  });
};

const getID = () => `_${Math.random().toString(36).substr(2, 9)}`;

module.exports = {
  randomItem,
  getQuotesByTag,
  saveQuotes,
  getID,
};
