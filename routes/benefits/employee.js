var express = require('express');
var router = express.Router();
employeeCtrl = require('../../controllers/benefits/employee');

//show all
router.get('/', employeeCtrl.index);

module.exports = router;