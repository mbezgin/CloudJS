module.exports.getStatus = (req, res) => {
  res.send({
    statusCode: '200',
    message: 'OK',
    time: Date.now(),
  });
};
