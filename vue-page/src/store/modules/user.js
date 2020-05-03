import { setUsername, setNickName, setAvatar, setToken, removeUsername, removeNickName, removeAvatar, removeToken } from '@/util/auth.js'
import axios from '@/axios'

const user = {
  state: {
    token: sessionStorage.getItem('username') || '',
    username: sessionStorage.getItem('username') || '',
    nickName: sessionStorage.getItem('nick_name') || '',
    avatar: sessionStorage.getItem('avatar') || ''
  },
  actions: {
    loginByUsername ({commit}, loginInfo) {
      return new Promise((resolve, reject) => {
        axios.post('/api/login', {
          username: loginInfo.username,
          password: loginInfo.password
        })
          .then(res => {
            console.log(res)
            commit('SETUSERNAME', res.data.result.username)
            commit('SETNICKNAME', res.data.result.nickName)
            commit('SETAVATAR', res.data.result.avatar)
            commit('SETTOKEN', res.data.token)
            resolve()
          })
          .catch(err => {
            reject(err)
          })
      })
    }
  },
  mutations: {
    SETUSERNAME: (state, val) => {
      setUsername(val)
    },
    REMOVEUSERNAME: (state) => {
      removeUsername()
    },
    SETNICKNAME: (state, val) => {
      setNickName(val)
    },
    REMOVENICKNAME: (state) => {
      removeNickName()
    },
    SETAVATAR: (state, val) => {
      setAvatar(val)
    },
    REMOVEAVATAR: (state) => {
      removeAvatar()
    },
    SETTOKEN: (state, val) => {
      setToken(val)
    },
    REMOVETOKEN: (state) => {
      removeToken()
    }
  }
}

export default user
