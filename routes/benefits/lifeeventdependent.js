var express = require('express');
var router = express.Router();
lifeEventDependentCtrl = require('../../controllers/benefits/lifeeventdependent');

//show all
router.get('/', lifeEventDependentCtrl.index);

module.exports = router;