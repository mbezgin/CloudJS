const { Router } = require('express');
const pingController = require('../controllers/ping');

const router = new Router();

router.get('/', pingController.getStatus);

module.exports = router;
