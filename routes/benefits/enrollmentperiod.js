var express = require('express');
var router = express.Router();
enrollmentPeriodCtrl = require('../../controllers/benefits/enrollmentperiod');

//show all
router.get('/', enrollmentPeriodCtrl.index);

module.exports = router;