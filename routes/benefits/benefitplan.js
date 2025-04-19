var express = require('express');
var router = express.Router();
benefitPlanCtrl = require('../../controllers/benefits/benefitplan');

//show all
router.get('/', benefitPlanCtrl.index);

module.exports = router;