// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue'
import App from './App'
import router from './router'
// 引入axios组件库
import VueAxios from 'vue-axios'
import axios from 'axios'
// 引入qs组件
import qs from 'qs'
// 配置服务器基础路径
axios.defaults.baseURL = 'http://127.0.0.1:4000/' ; 
// 设置数据传输格式
// axios.defaults.headers.post [ 'Content-Type' ] = 'application / x-www-form-urlencoded' ;
// 移动端自适应
import fontSize from './components/fontSize'
// 1.引入mintui组件库
import { Swipe, SwipeItem } from 'mint-ui';
import 'mint-ui/lib/style.css'
Vue.component(Swipe.name, Swipe);
Vue.component(SwipeItem.name, SwipeItem);
// 4.引入公共样式组件
import Loading from './components/loading/loading'
Vue.use(Loading)
//引入Vuex
import store from './components/store/store'
// 引入懒加载组件
import { Lazyload } from 'mint-ui';
Vue.use(Lazyload);

// 注册为全局
Vue.use(VueAxios,axios);//全局注册axios
Vue.prototype.$qs = qs

//将存储对象添加Vue对象
Vue.config.productionTip = false
/* eslint-disable no-new */
new Vue({
  el: '#app',
  router,
  components: { App },
  store,
  template: '<App/>'
})
