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
      message: '我的相册也还还没做哩，嘻嘻~',
      type: 'error',
      duration: 0
    })
  }
}
</script>

<style scoped>
</style>
