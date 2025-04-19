var express = require('express');
var router = express.Router();
benefitPlanTypeCtrl = require('../../controllers/benefits/benefitplantype');

//show all
router.get('/', benefitPlanTypeCtrl.index);

module.exports = router;