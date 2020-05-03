<template>
  <div>
    <div class="nav-container">
      <div class="wel"><router-link to="/wel">Zed Tang</router-link></div>
      <router-link @click.native="$store.commit('ACTIVE', 0)" :class="{'nav-active': active === 0}" to="/index">首页</router-link>
      <router-link @click.native="$store.commit('ACTIVE', 1)" :class="{'nav-active': active === 1}" to="/mydiary">我的日记</router-link>
      <router-link @click.native="$store.commit('ACTIVE', 2)" :class="{'nav-active': active === 2}" to="/myphoto">我的相册</router-link>
      <router-link @click.native="$store.commit('ACTIVE', 3)" :class="{'nav-active': active === 3}" to="" @mousemove.native="dropListPersonal = true" @mouseout.native="dropListPersonal = false">个人中心
        <div class="drop-list" v-show="dropListPersonal">
          <router-link to="infomation" @click="dropListPersonal = false">信息管理</router-link>
          <router-link to="diary" @click="dropListPersonal = false">日记管理</router-link>
          <router-link to="user" @click="dropListPersonal = false">用户管理</router-link>
        </div>
      </router-link>
      <div class="user-info" v-if="nickName" @mousemove="dropList = true" @mouseout="dropList = false">
        <div class="nick-name" v-text="nickName"></div>
        <img :src="avatar" alt="avatar">
        <div class="drop-list" v-show="dropList">
          <div @click="modifyPwd">修改密码</div>
          <div @click="logout">退出</div>
        </div>
      </div>
    </div>
    <div id="container">
      <keep-alive>
        <router-view v-if="$route.meta.$keepAlive"/>
      </keep-alive>
      <router-view v-if="!$route.meta.$keepAlive"/>
    </div>
  </div>
</template>

<script>
import store from '../../store/modules/layoutNav.js'
import axios from '../../axios/'
export default{
  data () {
    return {
      active: store.state.active,
      dropList: false,
      dropListPersonal: false,
      nickName: sessionStorage.getItem('nick_name'),
      avatar: sessionStorage.getItem('avatar')
    }
  },
  // mounted () {
  //   console.log(this.$store.state.active)                   ///// ??
  // },
  computed: {
    activeStore () {
      return store.state.active
    }
  },
  watch: {
    activeStore (val) {
      this.active = val
    }
  },
  methods: {
    modifyPwd () {
      this.$prompt('请输入新密码', '密码修改', {
        confirmButtonText: '确定',
        cancelButtonText: '取消'
        // inputPattern: /[\w!#$%&'*+/=?^_`{|}~-]+(?:\.[\w!#$%&'*+/=?^_`{|}~-]+)*@(?:[\w](?:[\w-]*[\w])?\.)+[\w](?:[\w-]*[\w])?/,
        // inputErrorMessage: '邮箱格式不正确'
      }).then(({ value }) => {
        axios.post('/api/users/modifyPassword', {
          username: sessionStorage.getItem('username'),
          password: value
        })
          .then(res => {
            this.$message({
              type: 'success',
              message: '你的新密码是: ' + value
            })
          })
          .catch(err => {
            this.$message.error(err)
          })
      }).catch(() => {})
    },
    logout () {
      this.$store.commit('REMOVEUSERNAME')
      this.$store.commit('REMOVENICKNAME')
    }
  }
}
</script>

<style scoped lang="scss">
.nav-container {
  display: flex;
  width: 100%;
  height: 4.2rem;
  align-items: center;
  justify-content: center;
  background: linear-gradient(to bottom, #090723, #090723, #090723, #090723);
  color: #bbbfc4;
  font-size: 1.6rem;
  position: relative;
  a {
    padding: 0 1.6rem;
    height: 4.2rem;
    line-height: 4.2rem;
    position: relative;
    &:hover {
      background: #f7f5f5;
      color: #4b525f;
    }
  }
  .nav-active {
    background: #23204b;
  }
  .wel {
    font-size: 1.8rem;
    position: absolute;
    left: 1.2rem;
    margin: 0;
    a {
      padding: 0;
      margin: 0;
      &:hover {
        background: none;
        color: #bbbfc4;
      }
    }
  }
  .user-info {
    position: absolute;
    right: 1.2rem;
    height: 4.2rem;
    display: flex;
    align-items: center;
    cursor: pointer;
    .nick-name {
      color: #ffffff;
      margin-right: 1.2rem;
    }
    img {
      width: 3rem;
      height: 3rem;
      border-radius: 50%;
    }
  }
}
.drop-list {
  position: absolute;
  background: #23204b;
  top: 4.2rem;
  left: 0;
  width: 100%;
  color: #bbbfc4;
  z-index: 1;
  div, a {
    width: 100%;
    line-height: 2.8rem;
    text-align: center;
    height: 2.8rem;
    display: block;
    font-size: 1.4rem;
    user-select: none;
    padding: 0;
    color: #bbbfc4;
    &:hover {
      background: #363268;
      color: #bbbfc4;
    }
    &:active {
      background: #322f5c;
      color: #bbbfc4;
    }
  }
}
@media screen and (min-width: 1366px) and (max-width: 1600px) {
  .nav-container {
    a {
      margin: 0 1.6rem;
    }
  }
}
@media screen and (min-width: 1600px) {
  .nav-container {
    a {
      margin: 0 3.2rem;
    }
  }
}
</style>
