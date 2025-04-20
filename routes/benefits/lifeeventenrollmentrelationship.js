var express = require('express');
var router = express.Router();
lifeEventEnrollmentRelationshipCtrl = require('../../controllers/benefits/lifeeventenrollmentrelationship');

//show all
router.get('/', lifeEventEnrollmentRelationshipCtrl.index);

module.exports = router;