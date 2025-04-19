var express = require('express');
var router = express.Router();
employeePositionCtrl = require('../../controllers/benefits/employeeposition');

//show all
router.get('/', employeePositionCtrl.index);

module.exports = router;