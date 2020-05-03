<template>
  <div>
    <div class="container">
    </div>
  </div>
</template>

<script>
export default {
  data () {
    return {}
  },
  created () {
    this.$notify({
      title: '提示',
      message: '首页还没做呢~',
      type: 'error',
      duration: 0
    })
  }
}
</script>

<style scoped lang="scss">
.container {
  background: url(../../../static/image/greenbg.jpg) center no-repeat;
  background-size: 100% 100%!important;
}
</style>
