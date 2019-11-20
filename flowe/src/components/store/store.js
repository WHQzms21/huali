import Vue from 'vue'
import Vuex from 'vuex'
Vue.use(Vuex)
//创建存储对象
var  store = new Vuex.Store({ 
  state:{ ////全局可访问数据对象
    // 购物车数据保存在本地
    cart:localStorage['cart'] ? JSON.parse(localStorage['cart']) : [],
    total: 0, //商品总价
    moren:true,
    totalCount:0 //选中商品总数
  },
  getters:{ //监听购物车列表
    // 购物车列表
    cartList(state){
      // 当购物车列表变化时，将数据存储到cart中,JSON.stringify
      localStorage.setItem("cart",JSON.stringify(state.cart));
      return state.cart //返回购物车数据
    },
    // 选中商品的总价格
    productTotal(state){
      var total = 0; // 创建一个变量保存总价
      state.cart.forEach( item => { // 遍历购物车中选中商品的价格和数量
        if(item.seleced){ // 如果商品是选中状态
          total += item.count * item.price //累加选中商品价格乘以数量
        }
      })
      return state.total = total; //将累加结果返回给state中总价格 
    },
    allCount(state){ //选中商品总个数
      var Count = 0// 创建变量保存总数
      state.cart.forEach(item =>{ // 遍历购物车，查询所有选中商品
        if(item.seleced){ //如果商品选中 
          Count += item.count; //累加该商品数量
        }
      }) 
      return state.totalCount = Count; 
    }
  },
  mutations:{ 
    // 添加商品到购物车
    addProduct(state,data){
      // 获取商品数据
      // 创建一个对象保存商品数据
      var datas = { //传入的数据
        productId : data.product_id, // 商品lid
        productName : data.product_name, // 商品名称
        price : Number(data.product_price), // 商品价格
        count : 1, // 商品数量
        seleced : true, // 商品选中转态
        productPic : data.product_pic // 商品图片
      }
      // 判断购物车中是否有该商品
      var index = state.cart.findIndex(item =>{ //遍历数组，如果有返回商品id，没有返回-1
        return item.productId == data.product_id;
      })
      // 判断index值
      if(index == -1){ //如果index = -1
        state.cart.push(datas) //添加商品信息到购物车
      }else{ // 否则该商品数量加一
        state.cart[index].count++
      }
    },
    // 修改商品数量
    // 商品数量加一
    addCartCount(state,productId){ // 获取商品id
      // 遍历数组查询与获取的商品id匹配的商品信息
      var index = state.cart.findIndex(item =>{ //创建变量保存遍历结果
        return productId == item.productId //遍历到查询到匹配商品
      })
      return state.cart[index].count++ //匹配商品数量加1
    },
    // 商品数量减一
    jianCartCount(state,productId){ //获取商品id
      var index = state.cart.findIndex(item => { // 创建变量保存查询结果
        return item.productId  ==  productId// 循环遍历数组，查询匹配商品
      })
      if(state.cart[index].count <= 1){ //如果该商品数量小于等于1
        return state.cart[index].count = 1; //返回该商品数量为1
      }else{
        return state.cart[index].count--; //否则商品数量减一
      }
    },
    // 购物车商品单选
    selectProduct(state,productId){ //获取商品id，遍历数组
      var index = state.cart.findIndex(item => { // 创建变量保存遍历结果
        return item.productId == productId
      })
      state.cart[index].seleced = !state.cart[index].seleced
    },
    // 删除商品
    delProduct(state,productId){ //获取商品id，遍历数组
      var index = state.cart.findIndex(item => { // 创建变量保存遍历结果
        return item.productId == productId
      })
      return state.cart.splice(index,1);
    }
  },
  actions:{ //异步触发mutations内的方法
    addProduct({commit},data){ //添加商品
      commit('addProduct',data)
    },
    addCartCount({commit},productId){ //商品数量加一
      commit('addCartCount',productId)
    },
    jianCartCount({commit},productId){ // 商品数量减一
      commit('jianCartCount',productId)
    },
    selectProduct({commit},productId){ // 选中商品
      commit('selectProduct',productId)
    },
    delProduct({commit},productId){ //删除商品
      commit('delProduct',productId)
    }
  }
}) 

export default store;