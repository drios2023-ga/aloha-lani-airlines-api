var express = require('express');
var router = express.Router();
benefitPlanLevelSelectedCtrl = require('../../controllers/benefits/benefitplanlevelselected');

//show all
router.get('/', benefitPlanLevelSelectedCtrl.index);

//get one
router.get('/:id', benefitPlanLevelSelectedCtrl.show);

//new
router.post('/new', benefitPlanLevelSelectedCtrl.create);

module.exports = router;