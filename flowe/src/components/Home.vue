<template>
<div>
<div id="home">
  <!-- 页头 -->
  <div id="header">
    <router-link to="category" class="icon">
      <img src="@/assets/home/list.png">
    </router-link>
    <div class="logo">
      <img src="@/assets/home/m_hualogo.png">
    </div>
    <div class="icon">
      <img src="@/assets/home/kefu.png">
    </div>
  </div>
  <!-- 轮播图 -->
  <div id="lunbo">
    <mt-swipe :auto="4000" style="height:12.5rem">
      <mt-swipe-item v-for="(lunbo,index) in lunbo" :key="index">
        <img :src="lunbo">
      </mt-swipe-item>
    </mt-swipe>
  </div>
  <!-- 标签 -->
  <div id="bt">
    <div><img src="@/assets/home/gou.png"><span>认证龙头企业</span></div>
    <div><img src="@/assets/home/gou.png"><span>14年品质</span></div>
    <div><img src="@/assets/home/gou.png"><span>3小时送达</span></div>
    <div><img src="@/assets/home/gou.png"><a>最近230条好评</a></div>
  </div>
  <!-- 首页分类导航 -->
  <div id="header_nav">
    <div v-for="(headerNav,index) in headerNav" :key="index">
      <img :src="headerNav.pic">
      <p>{{headerNav.title}}</p>
    </div>
  </div>
  <!-- 首页商品导航楼 -->
  <home-nav></home-nav>
</div>
  <!-- 首页商品详情 -->
  <product></product>
  <!-- 底部导航栏 -->
  <FooterNav></FooterNav>
</div>
</template>
<script>
// 引入首页商品组件
import HomeNav from './home/HomeNav' 
import Product from './home/Product'
export default {
  components:{
    'home-nav':HomeNav,
    'product':Product
  },
  data(){
    return{
      // 轮播图数组
      lunbo:[
        require('@/assets/home/lunbo1.jpg'),
        require('@/assets/home/lunbo2.jpg'),
        require('@/assets/home/lunbo3.jpg'),
        require('@/assets/home/lunbo4.jpg') ],
      // 首页分类导航
      headerNav:[
        {title:'鲜花',pic:require('@/assets/home/header_nav1.png')},
        {title:'永生花',pic:require('@/assets/home/header_nav2.png')},
        {title:'蛋糕',pic:require('@/assets/home/header_nav3.png')},
        {title:'礼品',pic:require('@/assets/home/header_nav4.png')},
        {title:'巧克力',pic:require('@/assets/home/header_nav5.png')} ],
      // 空

    }
  },
  
}
</script>
<style scoped>
/* 首页分类导航 */
#header_nav{
  display: flex;
  text-align: center;
  margin-top:1rem;  
  font-size:0.8rem;
  justify-content: space-around;
}
#header_nav img{ /* 首页分类导航图片 */
  width: 45%;
}

/* 标签 */
#bt{
  display: flex;
  font-size:0.9rem;
  justify-content: space-between;
  padding:0 0.5rem;
  margin-top:0.5rem;
}
#bt div{ /* 标签垂直居中 */
  display: flex;
  align-items:center;
}
#bt img{
  width: 1rem;
}
/* 页头 */
#header{ 
  display: flex; 
  align-items:center;
  text-align: center;
  padding:0.5rem 1rem;
  background-color:#ccc;
}
#header .logo img{ /* 页头中部图片 */
  width: 55%;
}

/* 页头两侧图片 */
.icon img{
  width: 80%;
}

/* 轮播图片 */
#lunbo img{
  width: 100%;
}
</style>

