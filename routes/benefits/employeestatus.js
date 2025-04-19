var express = require('express');
var router = express.Router();
employeeStatusCtrl = require('../../controllers/benefits/employeestatus');

//show all
router.get('/', employeeStatusCtrl.index);

module.exports = router;