var express = require('express');
var router = express.Router();
lifeEventTypeCtrl = require('../../controllers/benefits/lifeeventtype');

//show all
router.get('/', lifeEventTypeCtrl.index);

module.exports = router;