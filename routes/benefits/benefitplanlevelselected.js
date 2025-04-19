var express = require('express');
var router = express.Router();
benefitPlanLevelSelectedCtrl = require('../../controllers/benefits/benefitplanlevelselected');

//show all
router.get('/', benefitPlanLevelSelectedCtrl.index);

module.exports = router;