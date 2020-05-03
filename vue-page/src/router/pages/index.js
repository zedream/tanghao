export default [{
  path: '/404',
  component: () => import('@/components/err-page/404'),
  meta: {
    isAuth: false
  }
}, {
  path: '*',
  redirect: '/404'
}]
