<template>
  <div>
    <div class="container">
      <div class="login-container">
        <div class="input-container">
          <div class="username">
            <input type="text" autofocus v-model="username" placeholder="账 号">
          </div>
          <div class="password">
            <input type="password" v-model="password" placeholder="密 码">
          </div>
        </div>
        <div class="button-container">
          <th-button class="th-button" @click.native="login">登 录</th-button>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import thButton from '../../../component/thButton.vue'

export default{
  components: { thButton },
  data () {
    return {
      username: 'tanghao',
      password: '123456'
    }
  },
  methods: {
    login () {
      this.$store.dispatch('loginByUsername', {
        username: this.username,
        password: this.password
      }).then(() => {
        this.$router.push(this.$route.query.redirect || '/index')
      }).catch(err => {
        console.log(err)
      })
      // axios.post('/api/login', {
      //   username: this.username,
      //   password: this.password
      // })
      //   .then(res => {
      //     this.$store.commit('SETUSERNAME', res.data.result.username)
      //     this.$store.commit('SETNICKNAME', res.data.result.nickName)
      //     this.$store.commit('SETAVATAR', res.data.result.avatar)
      //     this.$router.push(this.$route.query.redirect)
      //   })
      //   .catch(err => {
      //     console.log(err)
      //     sessionStorage.removeItem('username')
      //   })
    }
  }
}
</script>

<style scoped lang="scss">
$inputBgColor: #fae96642;
.container {
  background-size: 100% 100%!important;
  background: url(../../../static/image/loginbg.jpg) center no-repeat;
  display: flex;
  align-items: center;
  justify-content: center;
  .login-container {
    width: 52rem;
    height: 32rem;
    border-radius: 0.8rem;
    box-shadow: 0rem -12rem 4rem inset #c321215c;
    display: flex;
    flex-direction: column;
    .input-container {
      flex: 2;
      width: 100%;
      display: flex;
      flex-direction: column;
      justify-content: space-evenly;
      align-items: center;
      .username, .password {
        width: 60%;
        height: 42px;
        background-color: $inputBgColor;
        input {
          background: $inputBgColor;
          color: #331231;
        }
      }
    }
    .button-container {
      flex: 1;
      width: 100%;
      display: flex;
      justify-content: center;
      .th-button {
        width: 60%;
        height: 4.2rem;
        color: #ffffff;
        font-size: 1.8rem;
        border-radius: 2.1rem;
        border: none!important;
        background: linear-gradient(to right, #ff7989, #f74545);
        &:active {
          background: linear-gradient(to right, #f78b98, #fe5454);
        }
      }
    }
  }
}
</style>
