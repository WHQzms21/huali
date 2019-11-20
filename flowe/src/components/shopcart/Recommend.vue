<template>
  <div>
    <!-- 推荐商品 -->
      <!-- 推荐商品 -->
    <div class="recommend">
      <p class="recommend-nav">
        <a href="javascript:;">购买该商品的该购买了</a>
        <a href="javascript:;">巧克力/花瓶</a>
      </p>
      <div class="product">
      <ul class="recommend-tab">
        <li v-for="(item,index) in recommend" :key="index">
          <img v-lazy="item.pic">
          <p class="recommend-name">{{item.title}}</p>
          <p class="recommend-name">¥{{item.price}}</p>
        </li>
      </ul>
      </div>
    </div>
  </div>
</template>
<script>
export default {
  data(){
    return{
      // 推荐商品数组   
      recommend:[
        {title:'天使之恋',price:119,pic:require('@/assets/shopcart/1070017.jpg_80x87.jpg')},
        {title:'花好月圆永生花台灯',price:298,pic:require('@/assets/shopcart/1073247.jpg_80x87.jpg')},
        {title:'天使之恋',price:119,pic:require('@/assets/shopcart/1073243.jpg_80x87.jpg')},
        {title:'天使之恋',price:119,pic:require('@/assets/shopcart/1207010.jpg_80x87.jpg')},
        {title:'天使之恋',price:119,pic:require('@/assets/shopcart/1076067.jpg_80x87.jpg')},
        {title:'天使之恋',price:119,pic:require('@/assets/shopcart/1076067.jpg_80x87.jpg')},
        {title:'天使之恋',price:119,pic:require('@/assets/shopcart/1076067.jpg_80x87.jpg')}
      ],
      // 空
    }
  },
  methods:{
    
  },
}
</script>
<style scoped>
/* 推荐商品 */
.recommend{
  margin-top:0.5rem;
  padding:0.8rem;
  background-color: white;
  margin-bottom: 5rem;
}
.recommend .recommend-nav a{ /* 推荐标语 */
  text-decoration:none;
  color:black;
  font-size:0.8rem;
  display: inline-block;
  margin-bottom: 1rem;
}
.recommend .recommend-nav a:first-child{ /* 第一个标语 */
  color:#FF734C;
  width: 43%;
}
.recommend .recommend-nav a:last-child{ /* 第二个标语 */
  width: 55%;
  padding-left:1.5rem;
  border-left: 1px solid #ccc;
}
.recommend .product{
  overflow: auto; /* 内容过多时自动生成滑动浏览 */
  font-size:0.8rem;
  padding-bottom: 0.4rem;
}
.recommend .recommend-tab{ /* 推荐商品栏 */
  display: flex;
}
.recommend .recommend-tab li{ /* 推荐商品详情 */
  margin-right: 0.8rem;
  width: 5rem;
}
.recommend .recommend-tab li img{ /* 推荐商品图片 */
  border:1px solid #ddd;
  margin-bottom:0.2rem;
}
.recommend .recommend-name{ /* 推荐商品名称 */
  margin-top:0.2rem;
  text-overflow:ellipsis; /* 文本溢出是省略号代替 */
  white-space:nowrap; /* 文本不换行 */
  overflow:hidden; /* 文字溢出时剪切多余内容 */
}
</style>