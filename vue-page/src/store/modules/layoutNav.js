const layoutNav = {
  state: {
    active: +sessionStorage.getItem('nav_active') || 0,
    username: ''
  },
  mutations: {
    ACTIVE: (state, val) => {
      state.active = val
      sessionStorage.setItem('nav_active', val)
    },
    SETUSERNAME: (state, val) => {
      sessionStorage.setItem('username', val)
    },
    REMOVEUSERNAME: (state) => {
      sessionStorage.removeItem('username')
    },
    SETNICKNAME: (state, val) => {
      sessionStorage.setItem('nick_name', val)
    },
    REMOVENICKNAME: (state) => {
      sessionStorage.removeItem('nick_name')
    },
    SETAVATAR: (state, val) => {
      sessionStorage.setItem('avatar', val)
    },
    REMOVEAVATAR: (state) => {
      sessionStorage.removeItem('avatar')
    }
  }
}

export default layoutNav
