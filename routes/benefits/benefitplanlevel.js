var express = require('express');
var router = express.Router();
benefitPlanLevelCtrl = require('../../controllers/benefits/benefitplanlevel');

//show all
router.get('/', benefitPlanLevelCtrl.index);

module.exports = router;