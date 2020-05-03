const layoutNav = {
  state: {
    active: +sessionStorage.getItem('nav_active') || 0
  },
  mutations: {
    ACTIVE: (state, val) => {
      state.active = val
      sessionStorage.setItem('nav_active', val)
    }
  }
}

export default layoutNav
