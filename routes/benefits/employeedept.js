var express = require('express');
var router = express.Router();
employeeDeptCtrl = require('../../controllers/benefits/employeedept');

//show all
router.get('/', employeeDeptCtrl.index);

module.exports = router;