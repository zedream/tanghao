import Vue from 'vue'
import Vuex from 'vuex'
import layoutNav from './modules/layoutNav'

Vue.use(Vuex)
const store = new Vuex.Store({
  modules: {
    layoutNav
  }
})

export default store
