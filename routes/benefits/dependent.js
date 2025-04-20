var express = require('express');
var router = express.Router();
dependentCtrl = require('../../controllers/benefits/dependent');

//show all
router.get('/', dependentCtrl.index);

router.get('/:id', dependentCtrl.show);

router.post('/new', dependentCtrl.create);

router.put('/:id', dependentCtrl.update);

module.exports = router;