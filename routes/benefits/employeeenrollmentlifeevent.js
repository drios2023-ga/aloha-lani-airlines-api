var express = require('express');
var router = express.Router();
employeeEnrollmentLifeEventCtrl = require('../../controllers/benefits/employeeenrollmentlifeevent');

//show all
router.get('/', employeeEnrollmentLifeEventCtrl.index);

module.exports = router;