var express = require('express');
var router = express.Router();
lifeEventCtrl = require('../../controllers/benefits/lifeevent');

//show all
router.get('/', lifeEventCtrl.index);

//get one
router.get('/:id', lifeEventCtrl.show);

//new
router.post('/new', lifeEventCtrl.create);

module.exports = router;