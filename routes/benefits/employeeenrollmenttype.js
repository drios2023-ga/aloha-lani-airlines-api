var express = require('express');
var router = express.Router();
employeeEnrollmentTypeCtrl = require('../../controllers/benefits/employeeenrollmenttype');

//show all
router.get('/', employeeEnrollmentTypeCtrl.index);

module.exports = router;