<template>
  <!-- 底部导航栏 -->
  <div class="tabbar">
    <router-link to="/home" class="tabbar-item">
      <img src="@/assets/home/home.png">
      <p>首页</p>
    </router-link>
    <router-link to="/category" class="tabbar-item">
      <img src="@/assets/home/category.png">
      <p>分类</p>
    </router-link>
    <router-link to="/shopcart" class="tabbar-item">
      <span class="cart-count" v-if="allCount!=0">{{allCount}}</span>
      <img src="@/assets/home/shopcart.png">
      <p>购物车</p>
    </router-link>
    <router-link to="/me" class="tabbar-item">
      <img src="@/assets/home/me.png">
      <p>我的</p>
    </router-link>
  </div>
</template>
<script>
import {mapActions ,mapGetters} from 'vuex'
export default {
  data(){
    return{
      
    }
  },
  computed:{
    ...mapGetters(['cartList','productTotal','allCount']),
  },
}
</script>
<style scoped>
/* 底部导航栏 */
.tabbar{ /* 弹性布局，定位底部 */
  display: flex;
  justify-content: space-around;
  background-color: white;
  position:fixed; /* 固定定位 */
  z-index: 2;
  left: 0;
  right: 0;
  bottom: 0; /* 窗口底部固定 */
}
.tabbar .tabbar-item{ /* 导航图标 */
  text-decoration: none;
  color:black;
  width: 25%;
  text-align: center;
  padding:0.3rem 0;
  font-size:0.9rem;
  position: relative;
}
.tabbar .tabbar-item img{ /* 导航图片大小 */
  width:1.6rem;
}
.cart-count{ /* 购物车数量标签 */
  position: absolute; 
  display: block;
  right: 1.2rem;
  background-color:#FF734C;
  color:white;
  border-radius: 1rem;
  font-size:0.8rem;
  min-width: 1rem;
  height: 1rem;
  padding-top:1px;
}
</style>
