var express = require('express');
var router = express.Router();
dependentTypeCtrl = require('../../controllers/benefits/dependenttype');

//show all
router.get('/', dependentTypeCtrl.index);

module.exports = router;