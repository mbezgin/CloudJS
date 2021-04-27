const { Router } = require('express');
const quotesController = require('../controllers/quotes');

const router = new Router();

router.get('/', quotesController.getAll);
router.get('/random', quotesController.getRandom);
router.post('/', quotesController.create);
router.get('/:id', quotesController.getByID);
router.put('/:id', quotesController.update);
router.delete('/:id', quotesController.delete);

module.exports = router;
