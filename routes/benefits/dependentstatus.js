var express = require('express');
var router = express.Router();
dependentStatusCtrl = require('../../controllers/benefits/dependentstatus');

//show all
router.get('/', dependentStatusCtrl.index);

module.exports = router;