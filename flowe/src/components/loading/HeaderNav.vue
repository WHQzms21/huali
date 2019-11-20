<template>
  <div>
    <!-- 页头 -->
  <div class="header">
    <div class="header-left">
      <img @click="$router.back(-1)" src="@/assets/shopcart/arrow.png">
    </div>
    <div class="header-content">{{headerTitle.name}}</div>
    <div @click="cartMenu" class="header-right" >
      <div  v-show="headerTitle.show">
      <img src="@/assets/shopcart/menu.png">
      <!-- 子菜单 -->
      <div class="header-menu" v-show="menu.dis">
        <router-link :to="item.link" v-for="(item,index) in headerMenu" :key="index" class="header-menu-item" >
          <img :src="item.pic">
          <span>{{item.title}}</span>
        </router-link>
      </div>
    </div>
    </div>
  </div>
  </div>
</template>
<script>
export default {
  data(){
    return{
    // 子菜单显示/隐藏
      menu:{dis:false},
      headerMenu:[
        {title:'首页',pic:require('@/assets/home/home.png'),link:'/home'},
        {title:'分类',pic:require('@/assets/home/category.png'),link:'/category'},
        {title:'我的',pic:require('@/assets/home/me.png'),link:'/me'}
      ],
      // 头部名称
      headerTitle:{
        name:'购物车',show:true
      }
    }
  },
  created(){
    this.myurl()
  },
  methods:{
    cartMenu(){ //购物车子菜单
      // 显示/隐藏功能
      if(this.menu.dis==false){
        this.menu.dis=true;
      }else if(this.menu.dis==true){
        this.menu.dis=false;
      }
    },
    myurl(){
      //动态变换当前页面头部信息
      var url =  window.location.href.split('/');//获取当前url
      url = url[url.length-1]; //获取当前url最后一位
      if(url == 'shopcart'){ //如果url是shopcart页面
        this.headerTitle = {name:'购物车',show:true} //页头文字为'购物车' ，显示子菜单
      }else if(url == 'me'){ //否则，页头文字为个人中心 ,并隐藏子菜单
        this.headerTitle = {name:'个人中心',show:false}
      }else if(url == 'settlement'){
        this.headerTitle = {name:"提交订单",show:false}
      }else {
        this.headerTitle = {name:"",show:false}
      }
    }
  },
  
}
</script>
<style scoped>
/* 页头右部定位标杆 */
.header .header-right{
  position: relative;
}
/* 头部左右按钮固定宽度 */
.header-left,.header-right{
  width: 10%;
  padding:0.5rem;
}
/* 头部子菜单 */
.header-menu{
  background-color: white;
  width: 5.5rem;
  font-size:0.95rem;
  position: absolute; /* 定位 */
  z-index: 3; /* 浮动于上方 */
  right: 0.2rem;
  top:2.8rem;
  box-shadow: 0 0.2rem 0.5rem 0 #ccc; /* 设置阴影 */
  border-radius: 0.2rem;
}
.header-menu .header-menu-item{ /* 子菜单标签 */
  width: 100%;
  display: flex;
  align-items: center;
  padding:0.3rem 0.3rem;
}
.header-menu .header-menu-item img{ /* 子菜单图片大小 */
  width: 1rem;
  height: 1rem;
  margin:0.5rem;
  padding:0;
}
/* 购物车页头 */
.header{
  display: flex;
  justify-content: space-between;
  align-items: center;
  background-color:white;
}
/* 页头图片大小 */
.header img{
  width: 1.2rem;
}
/* 页头字体大小 */
.header-content{
  font-size:1.2rem;
}
</style>