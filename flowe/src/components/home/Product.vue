<template>
<div>
  <!-- 横向整屏商品详情 -->
  <div class="product">
    <h3>送恋人/爱情鲜花</h3>
    <div class="product-list" v-for="(item,index) in product_h" :key="index">
      <div class="product-list-pic">
      <img v-lazy="'http://127.0.0.1:4000/'+item.product_pic">
      </div>
      <div class="product-info">
        <p class="product-info-name">{{item.product_name}}</p>
        <p class="product-info-desc">{{item.product_desc}}</p>
        <span class="product-info-tags">{{item.product_tags}}</span>
        <p class="product-info-promo">{{item.product_promo}}</p>
        <div class="product-info-bottom">
          <div class="product-info-left">
            <p class="product-info-price">￥{{item.product_price}} <s>￥{{item.product_original}}</s></p>
            <p class="product-info-sales">已销售{{item.sale}}件</p>
          </div>
          <div class="product-info-right" >
            <img src="@/assets/home/smallcart.png" @click="addCart(item)">
          </div>
        </div>
      </div>
    </div>
    <div class="product-more">
      <a class="product-more-btn" href="javascript:;">查看更多</a>
    </div>
  </div>
  <!-- 垂直布局商品详情 -->
  <div class="product">
    <h3>永生花推荐</h3>
    <div class="product-list-vertical" v-for="(item,index) in product_c" :key="index">
      <div class="product-list-pic">
      <img v-lazy="'http://127.0.0.1:4000/'+item.product_pic">
      </div>
      <div class="product-info">
        <span class="product-info-tags">{{item.product_tags}}</span>
        <p class="product-info-name">{{item.product_name}}</p>
        <div class="product-info-bottom">
          <div class="product-info-left">
            <p class="product-info-price">￥{{item.product_price}} <s>￥{{item.product_original}}</s></p>
            <p class="product-info-sales">已销售{{item.product_sale}}件</p>
          </div>
          <div class="product-info-right">
            <img src="@/assets/home/smallcart.png" >
          </div>
        </div>
      </div>
    </div>
    <div class="product-more">
      <a class="product-more-btn" href="javascript:;">查看更多</a>
    </div>
  </div>
  <myfooter></myfooter>
</div>
</template>
<script>
import Footer from './Footer'
import {mapActions} from 'vuex' //引入方法

export default {
  components:{
    'myfooter':Footer
  },
  data(){
    return{
      product_h:[],
      product_c:[],
      
    }
  },
  created(){
    this.gain()
  },
  methods:{
    ...mapActions(['addProduct']), //ES6扩展运算符
    //加入购物车
    addCart(product){
      this.addProduct(product)

    },
    gain(){ //获取首页商品详情
      // 发送ajax请求，获取商品详情
      var url = 'homeproduct'
      this.axios.get(url)
      .then(res=>{
        this.product_h = res.data[0];
        this.product_c = res.data[1];
      })
    },
  }
}
</script>
<style scoped>

/* 垂直商品详情 */
.product-list-vertical { /* 垂直商品详情宽度50% */
  width: 50%;
  display: inline-block;
  padding:0.2rem;
  box-shadow: 0 0.3rem 0.5rem #e9ecf0; /* 边缘阴影 */
  border-radius: 0.3rem;
  margin-bottom:0.5rem;
}
.product-list-vertical .product-list-pic{ /* 图片100% */
  width: 100%;
}
.product-list-vertical .product-info{ /* 调整垂直商品详情布局 */
  width: 100%;
  height:7rem;
  padding:0.3rem 0.5rem;
}
.product-list-vertical .product-info-name{ /* 垂直商品 */
  padding-top:0 !important;
  text-overflow:ellipsis; /* 文本溢出是省略号代替 */
  white-space:nowrap; /* 文本不换行 */
  overflow:hidden; /* 文字溢出时剪切多余内容 */
}
.product-list-vertical  .product-info-tags{ /* 商品标签 */
  color:#FF734C;
  display: inline-block;
  border:1px solid #FF734C;
  border-radius: 0.5rem;
  padding:0 0.2rem;
  margin-bottom: 0.3rem;
  font-size:0.5rem;
}
.product-list .product-info-tags{ /* 商品标签 */
  background-color:#FF734C;
  color: white;
  display: inline-block;
  border-radius: 0.5rem;
  padding:0 0.2rem;
  margin-bottom: 0.3rem;
  font-size:0.5rem;
}
/* 更多 */
.product-more{
  padding:1.5rem 0;
  text-align: center;
}
.product-more .product-more-btn{ /* 更多按钮 */
  display: inline-block;
  text-decoration:none;
  color:black;
  border:1px solid #666;
  padding:0.3rem 1.5rem;
  font-size: 0.9rem;
  border-radius: 0.2rem;
}
/* 商品详情分类 */
.product{
  margin-top:0.5rem;
  padding:0 0.5rem;
  font-size:0;
}
.product h3{ /* 标题 */
  text-align: center;
  padding:1rem; 
  font-weight: normal; /* 字体粗细默认 */
  font-size:1.2rem;
}
.product-list{ /* 商品详情弹性布局 */
  display: flex; 
  box-shadow: 0 0.3rem 0.5rem #e9ecf0; /* 边缘阴影 */
  border-radius:0.3rem; /* 边缘圆角 */
  margin-bottom: 0.5rem;
}
.product-list-pic{ /* 商品详情图片父级 */
  width: 50%;
}
.product-list-pic img{ /* 商品详情图片 */
  width: 100%;
}
.product-info{ /* 商品介绍 */
  width: 50%;
  font-size:0.8rem;
  padding:0 0.5rem;
  color:#666;
  position: relative;
}
.product-info .product-info-name{ /* 商品名称 */
  font-size:1rem;
  padding-top:1rem;
}
.product-info .product-info-desc{ /* 商品描述 */
  padding-top:2px;
}
.product-info .product-info-promo{ /* 商品推广语 */
  padding:10px 0;
  color:black;
  border-top:1px solid #ddd;
  border-bottom:1px solid #ddd;
  margin-top:0.8rem;
}
.product-info .product-info-bottom{ /* 购物栏 */
  display: flex;
  justify-content: space-between;
  align-items:center;
  position: absolute;
  bottom:0.5rem;
  left:0.8rem;
  right:0.8rem;
}
.product-info .product-info-bottom .product-info-price{ /* 价格及销售 */
  font-size: 1.2rem;
  color:#FF734C;
  margin-right:1.5rem;
}
.product-info .product-info-bottom .product-info-price s{ /* 原价格 */
  font-size:0.8rem;
  color:#666;
}
</style>