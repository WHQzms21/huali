<template>
  <div class="item">
    <ul class="item-list">
      <li class="item-list-term" v-for="(item,index) in cartList" :key="index">
        <div class="item-list-term-pic">
          <img :src="'http://127.0.0.1:4000/'+item.productPic">
        </div>
        <div class="item-list-term-info">
          <p class="item-list-term-info-name">{{item.productName}}</p>
          <p class="item-list-term-info-num">数量：x {{item.count}}</p>
        </div>
        <div class="item-list-term-price">¥<span>{{item.price}}</span></div>
      </li>
    </ul>
    <div class="item-total">
      <span class="item-total-name">商品总金额</span>
      <span class="item-total-price">¥{{productTotal}}</span>
    </div>
    <div class="jieSuan">
      <p>合计：<span class="total">¥{{productTotal}}</span>
      </p>
      <router-link class="btn-jieSuan" to='/settlement'>去结算</router-link>
    </div>
  </div>
</template>
<script>
import {mapGetters} from 'vuex'
export default {
  data(){
    return{}
  },
  computed:{
    ...mapGetters(['cartList','productTotal']),
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
  font-size:1.5rem;
}
/* 结算按钮 */
.jieSuan .btn-jieSuan{
  padding:1rem 2rem;
  background-color: #FF734C;
  color:white;
  font-size:1.1rem;
  border:none;
}
/* 商品详情主体 */
.item-list{
  padding:0.5rem 1rem;
  border-bottom:1px solid #ddd;
}
.item-list-term{ /* 商品详情 */
  display: flex;
  justify-content: space-between;
  margin-top:0.5rem;
}
.item-list-term-pic img{ /* 商品图片 */
  width: 4.5rem;
  height: 4.5rem;
}
.item-list-term-info{ /* 商品 */
  width: 65%;
  font-size:0.9rem;
}
.item-list-term-price{ /* 商品价格 */
  font-weight: bold;
}
.item-total{ /*  */
  padding:1.5rem 1rem;
  display: flex;
  justify-content: space-between;
}
.item-total-price{
  font-weight: bold;
  font-size:1.2rem;
}
</style>