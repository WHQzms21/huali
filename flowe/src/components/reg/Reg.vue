<template>
<div>
  <!-- 页头 -->
  <HeaderNav></HeaderNav>
  <!-- reg -->
  <div  id="routerview">
    <div class="huareg">{{qie.loginHeader}}</div>
    <!-- 手机注册 -->
    <RegPhone v-if="qie.hide"></RegPhone>
    <!-- 邮箱注册 -->
    <RegEmail v-if="qie.show"></RegEmail>
    <div class="reg_btn">
      <span @click="qiehuan">{{qie.loginTitle}}></span>
    </div>
  </div>
</div>
</template>
<script>
import RegEmail from './RegEmail'
import RegPhone from './RegPhone'
export default {
  components:{
    RegEmail,
    RegPhone
  },
  data(){
    return{
      inputpwd:'password', //密码框
      pwdPic: require("@/assets/login/hide.png"),  //密码显示按钮
      qie:{
        show:true,
        hide:false,
        loginHeader:"邮箱注册",
        loginTitle:"手机号注册"
      },
    }
  },
  methods:{
    qiehuan(){
      // 1.点击切换面板
      if(this.qie.show == true){
        this.qie = {
          show:false,
          hide:true,
          loginHeader:"手机号注册",
          loginTitle:"邮箱注册"
        }
        return;
      }
      if(this.qie.show == false){
        this.qie = {
          show:true,
          hide:false,
          loginHeader:"邮箱注册",
          loginTitle:"手机号注册"
        }
        return;
      }
    },
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
/* reg */
.huareg{
  text-align: center;
  padding-bottom: 3rem;
  font-size:1.5rem;
}
/* 注册切换按钮 */
.reg_btn{
  text-align: center;
  margin-top:3rem;
}
</style>