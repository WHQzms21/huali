import Vue from 'vue'
import Router from 'vue-router'
import Home from '@/components/Home'
import Shopcart from '@/components/shopcart/Shopcart'
import Me from '@/components/me/Me'
import category from '@/components/category/category'
import Login from '@/components/login/Login'
import Reg from '@/components/reg/Reg'
import Settlement from '@/components/settlement/Settlement'
import AddressEdit from '@/components/settlement/AddressEdit'

Vue.use(Router)

export default new Router({
  routes: [
    {path: '/AddressEdit', component: AddressEdit},
    {path: '/settlement', component: Settlement},
    {path: '/reg', component: Reg},
    {path: '/Login', component: Login},
    {path: '/category', component: category},
    {path: '/me', component: Me},
    {path: '/home', component: Home},
    {path: '/shopcart', component: Shopcart}
  ]
})
