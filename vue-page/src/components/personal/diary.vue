<template>
  <div>
    <div class="container">
      <div class="top">
        <div class="top-left">
          <div>总篇数：<span>2</span></div>
          <div>回收站：<span>1</span></div>
        </div>
        <div class="search-wrap">
          <input type="text" v-model="search">
        </div>
        <div class="btn-wrap">
          <th-button class="write-btn" type="add">
            <img src="../../../static/image/personal/write.png">
            写日记
          </th-button>
        </div>
      </div>
      <div class="diary-list"></div>
      <div class="write-wrap">
        <vue-editor id="editor"
                    v-model="content"
                    @imageAdded="handleImageAdded"/>
        <div class="right">
          <div class="date-box">
            <span v-text="date"></span>
          </div>
          <div class="cover-box"></div>
          <div class="btn-box"></div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import { VueEditor, Quill } from 'vue2-editor'
import thButton from '../../../component/thButton.vue'
export default {
  components: { VueEditor, Quill, thButton },
  data () {
    return {
      date: '',
      search: '',
      content: '<h1>Some initial content</h1>'
    }
  },
  created () {
    this.date = new Date()
  },
  methods: {
    handleImageAdded () {}
  }
}
</script>

<style scoped lang="scss">
  .top {
    display: flex;
    height: 56px;
    align-items: center;
    background: #c7ffe5;
    padding: 0 32px;
    .top-left {
      display: flex;
      align-items: center;
      flex: 1;
      font-size: 16px;
      color: #575757;
      font-weight: 600;
      div {
        cursor: pointer;
        user-select: none;
        &:hover {
          text-decoration: underline;
          color: #6c6c6c;
        }
        &:active {
          text-decoration: underline;
          color: #525252;
        }
        span {
           color: #ff5656;
        }
        &:first-child {
          margin-right: 12px;
          span {
            color: #3a8ee6;
          }
        }
      }
    }
    .search-wrap {
      width: 400px;
      background: #FFFFFF;
      height: 40px;
    }
    .btn-wrap {
      flex: 1;
      display: flex;
      align-items: center;
      justify-content: flex-end;
      .write-btn {
        width: 140px;
        height: 40px;
        border-radius: 6px;
        display: flex;
        align-items: center;
        justify-content: center;
        font-size: 17px;
        font-weight: 500;
        cursor: pointer;
        img {
          width: 24px;
          margin-right: 6px;
        }
      }
    }
  }
  .write-wrap {
    background: red;
    width: 60%;
    margin: 0 auto;
    display: flex;
    height: 650px;
    .quillWrapper {
      width: 70%;
      height: 500px;
      margin-right: 16px;
    }
    .right {
      flex: 1;
    }
  }
</style>
