<template>
<div>
  <!-- 页头 -->
  <HeaderNav></HeaderNav>
  <!-- logo -->
  <div  id="routerview">
    <div class="hualogo">
      <img src="@/assets/home/m_hualogo.png">
    </div>
    <!-- 登录用户名 -->
    <!-- 邮箱登录 -->
    <LoginEmail v-if="qie.show"></LoginEmail>
    <!-- 手机号登录 -->
    <LoginPhone v-if="qie.hide"></LoginPhone>

    <div class="login">
      <p class="login-left">
        <span to="login-phone" @click="qiehuan">{{qie.loginTitle}}></span>
        <span>
          <span @click="reg">注册></span>  
        </span>
      </p>
    </div>
    <!-- 其他登录 -->
    <div class="qita">
      <p class="qita-qq">
        <img src="@/assets/login/qq.png">
        <span>QQ</span>
      </p>
      <p class="qita-zfb">
        <img src="@/assets/login/zfb.png">
        <span>支付宝</span>
      </p>
    </div>
  </div>
</div>
</template>
<script>
import LoginEmail from './LoginEmail'
import LoginPhone from './LoginPhone'
export default {
  components:{
    LoginEmail,
    LoginPhone
  },
  data(){
    return{
      inputpwd:'password', //密码框
      pwdPic: require("@/assets/login/hide.png"),  //密码显示按钮
      qie:{
        show:true,
        hide:false,
        loginBtn:"登录",
        loginTitle:"手机短信登录"
      },
      name:'',
      upwd:''
    }
  },
  methods:{
    qiehuan(){
      // 1.点击切换面板
      if(this.qie.show == true){
        this.qie = {
          show:false,
          hide:true,
          loginBtn:"手机登录／注册",
          loginTitle:"账号密码登录"
        }
        return;
      }
      if(this.qie.show == false){
        this.qie = {
          show:true,
          hide:false,
          loginBtn:"登录",
          loginTitle:"手机短信登录"
        }
        return;
      }
    },
    showpwd(){
      if(this.inputpwd == 'text'){ //当密码框为password时显示加密文本
        this.inputpwd = 'password';
        this.pwdPic = require("@/assets/login/hide.png") ;
        return;
        }
      if(this.inputpwd == 'password'){ //当密码框为text时显示文本
        this.inputpwd = 'text';
        this.pwdPic = require("@/assets/login/show.png") ;
        return;}
    },
    reg(){
      this.$router.push('/reg')
    }
  }
}
</script>
<style scoped>
/* 页面铺满 */
#routerview{
  height: 100%;
  min-height: 100vh;
  background-color: white;
  padding: 0 1rem ;
}
/* 页头 */
.header-bar > img{ /* 页头图片 */
  width: 1.2rem;
  margin-top:0.8rem;
}
/* logo */
.hualogo{
  text-align: center;
  padding-bottom: 1.5rem;
}
.hualogo img{
  width: 50%;
  margin:1rem 0;
}
/* 登录按钮 */
.login{
  text-align: center;
  margin-top:2rem;
}
.login-btn{
  display: inline-block;
  font-size:1.3rem;
  padding:0.8rem 0;
  background-color: #ff734c;
  box-shadow: 0 4px 8px 0 #ffb6a2;
  width: 90%;
  border-radius: 2.5rem;
  color:white;
}
/* 注册 */
.login-left{
  display: flex;
  justify-content: space-between;
  padding-top:1.5rem;
  font-size: 0.9rem;
  color:#aaa;
}
/* 其他登录 */
.qita{
 display: flex;
 justify-content: center;
 margin-top:5rem;
}
.qita-qq,.qita-zfb{
  display: flex;
  align-items: center;
  font-size:0.9rem;
  width: 50%;
  justify-content: center;
}
.qita-qq img,.qita-zfb img{
  height: 1.2rem;
  margin-right: 0.5rem;
}
.qita-zfb{
  border-left: 2px solid #ccc;
}
</style>