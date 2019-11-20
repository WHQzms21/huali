<template>
<div class="settlement">
  <!-- 页头 -->
  <HeaderNav></HeaderNav>
  <!-- 收货人 -->
  <div class="form-group">
    <p class="form-group-left">收货人</p>
    <!-- 收货地址 -->
    <div class="form-group-right">
      <div class="form-group-item"><img src="@/assets/me/addAddr.png"> <b>请填写收货地址</b></div>
      <img src="@/assets/me/xiaoyu.png" class="form-group-pic">
    </div>
  </div>
  <!-- 分界线 -->
  <div class="boundary"></div>
  <!-- 订单详情内容 -->
  <ul class="form-label">
    <li class="form-label-info">
      <p class="form-label-auto">订购人信息</p>
      <div class="form-label-item">
        <p>请填写</p>
        <img src="@/assets/me/xiaoyu.png" class="form-group-pic">
      </div>
    </li>
    <li class="form-label-info">
      <p class="form-label-auto">送达日期</p>
      <div  class="form-label-item">
        <p>请选择</p>
        <img src="@/assets/me/xiaoyu.png" class="form-group-pic"> 
      </div>
    </li>
    <li class="form-label-info">
      <p class="form-label-auto">贺卡留言</p>
      <div class="form-label-item">
        <p>填写即赠精美贺卡</p>
        <img src="@/assets/me/xiaoyu.png" class="form-group-pic">
      </div>
    </li>
    <!-- 备注选项卡 -->
    <li class="form-label-info" id="hiddenboxctlr">
      <p class="form-label-auto">备注/优惠券/权益卡/发票</p>
      <img src="@/assets/me/xiaoyu.png" class="form-group-pic">
    </li>
  </ul>
  <Goods class="goods"></Goods>
</div>
</template>
<script>
import Goods from './Goods'
export default {
  components:{
    Goods
  }
}
</script>
<style scoped>
.goods{
  margin-top:1rem;
}
/* 订单详情 */
.form-label-info{
  display: flex;
  padding: 1rem 1rem;
  justify-content: space-between;
  border-bottom: 1px solid #ddd;
  overflow: hidden;
}
.form-label-item{ /* 订单内容 */
  display: flex;
  width: 78%;
  text-align: right;
}
.form-label-item P{
  width: 100%;
}
.form-label-auto{
  width: auto;
}
/* 主体 */
.settlement{ 
  background-color: white;
}
.form-group{  /* 收货地址 */
  display: flex;
  align-items: center;
  justify-content: space-between;
  padding:1rem 1rem;
  border-top:1px solid #ddd;
}
.form-group-left{ /* 左侧收货人 */
  padding:0.5rem 0;
  padding-right:0.5rem;
  border-right: 1px solid #ddd;
}
.form-group-right{ /* 右侧收货地址 */
  display: flex;
  width: 85%;
  justify-content: space-between
}
.form-group-item{
  display: flex;
  align-items: center;
}
.form-group-pic{
  width: 1.5rem;
  height: 1.5rem;
}
.boundary{ /* 分界线 */
  width: 100%;
  background: url('../../assets/me/boundary1.png');
  height: 1rem;
  background-size:contain;
  background-repeat: repeat-x;
}
</style>