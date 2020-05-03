'use strict'
const merge = require('webpack-merge')
const prodEnv = require('./dev.env')

module.exports = {
  NODE_ENV: '"production"',
  API_ROOT: '"http://th.vaiwan.com"'
}
