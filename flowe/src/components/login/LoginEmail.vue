<template>
<div>
  <!-- reg -->
  <div  id="routerview">
    <!-- 邮箱注册 -->
    <div>
      <div class="inputname">
        <input class="inputname-item" type="text" v-model="uemail" placeholder="请输入邮箱或手机号" @focus="change" @input="changelist" @blur="modalsow()">
        <img v-show="clear" @click="clearName" class="inputname-pic" src="@/assets/login/clear.png">
      </div>
      <div class="login-pwd">
        <input :type="inputpwd" placeholder="请输入登录密码" v-model="upwd">
        <!-- 密码显示隐藏按钮 -->
        <div class="login-pwd-icon">
          <img @click="showpwd" :src="pwdPic">
          <span class="login-pwd-right">忘记密码</span>
        </div>
      </div>
    </div>
    <div class="login">
      <span class="login-btn" @click="login">登录</span>
    </div>
  </div>
</div>
</template>
<script>
export default {
  data(){
    return{
      inputpwd:'password', //密码框
      pwdPic: require("@/assets/login/hide.png"),  //密码显示按钮
      upwd:'',
      uemail:'',
      clear:false
    }
  },
  methods:{
    changelist(){
      var el = event.currentTarget.value;
      if(el != ""){ //如果输入框内容不为空，显示清空按钮
        this.clear = true;
      }else if(el == ""){ //如果输入框内容不为空，显示清空按钮
        this.clear = false;
      }
    },
    // 监听input内容事件
    change(){
      var el = event.currentTarget.value;
      if(el != ""){ //如果输入框内容不为空，显示清空按钮
        this.clear = true;
      }
    },
    clearName(){ //清空按钮
      this.uemail = "";
    },
    modalsow(){ //输入框失去焦点事件
      setTimeout(() => {
        this.clear = false;
      }, 50);
    },
    login(){ //登录
      var reg = /^(\w-*\.*)+@(\w-?)+(\.\w{2,})+$/; //邮箱验证
      if(!this.uemail){ //拦截空邮箱
        this.$toast("邮箱不能为空")
        return;
      }else if(!this.upwd){//拦截空密码
        this.$toast("密码不能为空")
      }
      if(!reg.test(this.uemail)){ //验证邮箱格式
        // this.$toast("邮箱格式不正确")
        // return;
      }
      var user = {
        uname : this.uemail, //获取邮箱
        upwd : this.upwd //获取密码
      }
      this.axios.post('/login',user) //发送ajax请用户登录
      .then(res=>{
        if(res.data.code == 1){ //获取服务器数据，判断用户登录
          this.$toast('登录成功'); //code为1，登录成功
          sessionStorage.setItem('uname',user.uname) //将用户名保存到本地，存储登录状态，退出网页自动清空
          this.$router.back(-1)
        }else if(res.data.code == -1){ //code为-1，用户名或密码错误
          this.$toast("用户名或密码错误")
        }
      })
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
        return;
      }
    }
  }
}
</script>
<style scoped>

/* 用户名 */
.login-pwd{
  border-bottom: 1px solid #ddd;
  width: 100%;
  display: flex;
  align-items: center;
  justify-content: space-between;
}
.inputname{
  border-bottom: 1px solid #ddd;
  background-color: white;
  width: 100%;
  display: flex;
  align-items: center;
  justify-content: space-between;
}
.inputname-pic{
  width: 1.2rem;
  margin-right:1rem;
}
input{
  border:none;
  height: 3rem;
  line-height: 3rem;
  width: 65%;
  font-size:0.9rem;
  outline:medium;
}
.inputname-item{
  width: 80;
}
/* 密码显示隐藏按钮 */
.login-pwd-icon{
  display: flex;
  margin-right: 0.5rem;
}
.login-pwd-icon img{
  height: 1.3rem;
}
/* 忘记密码 */
.login-pwd-right{
  font-size:0.8rem;
  margin-left: 0.8rem;
  padding-left: 0.3rem;
  border-left: 2px solid #ccc;
}
/* 登录按钮 */
.login{
  text-align: center;
  margin-top:3.5rem;
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
</style>