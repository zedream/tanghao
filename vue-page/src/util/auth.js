const tokenKey = 'th-token'

export const setUsername = (username) => {
  localStorage.setItem('username', username)
}

export const setNickName = (nickName) => {
  localStorage.setItem('nick_name', nickName)
}

export const setAvatar = (avatar) => {
  localStorage.setItem('avatar', avatar)
}

export const setToken = (token) => {
  localStorage.setItem(tokenKey, token)
}

export const removeUsername = (username) => {
  localStorage.removeItem('username')
}

export const removeNickName = (nickName) => {
  localStorage.removeItem('nick_name')
}

export const removeAvatar = (avatar) => {
  localStorage.removeItem('avatar')
}

export const removeToken = (token) => {
  localStorage.removeItem(tokenKey)
}

export const getUsername = (username) => {
  return localStorage.getItem('username')
}

export const getNickName = (nickName) => {
  return localStorage.getItem('nick_name')
}

export const getAvatar = (avatar) => {
  return localStorage.getItem('avatar')
}

export const getToken = (token) => {
  return localStorage.getItem(tokenKey)
}
