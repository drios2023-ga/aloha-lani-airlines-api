var express = require('express');
var router = express.Router();
employeeEnrollmentCtrl = require('../../controllers/benefits/employeeenrollment');

//get all
router.get('/', employeeEnrollmentCtrl.index);

//get one
router.get('/:id', employeeEnrollmentCtrl.show);

//new
router.post('/new', employeeEnrollmentCtrl.create);

module.exports = router;