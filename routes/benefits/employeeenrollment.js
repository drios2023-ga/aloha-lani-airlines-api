var express = require('express');
var router = express.Router();
employeeEnrollmentCtrl = require('../../controllers/benefits/employeeenrollment');

//show all
router.get('/', employeeEnrollmentCtrl.index);

module.exports = router;