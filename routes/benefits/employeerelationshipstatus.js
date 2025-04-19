var express = require('express');
var router = express.Router();
employeeRelationshipStatusCtrl = require('../../controllers/benefits/employeerelationshipstatus');

//show all
router.get('/', employeeRelationshipStatusCtrl.index);

module.exports = router;