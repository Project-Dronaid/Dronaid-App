const user_act = require('../controllers/user')
const express = require('express')
const router = express.Router()

router.post('/registeruser',user_act.registerUser)
router.post('/loginuser',user_act.loginUser)
router.get('/getuser/:id',user_act.getpaticularuser)


module.exports = router