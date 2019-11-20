<template>
<div>
  <HeaderNav></HeaderNav>
  <div class="main">
    <!-- 用户登录模块 -->
    <div class="userinfo">
      <div class="notlogin" v-if="userform.show">
        <p>Hi,欢迎来到花礼网</p>
        <p class="notlogin-gologin">
          <router-link to="/login">登录/注册</router-link>
        </p>
      </div>
      <div class="user" v-if="userform.hide">
        <img src="@/assets/me/user.jpg">
        <div class="user-name">
          <p>{{user_name}}</p>
          <span class="user-vip">注册会员</span>
        </div>
      </div>
    </div>
    <!-- 我的订单 -->
    <div class="panel">
      <div class="panel-header">
        <p class="panel-header-left">我的订单</p>
        <p class="panel-header-right">全部订单 <b>&gt;</b></p>
      </div>
      <!-- 订单内容 -->
      <ul class="panel-body">
        <li class="order" v-for="(order,index) in order" :key="index">
          <img :src="order.pic">
          <p>{{order.title}}</p>
        </li>
      </ul>
    </div>
    <!-- 我的权益内容 -->
    <div class="panel-body">
      <div class="linkbox" v-for="(me,index) in me" :key="index">
        <img :src="me.pic">
        <p>{{me.title}}</p>
      </div>
    </div>
    <!-- 帮助/关于 -->
    <div class="panel-body">
      <div class="linkbox" v-for="(help,index) in help" :key="index">
        <img :src="help.pic">
        <p>{{help.title}}</p>
      </div>
    </div>
    <button @click="quit">退出</button>
  </div>
  <FooterNav></FooterNav>
</div>
</template>
<script>
export default {
  data(){
    return{
      userform:{
        show:true,
        hide:false
      },
      user_name:'',
      // 我的订单数组
      order:[
        {title:"待付款",pic:require('@/assets/me/myinfo_pendingpay.png')},
        {title:"待付款",pic:require('@/assets/me/myinfo_distribution.png')},
        {title:"待付款",pic:require('@/assets/me/myinfo_evaluation.png')}
      ],
      // 权益内容
      me:[
        {title:'优惠券',pic:require('@/assets/me/youhui.png')},
        {title:'权益卡',pic:require('@/assets/me/card.png')},
        {title:'余额',pic:require('@/assets/me/balance.png')},
        {title:'会员积分',pic:require('@/assets/me/addr.png')},
        {title:'收货地址',pic:require('@/assets/me/remind.png')},
        {title:'生日纪念提醒',pic:require('@/assets/me/collect.png')},
        {title:'我的收藏',pic:require('@/assets/me/record.png')},
        {title:'浏览记录',pic:require('@/assets/me/record.png')}
      ],
      //帮助/设置
      help:[
        {title:'联系客服',pic:require('@/assets/me/kefu.png')},
        {title:'帮助中心',pic:require('@/assets/me/help.png')},
        {title:'关于花礼',pic:require('@/assets/me/guanyu.png')},
        {title:'设置',pic:require('@/assets/me/set.png')},
      ]
    }
  },
  created(){
    this.user()
  },
  methods:{
    user(){
      var user_name = sessionStorage.getItem('uname');
      if(user_name != null){
        this.user_name = user_name
        this.userform = {show:false,hide:true}
      }else{
        this.userform = {show:true,hide:false}
      }
    },
    quit(){
      sessionStorage.removeItem("uname");
      this.user()
    }
  } 
}
</script>
<style scoped>
/* 用户登录转态 */
.user{
  display: flex;
  align-items: center;
}
.user img{
  height: 4rem;
  border-radius: 50%;
  border:1px solid white;
  margin-right: 1.5rem;
}
.user-name{
  font-size:1.1rem;
  text-align: center;
}
.user-vip{
  background-color:#FE6600;
  border-radius: 1rem;
  font-size:0.9rem;
  margin-top:0.3rem;
  padding:0.2rem 0.6rem;
}
/* 我的订单 */
.panel{
  background-color:white;
  border-radius: 0.3rem;
  box-shadow: 0 0.3rem 0.5rem 0 #ddd;
}
.panel .panel-header{  /* 订单头部 */
  display: flex;
  padding:0.8rem 1rem;
  justify-content: space-between;
  border-bottom: 1px solid #ddd;
}
.panel-header-right{ /* 订单左侧 */
 font-size:0.9rem;
}
.panel-body{ /* 公共样式弹性布局 */
  display: flex;
  justify-content: space-around;
  padding: 0.5rem 0;
  background-color:white;
  margin-top:0.4rem;
  flex-wrap: wrap;
}
.panel .order{ /* 订单内容 */
  text-align: center;
  font-size:0.9rem;
}
.order img{ /* 我的订单内图片 */
  height: 2.3rem;
}
/* 我的权益内容 */
.linkbox{
  padding: 1rem 0;
  text-align: center;
  font-size:0.8rem;
  width: 25%;
}
.linkbox img{
  width: 1.5rem;
}
/* 用户登录模块 */
.userinfo{
  display: flex;
  color:white;
  justify-content: center;
  align-items: center;
  height: 8rem;
}
.notlogin{ /* 用户未登陆 */
  text-align: center;
  font-size: 0.9rem;
}
.notlogin-gologin{ /* 登录/注册按钮 */
  background-color: white;
  color:black;
  padding:0.4rem 0.5rem;
  font-size: 1rem;
  margin-top:0.3rem;
  border-radius: 1rem;
}
/* 我的页面主体 */
.main{
  /* 背景 */
  background-image: url('../../assets/me/backgroundv3.png');
  background-repeat: no-repeat; /* 只显示一次 */
  background-size:100% 9rem; /* 背景横向铺满，竖向9rem */
  background-position: top center;
  height: 18rem;
  padding:0 0.5rem ;
}
</style>