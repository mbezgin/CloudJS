const aws = require('aws-sdk');

const ses = new aws.SES({ region: 'us-east-1' });

exports.handler = async function (event) {
  const params = {
    Destination: {
      ToAddresses: [event.email],
    },
    Message: {
      Body: {
        Text: { Data: `${event.quote.text} - by: ${event.quote.author}` },
      },

      Subject: { Data: 'Famous quotes' },
    },
    Source: 'mabezgin@gmail.com',
  };

  return ses.sendEmail(params).promise();
};
