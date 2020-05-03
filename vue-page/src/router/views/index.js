import Layout from '@/components/layout'

export default [{
  path: '/demo',
  component: () => import('@/components/demo'),
  meta: {
    keepAlive: false,
    isAuth: false
  }
}, {
  path: '/login',
  component: () => import('@/components/login'),
  meta: {
    keepAlive: false,
    isAuth: false
  }
}, {
  path: '/wel',
  component: () => import('@/components/wel'),
  meta: {
    keepAlive: false,
    isAuth: false
  }
}, {
  path: '/',
  redirect: '/wel'
}, {
  path: '/index',
  component: Layout,
  children: [{
    path: '/index',
    meta: {
      keepAlive: false,
      isAuth: false
    },
    component: () => import('@/components/index')
  }]
}, {
  path: '/mydiary',
  component: Layout,
  children: [{
    path: '/mydiary',
    meta: {
      keepAlive: false,
      isAuth: true
    },
    component: () => import('@/components/mydiary')
  }]
}, {
  path: '/myphoto',
  component: Layout,
  children: [{
    path: '/myphoto',
    meta: {
      keepAlive: false,
      isAuth: true
    },
    component: () => import('@/components/myphoto')
  }]
}, {
  path: '/infomation',
  redirect: '/personal/infomation',
  component: Layout,
  children: [{
    path: '/personal/infomation',
    meta: {
      keepAlive: false,
      isAuth: true
    },
    component: () => import('@/components/personal/infomation')
  }]
}, {
  path: '/diary',
  redirect: '/personal/diary',
  component: Layout,
  children: [{
    path: '/personal/diary',
    meta: {
      keepAlive: false,
      isAuth: true
    },
    component: () => import('@/components/personal/diary')
  }]
}, {
  path: '/user',
  redirect: '/personal/user',
  component: Layout,
  children: [{
    path: '/personal/user',
    meta: {
      keepAlive: false,
      isAuth: true
    },
    component: () => import('@/components/personal/user')
  }]
}]
