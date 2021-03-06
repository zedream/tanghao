let express = require('express')
let router = express.Router()
let Jwt = require('../jwt')
let db = require('../db')
let globalData = require('../util/globalData')

router.post('/', function(req, res, next) {
  let username = req.body.username
  let password = req.body.password
  db.query('select username, nick_name, avatar, password from user where username= "'+ username +'"', [], (result, fields) => {
    if (result.length > 0) {
      if (password === result[0].password) {
        globalData.username = username
        // 将用户id传入并生成token
        let jwt = new Jwt(username)
        let token = jwt.generateToken()
        let results = {
          username: result[0].username,
          nickName: result[0].nick_name,
          avatar: result[0].avatar
        }
        let data = {
          result: results,
          token: token,
          msg: '登录成功'
        }
        res.send(data)
      } else {
        let data = {
          msg: '账号或者密码错误'
        }
        res.status(400).send(data)
      }
    } else {
      let data = {
        msg: '该账号不存在'
      }
      res.status(400).send(data)
    }
  })
})

module.exports = router