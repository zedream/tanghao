<template>
  <button class="th-button"
          :class="[`th-btn-${type}`, `${type}-${hover}`, `${type}-${active}`]"
          @mousemove="simuHover"
          @mouseout="hoverNone"
          @mousedown="simuActive"
          @mouseup="activeNone">
    <slot></slot>
  </button>
</template>

<script>
export default {
  data () {
    return {
      hover: '',
      active: ''
    }
  },
  props: {
    type: {
      type: String,
      default: 'default' // add, del, save
    }
  },
  methods: {
    simuHover () {
      this.hover = 'hover'
    },
    hoverNone () {
      this.hover = ''
    },
    simuActive () {
      this.active = 'active'
    },
    activeNone () {
      this.active = ''
    }
  }
}
</script>

<style>
.th-button {
  display: inline-block;
  color: #fff;
  background: linear-gradient(to right, #06e4fb, #00a2f0);
  cursor: pointer;
}
.th-btn-default {
  width: 8rem;
  height: 2.4rem;
  color: #ffffff;
  font-size: 1.4rem;
  border-radius: 1.2rem;
  background: linear-gradient(to right, #e4e4e4, #e5e5e5);
  color: #6d6d6d;
  border: 1px solid #d2d2d2!important;
  box-sizing: border-box;
}
.default-hover {
  background: linear-gradient(to right, #eeeded, #efefef);
}
.default-active {
  background: linear-gradient(to right, #d9d8d8, #d0d0d0);
}
.th-btn-save {
  width: 8rem;
  height: 2.4rem;
  color: #ffffff;
  font-size: 1.4rem;
  border-radius: 1.2rem;
  background: linear-gradient(to right, #32aff7, #018dde);
}
.save-hover {
  background: linear-gradient(to right, #65c4fd, #14a7fc);
}
.save-active {
  background: linear-gradient(to right, #2daef9, #0482cb);
}
.th-btn-del {
  width: 8rem;
  height: 2.4rem;
  color: #ffffff;
  font-size: 1.4rem;
  border-radius: 1.2rem;
  background: linear-gradient(to right, #fb5e5e, #ff2b3f);
}
.del-hover {
  background: linear-gradient(to right, #fb7979, #ff6565);
}
.del-active {
  background: linear-gradient(to right, #f95050, #ff2c2c);
}
.th-btn-add {
  width: 8rem;
  height: 2.4rem;
  color: #ffffff;
  font-size: 1.4rem;
  border-radius: 1.2rem;
  background: linear-gradient(to right, #54ff61, #15ff1c);
}
.add-hover {
  background: linear-gradient(to right, #6dff78, #42ff48);
}
.add-active {
  background: linear-gradient(to right, #17ff29, #00bf06);
}
</style>
