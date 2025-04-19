var express = require('express');
var router = express.Router();
positionAndDeptsCtrl = require('../../controllers/benefits/positionanddepts');

//show all
router.get('/', positionAndDeptsCtrl.index);

module.exports = router;