let express = require('express')
let router = express.Router()
let db = require('../db')
let globalData = require('../util/globalData')

router.post('/modifyPassword', function(req, res, next) {
  let password = req.body.password
  console.log(req.body)
  db.query('update user set password="'+ password +'" where username="'+ globalData.username +'"', [], (result, fields) => {
    let data = {
      code: 0,
      msg: '修改成功'
    }
    res.send(data)
  })
})

router.get('/allInfo', function(req, res, next) {
  let results = {}
  db.query('select * from user where username="'+ globalData.username +'"', [], (result, fields) => {
    Object.assign(results, result[0])
    db.query('select * from extrainfo where username="'+ globalData.username +'"', [], (result, fields) => {
      Object.assign(results, result[0])
      db.query('select * from project where username="'+ globalData.username +'"', [], (result, fields) => {
        let temp = []
        for (let i = 0; i < result[0].name.split(',').length; i++) {
          temp[i] = {}
          Object.assign(temp[i], {name: result[0].name.split(',')[i]})
          Object.assign(temp[i], {period: result[0].period.split(',')[i]})
          Object.assign(temp[i], {duty: result[0].duty.split(',')[i]})
          Object.assign(temp[i], {work_content: result[0].work_content.split(',')[i]})
        }
        results['project'] = temp
        let data = {
          msg: '查询成功',
          result: results
        }
        res.send(data)
      })
    })
  })
})

router.post('/personal', function(req, res, next) {
  let nickName = req.body.nick_name
  let age = req.body.age
  let hometown = req.body.hometown
  let nation = req.body.nation
  let residence = req.body.residence
  db.query('update user set nick_name="'+ nickName +'", age="'+ age +'", hometown="'+ hometown +'", nation="'+ nation +'", residence="'+ residence +'" where username="'+ globalData.username +'"', [], (result, fields) => {
    let data = {
      code: 0,
      msg: '保存成功'
    }
    res.send(data)
  })
})

router.post('/education', function(req, res, next) {
  let education = req.body.education
  let studyYears = req.body.study_years
  let major = req.body.major
  let school = req.body.school
  db.query('update extrainfo set education="'+ education +'", study_years="'+ studyYears +'", major="'+ major +'", school="'+ school +'" where username="'+ globalData.username +'"', [], (result, fields) => {
    let data = {
      code: 0,
      msg: '保存成功'
    }
    res.send(data)
  })
})

router.post('/company', function(req, res, next) {
  let company = req.body.company
  let workYears = req.body.work_years
  let position = req.body.position
  db.query('update extrainfo set company="'+ company +'", work_years="'+ workYears +'", position="'+ position +'" where username="'+ globalData.username +'"', [], (result, fields) => {
    let data = {
      code: 0,
      msg: '保存成功'
    }
    res.send(data)
  })
})

router.post('/project', function(req, res, next) {
  let [name, period, duty, workContent] = [[], [], [], []]
  console.log(req.body.project[0].name)
  for (let i = 0; i < req.body.project.length; i++) {
    console.log(req.body.project[i])
    name.push(req.body.project[i].name)
    period.push(req.body.project[i].period)
    duty.push(req.body.project[i].duty)
    workContent.push(req.body.project[i].work_content)
  }
  console.log(name)
  db.query('update project set name="'+ name.join(',') +'", period="'+ period.join(',') +'", duty="'+ duty.join(',') +'", work_content="'+ workContent.join(',') +'" where username="'+ globalData.username +'"', [], (result, fields) => {
    let data = {
      code: 0,
      msg: '保存成功'
    }
    res.send(data)
  })
})

module.exports = router
