<template>
  <div>
    <nav v-show="nav">
      <router-link to="/index">go</router-link>
      <router-link to="/demo">demo</router-link>
    </nav>
    <swiper :options='swiperOption' ref='mySwiper'>
      <swiper-slide>
        <router-link :class="{zoomAni: zoomAni}" to="/index" @mouseover="aniHide">/index</router-link>
      </swiper-slide>
      <swiper-slide>I'm Slide 2</swiper-slide>
      <swiper-slide>I'm Slide 3</swiper-slide>
      <swiper-slide>I'm Slide 4</swiper-slide>
      <swiper-slide>
        <a target="_blank" href="http://image.baidu.com/search/index?ct=201326592&z=&tn=baiduimage&ipn=r&word=1920x1080%E8%B6%85%E6%B8%85%E7%AE%80%E7%BA%A6&pn=0&ie=utf-8&oe=utf-8&cl=2&lm=-1&st=-1&fr=&ic=16&se=&sme=&width=1920&height=1080&hd=0&latest=0&copyright=0">背景图片来源</a>
      </swiper-slide>
    </swiper>
  </div>
</template>

<script>
export default{
  data () {
    return {
      nav: false,
      zoomAni: true,
      swiperOption: {
        notNextTick: true, // notNextTick是一个组件自有属性，如果notNextTick设置为true，组件则不会通过NextTick来实例化swiper，也就意味着你可以在第一时间获取到swiper对象，假如你需要刚加载遍使用获取swiper对象来做什么事，那么这个属性一定要是true
        direction: 'vertical', // 水平方向移动
        grabCursor: false, //  鼠标覆盖Swiper时指针会变成手掌形状，拖动时指针会变成抓手形状
        setWrapperSize: true, //  Swiper使用flexbox布局(display: flex)，开启这个设定会在Wrapper上添加等于slides相加的宽或高，在对flexbox布局的支持不是很好的浏览器中可能需要用到。
        autoHeight: true, //  自动高度。设置为true时，wrapper和container会随着当前slide的高度而发生变化
        slidesPerView: 1, //  设置slider容器能够同时显示的slides数量(carousel模式)。可以设置为数字（可为小数，小数不可loop），或者 'auto'则自动根据slides的宽度来设定数量。loop模式下如果设置为'auto'还需要设置另外一个参数loopedSlides。
        mousewheel: true, //  开启鼠标滚轮控制Swiper切换。可设置鼠标选项，默认值false
        mousewheelControl: true, // 同上
        height: window.innerHeight, //  高度设置，占满设备高度
        resistanceRatio: 0, //  抵抗率。边缘抵抗力的大小比例。值越小抵抗越大越难将slide拖离边缘，0时完全无法拖离。本业务需要
        observeParents: true //   将observe应用于Swiper的父元素。当Swiper的父元素变化时，例如window.resize，Swiper更新
      }
    }
  },
  components: {},
  computed: {
    // swiper () {
    //   return this.$refs.mySwiper.swiperOption
    // }
  },
  watch: {
    swiper () {
      return this.$refs.mySwiper.swiperOption
    }
  },
  created () {
    this.$notify.success({
      title: '安侑熙',
      message: '欢迎来到召唤师峡谷',
      showClose: false
    })
  },
  mounted () {
    window.addEventListener('scroll', this.handleScroll)
    // current swiper instance
    // 然后你就可以使用当前上下文内的swiper对象去做你想做的事了
    console.log('this is current swiper instance object', this.swiper)
  },
  methods: {
    aniHide () {
      this.zoomAni = false
    },
    handleScroll () {
      var scrollTop = window.pageYOffset || document.documentElement.scrollTop || document.body.scrollTop
      if (scrollTop > 500) {
        this.nav = true
      } else if (scrollTop < 500) {
        this.nav = false
      }
    }
  }
}
</script>

<style scoped lang="scss">
::-webkit-scrollbar {
  width: 0 !important;
  height: 0;
}
.swiper-slide {
  background-size: 100% 100%!important;
}
.zoomAni {
  animation-name: zoomAni;
  animation-iteration-count: infinite;
  animation-delay: 0.5;
  animation-timing-function: ease;
  animation-duration: 1.4s;
  animation-direction: alternate;
}
@keyframes zoomAni {
  0% {
    transform: scale(0.8);
  }
  100% {
    transform: scale(1.1);
  }
}
.swiper-slide:first-child {
  background: url(../../../static/image/127.0.0.1.jpg) center no-repeat;
  position: relative;
  a {
    color: #c8dafe;
    font-size: 5rem;
    position: absolute;
    right: 12%;
    top: 55%;
  }
}
.swiper-slide:nth-child(2) {
  background: url(../../../static/image/littlefolk.jpg) center no-repeat;
}
.swiper-slide:nth-child(3) {
  background: url(../../../static/image/board.png) center no-repeat;
}
.swiper-slide:nth-child(4) {
  background: url(../../../static/image/car.jpg) center no-repeat;
}
</style>
