<template>
  <div>
    <!-- 企业团购 -->
  <div class="qiye">
    <a href="javascript:;">
    <img src="../../assets/home/m_home_qiyetuangou.png">
    </a>
  </div>
  <!-- 品牌介绍 -->
  <div class="brand">
    <h3>为什么选择我们</h3>
    <!-- 品牌介绍详情 -->
    <div class="brand-list">
      <ul>
        <li v-for="(item,index) in brand" :key="index">
          <img v-lazy="item.pic">
          <p>{{item.title}}</p>
        </li>
      </ul>
    </div>
  </div>
  <!-- 页尾 -->
  <div class="footer">
    <!-- 企业链接 -->
    <div class="footer-links">
      <a href="javascript:;" v-for="(links,index) in links" :key="index">{{links.title}}</a>
    </div>
    <!-- 服务 -->
    <div class="footer-entry">
      <div class="footer-entry-item">
        <div class="footer-entry-pic">
        <img src="../../assets/home/iphone.png">
        </div>
        <p>客户端</p>
      </div>
      <div class="footer-entry-item">
        <div class="footer-entry-pic">
        <img src="../../assets/home/sevice.png">
        </div>
        <p>客服</p>
      </div>
    </div>
    <p class="footer-title">
      注意：该网站为个认练习仿写项目，不做任何宣传，商业等用途。
      <br> 如有侵权，请联系删除！
      <br>
      联系邮箱：1655569163@qq.com
    </p>
  </div>
  </div>
</template>
<script>
export default {
  data(){
    return{
      brand:[
        {title:'获评鲜花龙头企业',pic:require('../../assets/home/m_details_brand_01.png')},
        {title:'1~3小时送花上门',pic:require('../../assets/home/m_details_brand_02.png')},
        {title:'赛事冠军花艺师团队',pic:require('../../assets/home/m_details_brand_03.png')},
        {title:'严选花材',pic:require('../../assets/home/m_details_brand_04.png')},
        {title:'12道严苛品控标准',pic:require('../../assets/home/m_details_brand_05.png')},
        {title:'500万用户信赖好评',pic:require('../../assets/home/m_details_brand_06.png')},
      ],
      links:[
        {title:'企业团购'},{title:'设计师款'},{title:'同城鲜花'},{title:'花语大全'},
        {title:'花礼优势'},{title:'勇敢爱'},{title:'常见问题'},{title:'关于我们'},
      ]
    }
  }
}
</script>
<style scoped>
/* 声明 */
.footer-title{
  font-size: 0.8rem;
  color:#666;
  margin-top:1.5rem;
  text-align: center;
  padding-bottom: 8rem;
}
/* 页尾 */
.footer{
  background-color: white;
  margin-top:0.5rem;
}
.footer-links{ /* 企业链接 */
  display: flex;
  flex-wrap: wrap;
  justify-content: space-around;
  padding:0.8rem 0;
}
.footer-links a{ /* 企业链接标签 */
  display: inline-block;
  text-align: center;
  text-decoration: none;
  width: 4.8rem;
  font-size:0.8rem;
  color:#333;
  background-color: #eee;
  margin:0.5rem 0.8rem;
  padding:0.2rem 0;
}
.footer-entry{ /* 服务 */
  display: flex;
  justify-content: space-around;
  padding:0 4.5rem;
}
.footer-entry-item{ /* 服务子标签 */
  font-size: 0.8rem;
  text-align: center;
  padding:0.2rem 0;
}
.footer-entry-pic{ /* 服务图片 */
  border-radius: 50% 50%;
  background-color: #eee;
  width: 3rem;
  height: 3rem;
  padding:0.5rem;
}
.footer-entry p{
  margin-top:0.2rem;
}
/* 品牌 */
.brand{
  background-color:white;
}
.brand h3{ /* 品牌标语 */
  text-align: center;
  padding:1rem; 
  font-weight: normal;
}
.brand-list ul { /* 品牌介绍 */
  display: flex;
  flex-wrap: wrap;
  justify-content: space-around;
}
.brand-list ul li{ /* 品牌介绍详情 */
  width: 33.3333%;
  padding:0 0.5rem;
  font-size:0.7rem;
  text-align: center;
  margin-bottom:1.5rem;
}
.brand-list img{ /* 品牌介绍图片 */
  width: 60%;
}
/* 企业团购 */
.qiye img{
  width: 100%;
}
</style>