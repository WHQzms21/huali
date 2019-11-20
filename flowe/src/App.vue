<template>
  <div id="app">
    <router-view/>
  </div>
</template>

<script>
export default {
  name: 'App'
}
</script>

<style>
#app {
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  color: #2c3e50;
  background: #E9ECF0 !important;
}

/* 页面底色 */
#home , .product{
  background-color: white;
}
/* 样式清空 */
 div , p , ul , li , h3 , a , input , span{
  margin:0;
  padding:0;
  box-sizing: border-box;
}
/* a标签样式清空 */
a{
  text-decoration: none;
  color:black;
}
/* 取出ul标记 */
ul{
  list-style-type: none;
}
/* 清除body样式,设置浅色背景,限制最大视口大小 */
body{
  margin:0 auto;
  padding:0;
  width: 100%;
  max-width: 750px;
  background: #E9ECF0;
}
</style>
