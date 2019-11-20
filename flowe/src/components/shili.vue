<template>
  <div>
    <h3>数据</h3>
    <button @click="list">切换</button>
    <div style="fontSize:20px">{{product}}</div>
  </div>
</template>
<script>
export default {
  data(){
    return{
      // 商品数组
      product:[],
        // 空
      sf:'2',
      product1:''
    }
  },
  methods:{
    list(){
      var product = this.product;
      var list = [];
      for(var i=0; i<product.length;i++){
        console.log(product[i].lid)
        if(product[i].lid == this.sf){
          list.push(product[i])
        }
      }
      console.log(list)
    }
  }
}
</script>
