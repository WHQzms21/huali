<template>
  <div>
    <!-- 标题 -->
    <div id="modetitle"><p>一秒选花</p></div>
    <!-- 首页商品导航一楼 -->
    <ul class="scene-list">
      <li v-for="(scene,index) in scene1" :key="index">
        <a href="javascript:;">
          <img v-lazy="scene.pic">
          <span>{{scene.title}}</span>
        </a>
      </li>
    </ul>
    <!-- 首页商品导航二楼 -->
    <ul class="scene-list">
      <li v-for="(scene,index) in scene2" :key="index">
        <a href="javascript:;">
          <p class="scene-list-title">{{scene.title}}</p>
          <img v-lazy="scene.pic">
        </a>
      </li>
    </ul>
    <!-- 首页商品导航三楼 -->
    <ul class="scene-list">
      <li>
      <a class="scene-list-item" href="javascript:;">
        <p class="scene-list-name">热销榜</p>
        <p class="scene-list-desc">集万千宠爱</p>
        <img src="../../assets/home/m_home_ranklist2.png">
      </a>
      </li>
      <li>
      <a class="scene-list-item" href="javascript:;">
        <p class="scene-list-name">特价专区</p>
        <p class="scene-list-desc">超值好货</p>
        <img src="../../assets/home/m_home_special2.png">
      </a>
      </li>
    </ul>
    <!-- 首页商品导航四楼 -->
    <ul class="scene-list">
      <li v-for="(scene,index) in scene4" :key="index">
        <a href="javascript:;">
          <img v-lazy="scene.pic">
          <span class="scene-item-pange">{{scene.title}}</span>
        </a>
      </li>
    </ul>
  </div>
</template>
<script>
export default {
  data(){
    return{
      // 商品首页一楼导航数组
      scene1:[
        {title:'送恋人',pic:require('../../assets/home/m_home_use_lover.png')},
        {title:'送长辈',pic:require('../../assets/home/m_home_use_elder.png')},
        {title:'送朋友',pic:require('../../assets/home/m_home_use_friends.png')} ],
      // 商品首页二楼导航数组
      scene2:[
        {title:'生日祝福',pic:require('../../assets/home/m_home_use_birthday2.png')},
        {title:'表白求婚',pic:require('../../assets/home/m_home_use_profess2.png')},
        {title:'开业商务',pic:require('../../assets/home/m_home_use_business2.png')},
        {title:'周年纪念',pic:require('../../assets/home/m_home_use_anniversary2.png')} ],
      // 商品首页四楼导航数组
      scene4:[
        {title:'新品来袭',pic:require('../../assets/home/m_home_category_new2.png')},
        {title:'品味之选',pic:require('../../assets/home/m_home_category_quality2.png')},
        {title:'设计师臻选',pic:require('../../assets/home/m_home_category_you2.png')} ],
      // 空
    }
  }
}
</script>
<style scoped>

/* 商品标题 */
#modetitle{
  padding-left: 1rem;
  margin-top:1rem;
}
#modetitle p{
  border-left: 3px solid #666;
  padding-left:0.5rem;
}
/* 首页商品导航一楼 */
.scene-list{
  display: flex; /* 同一弹性布局 */
  font-size:0.9rem;
  text-align: center; /* 行内元素居中 */
  margin-top:0.5rem; /* 上边距 */
  padding:0 0.3rem;
}
.scene-list li{
  margin:0.15rem;
  position: relative; /* 设置定位标杆 */
}
.scene-list span{
  position: absolute;/* 一楼文字浮动在图片底部 */
  bottom: 0.6rem;
  left: 0;
  right: 0;
  color:white;
  z-index: 1;
}
.scene-list img{ /* 设置图片为当前父元素100% */
  width: 100%;
}
/* 首页商品导航二楼 */

.scene-list .scene-list-title{ /* 设置二楼文字浮动位置 */
  position: absolute;
  top:0.6rem;
  left:1.05rem;
  color:#2c3e50;
}

/* 首页商品导航三楼 */
.scene-list .scene-list-item{ /* 三楼图片布局 */
  display: block;
  text-align: left;
  color:#2c3e50;
  border:1px solid #eee;
}
.scene-list .scene-list-item .scene-list-name { /* 三楼第一排文字位置 */
  position: absolute;
  left: 0.6rem;
  top:0.4rem;
}
.scene-list .scene-list-item .scene-list-desc { /* 三楼第二排文字位置 */
  position: absolute;
  left: 0.6rem;
  top:1.6rem;
  font-size:0.8rem;
  color:#888;
}
/* 首页商品导航四楼 */
.scene-list .scene-item-pange{ /* 四楼文字位置及背景色 */
  background:rgba(35,38,40,0.8);
  padding:0.25rem 0;
  bottom:0;
  font-size:0.8rem;
}
</style>