<template>
  <div class="inputname">
    <input class="inputname-item" type="text" v-model="uname" :placeholder="placeholder" @focus="change" @input="changelist" @blur="modalsow()">
    <img v-show="clear" @click="clearName" class="inputname-pic" src="@/assets/login/clear.png">
  </div>
</template>
<script>
export default {
  props:['placeholder'],
  data(){
    return{
      clear:false, //清空按钮控制
      uname:'' //输入框内容
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
      this.$emit('regName',this.uname)
      console.log(this.uname)
    },
    // 监听input内容事件
    change(){
      var el = event.currentTarget.value;
      if(el != ""){ //如果输入框内容不为空，显示清空按钮
        this.clear = true;
        
        
      }
    },
    clearName(){ //清空按钮
      this.uname = "";
    },
    modalsow(){ //输入框失去焦点事件
      setTimeout(() => {
        this.clear = false;
      }, 50);
    }
  },
}
</script>
<style scoped>
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
.inputname-item{
  border:none;
  height: 3rem;
  line-height: 3rem;
  width: 65%;
  font-size:0.9rem;
  outline:medium;
}
</style>