var express = require('express');
var router = express.Router();
lifeEventCtrl = require('../../controllers/benefits/lifeevent');

//show all
router.get('/', lifeEventCtrl.index);

module.exports = router;