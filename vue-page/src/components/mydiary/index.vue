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
      message: '我的日记也还没做哦~',
      type: 'error',
      duration: 0
    })
  }
}
</script>

<style scoped>
</style>
