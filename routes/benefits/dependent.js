var express = require('express');
var router = express.Router();
dependentCtrl = require('../../controllers/benefits/dependent');

//show all
router.get('/', dependentCtrl.index);

module.exports = router;