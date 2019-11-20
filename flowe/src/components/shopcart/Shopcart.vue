<template>
<div>
  <!-- 页头 -->
  <HeaderNav></HeaderNav> 
  <div  v-show="!cartList.length">
    <!-- 空购物车 -->
    <emptycart></emptycart>
    <!-- 底部导航栏 -->
    <FooterNav></FooterNav>
  </div>
  <div class="shopcart" v-show="cartList.length">
    <!-- 购物车主体 -->
    <div class="main">
      <!-- 购物车分类 -->
      <div class="cart-list" v-for="(item,index) in cartList" :key="index">
        <!-- 左侧选择框 -->
        <div class="cart-item-checkbox">
          <img src="@/assets/shopcart/checkout.png" @click="checkbox(item.productId)" v-if="item.seleced">
          <img src="@/assets/shopcart/uncheck.png" @click="checkbox(item.productId)" v-else>
        </div>
        <!-- 右侧商品主体 -->
        <div class="cart-item-right">
          <!-- 商品图片 -->
          <div class="cart-item-pic">
            <img v-lazy="'http://127.0.0.1:4000/'+item.productPic">
          </div>
          <!-- 商品信息 -->
          <div class="cart-item-info">
            <!-- 商品名称 -->
            <p>{{item.productName}}</p>
            <!-- 商品数量 -->
            <div class="cart-item-setnum">
                <span>数量</span>
              <!-- 商品数量选择 -->
              <div class="cart-item-inputs">
                <!-- 删除当前商品按钮/减一按钮 -->
                <span class="btn-cut">
                  <img src="@/assets/shopcart/jian.png" v-if="item.count > 1" @click="jianCount(item.productId)">
                  <img src="@/assets/shopcart/del.png" v-else @click="del(item.productId)">
                </span>
                <!-- 商品数量标签 -->
                <input class="num-count" :value="item.count">
                <!-- 商品数量加一按钮 -->
                <span class="btn-add">
                  <img src="@/assets/shopcart/jia.png" @click="addCount(item.productId)">
                </span>
              </div>
            </div>
            <!-- 商品价格 -->
            <p class="cart-item-price">
              ¥<span>{{item.price}}</span>
            </p>
          </div>
        </div>
      </div>
    </div>
    <!-- 商品推荐 -->
    <recommend></recommend>
    <!-- 结算 -->
    <div class="jieSuan">
      <p>合计：<span class="total">¥{{productTotal}}</span>
      </p>
      <router-link class="btn-jieSuan" to='/settlement'>去结算({{allCount}})</router-link>
    </div>
  </div>
</div>
</template>
<script>
import emptyCart from './emptyCart'
import Recommend from './Recommend.vue'
import {mapActions ,mapGetters} from 'vuex'
export default {
  components:{
    'emptycart':emptyCart,
    'recommend':Recommend,
  },
  data(){
    return{
    // 子菜单显示/隐藏
      menu:{dis:false},
      headerMenu:[
        {title:'首页',pic:require('@/assets/home/home.png'),link:'/home'},
        {title:'分类',pic:require('@/assets/home/category.png'),link:'/category'},
        {title:'我的',pic:require('@/assets/home/me.png'),link:'/me'}
      ],
    }
  },
  computed:{
    ...mapGetters(['cartList','productTotal','allCount']),
  },
  methods:{
    //引入购物车操作方法
    ...mapActions(['addProduct','addCartCount','jianCartCount','selectProduct','delProduct']), 
   checkbox(productId){ //商品选中按钮
      this.selectProduct(productId)
    },
    jianCount(productId){ //商品数量减一
      this.jianCartCount(productId)
    },
    addCount(productId){ //商品数量加一
      this.addCartCount(productId)
    },
    del(productId){ //商品删除
      this.delProduct(productId)
    },
    cartMenu(){ //购物车子菜单
      // 显示/隐藏功能
      this.menu.dis =!this.menu.dis //取反
    }
  },
}
</script>
<style scoped>

/* 结算 */
.jieSuan{
  display: flex;
  justify-content: space-between;
  align-items: center;
  background-color: white;
  position: fixed; /* 固定 */
  bottom: 0; /* 固定在底部 */
  left: 0;
  right: 0;
  padding-left: 1rem;
}
/* 合计 */
.jieSuan .total{
  color:#FF734C;
  font-size:1.2rem;
}
/* 结算按钮 */
.jieSuan .btn-jieSuan{
  padding:1rem 1.8rem;
  background-color: #FF734C;
  color:white;
  font-size:1.1rem;
  border:none;
}

/* 购物车 */
.main{
  background-color:white;
}
/* 购物车商品分类 */
.cart-list{
  display: flex;
  padding-top:0.5rem;
  border-top:1px solid #ccc;
}
/* 选中按钮 */
.cart-list .cart-item-checkbox{
  width: 10%;
  padding: 0 0.5rem;
}
.cart-list .cart-item-checkbox img{ /* 按钮图片 */
  margin-top:3.3rem;
  width: 1.5rem;
}
/* 商品右侧详情 */
.cart-list .cart-item-right{
  display: flex;
}
/* 商品图片 */
.cart-list .cart-item-pic{
  width: 40%;
}
.cart-list img{ /*商品图片*/
  width: 100%;
}
/* 商品信息 */
.cart-list .cart-item-info{
  padding:0 0.5rem;
  font-size:0.8rem;
  position: relative;
}
.cart-item-info > p { /* 商品名称 */
  font-size:1rem;
  margin-top:0.5rem;
}
/* 商品数量栏 */
.cart-list .cart-item-setnum{
  margin-top:0.8rem;  
}
.cart-list .cart-item-setnum > span{ /* 商品数量文字居中 */
  vertical-align: top;
  line-height: 1.6rem;
  margin-right: 0.3rem;
}
/* 数量选择按钮 */
.cart-list .btn-cut,.btn-add{
  display: inline-block;
  height: 1.5rem;
  width: 1.5rem;
  text-align: center;
  vertical-align:top;
}
.cart-list .btn-cut{
  border-right: 1px solid #ddd;/* 按钮减右边框 */
}
.cart-list .btn-add{
  border-left: 1px solid #ddd;/* 按钮加左边框 */
}
/* 加减按钮图标 */
.cart-list .btn-cut img,.btn-add img{
  height: 1rem;
  width: 1rem;
  vertical-align: middle;
} 
/* 商品数量栏 */
.cart-list .cart-item-inputs{
  font-size:0.8rem;
  height:1.5rem;
  line-height: 1.5rem;
  display: inline-block;
  font-size:0;
  border:1px solid #ddd;
}
/* 数量输入框 */
.cart-list input{
  width: 3rem;
  text-align: center;
  height: 100%;
  border:none;
  vertical-align:top;
  font-size:0.8rem;
}
/* 商品价格 */
.cart-item-info .cart-item-price{
  position: absolute;
  bottom: 1rem;
  left: 1rem;
  color:#FF734C;
}
</style>