import Vue from 'vue'
import Vuex from 'vuex'
import layoutNav from './modules/layoutNav'
import user from './modules/user'

Vue.use(Vuex)
const store = new Vuex.Store({
  modules: {
    layoutNav,
    user
  }
})

export default store
