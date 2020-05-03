import Vue from 'vue'
import Router from 'vue-router'
import pagesRouter from './pages/index'
import viewsRouter from './views/index'
import { Message } from 'element-ui'

Vue.use(Router)

let router = new Router({
  // mode: 'history',
  scrollBehavior (to, from, savedPosition) {
    // savedPosition 这个参数当且仅当导航 (通过浏览器的 前进/后退 按钮触发) 时才可用  效果和 router.go() 或 router.back()
    if (savedPosition) {
      // 返回savedPosition 其实就是 当用户点击 返回的话，保持之前游览的高度
      return savedPosition
    } else {
      if (from.meta.keepAlive) {
        from.meta.savedPosition = document.body.scrollTop
      }
      return {
        x: 0,
        y: to.meta.savedPosition || 0
      }
    }
  },
  routes: [
    ...viewsRouter,
    ...pagesRouter
  ]
})

router.beforeEach((to, from, next) => {
  // ...
  let meta = to.meta
  if (meta.isAuth === true) {
    if (localStorage.getItem('username')) {
      next()
    } else {
      next({
        path: '/login', // 未登录则跳转至login页面
        query: {redirect: to.fullPath} // 登陆成功后回到当前页面，这里传值给login页面，to.fullPath为当前点击的页面
      })
      Message({
        message: '需要先登录的呢~',
        type: 'error'
      })
    }
  } else {
    next()
  }
})

export default router
