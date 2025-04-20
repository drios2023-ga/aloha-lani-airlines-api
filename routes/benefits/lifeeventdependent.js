var express = require('express');
var router = express.Router();
lifeEventDependentCtrl = require('../../controllers/benefits/lifeeventdependent');

//show all
router.get('/', lifeEventDependentCtrl.index);

//get one
router.get('/:id', lifeEventDependentCtrl.show);

//new
router.post('/new', lifeEventDependentCtrl.create);

module.exports = router;