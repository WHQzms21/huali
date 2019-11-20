<template>
<div id="contentiner">
    <header class="headerbar">
        <div class="headerbar-back">
            <img  @click="$router.back(-1)" src="@/assets/img/back.png" class="img_i">
        </div>
        <div class="header-content">
            <input placeholder="搜索鲜花、蛋糕、礼品" class="title1">
            <div class="header-content-left">
                <img src="@/assets/img/seek.png" class="img_i">
            </div>
        </div>
    </header>
    <!-- 主体 -->
    <!-- 左侧 -->
    <div class="catebox">
        <aside class="catebox-menu">
            <div class="catebox-menu-item active"  @click="btn(index)" v-for="(item,index) in list" :key="index">
                <a href="javascript:;" :style="[{'color':item.show ? '#FF734C' : '#000'},{borderLeft:item.show ? '2px solid #FF734C' : '2px solid #fff'}]" class="catebox-menu-item-link">{{item.left}}</a>
            </div>
        </aside>
    <!-- 右侧 -->
    <div class="catebox-details" v-for="(item,index) in list" :key="index"  v-show="item.show">
        <div class="catebox-details-mode active" id="hot">
            <header class="catebox-details-banner">
                <a href="javascript:;" class="navigation" >
                    <img :src="item.pic">
                </a>
            </header>
            <div class="catebox-details-body">
                    <div class="catebox-details-item" v-for="(item,index) in list1" :key="index">
                        <a href="javascript:;" class="navigation">
                            <img :src="'http://127.0.0.1:4000/'+item.pic">
                            <p class="catebox-details-item-desc">{{item.title}}</p>
                        </a>
                    </div>
            </div>
        </div> 
    </div>
    </div>
    <!-- 鲜花页 -->
    <!-- 底部导航栏 -->
    <FooterNav></FooterNav>
</div>    
</template>
<script>

export default {
data(){
    return {
    list:[
        {left:"热门推荐",show:true,pic:require('@/assets/img/list1.png')},
        {left:"鲜花",show:false,pic:require('@/assets/img/list2.png')},
        {left:"永生花",show:false,pic:require('@/assets/img/list3.png')},
        {left:"蛋糕",show:false,pic:require('@/assets/img/list4.png')},
        {left:"特色礼品",show:false,pic:require('@/assets/img/list5.png')},
        {left:"礼蓝",show:false,pic:require('@/assets/img/list6.png')},
        {left:"绿植花卉",show:false,pic:require('@/assets/img/list7.png')}
    ],
    list1:[], //商品数组 
    productList:[]
    }
},
created(){
    this.product()
},
methods:{
    btn(index){
        var list = this.list;
        for(var i= 0 ;i<list.length;i++){
            this.list[i].show = false;
        }
        this.list[index].show = true;
        // 切换商品
        this.list1 = []
        for(var j=0; j<this.productList.length;j++){
            if(this.productList[j].lid == index+1){
                this.list1.push(this.productList[j])
            }
        }
    },
    product(){ //获取商品数据
        this.axios.get('/category')
        .then(res=>{
            this.productList = res.data //将返回的商品数据保存到list1
            for(var j=0; j<this.productList.length;j++){
            if(this.productList[j].lid == 1){
                this.list1.push(this.productList[j])
            }
        }
        })
        }
    }
}
</script>
<style scoped>
.headerbar{
    display: flex;
    justify-content: space-around;
    box-sizing: border-box;
    background: #fff;
}
.headerbar-back{
    width: 3rem;
    height: 3rem;
    line-height: 3rem;
}
.navigation{
    display: block
}
a{
    text-decoration: none;
    color:inherit;
    outline: none;
}
.img_i{
    width: 2rem;
    height: 2rem;
}
.header-content{
    display: flex;
    justify-content: space-between;
    align-items: center;
    width: 85%;
}
.iconfont-arrow-left{
    content:"\e639";
}
.header-content-left{
    width: 2.57142857rem;
    height: 2.57142857rem;
    line-height: 2.57142857rem;
    text-align: center;
}

.title1{
    width: 90%;
    border:none;
    padding:0.7rem;
    border-radius: 2.5rem;
    background-color:#eee;
    outline:medium;
}
.catebox{
    background-color: white;
    border:1px solid #eee;
    display: flex;
    justify-content: space-between;
}
.catebox-menu{
    width: 20%;
    border-right: 1px solid #E9ECF0;
    text-align: center;
}

.catebox-menu-item-link{
    display: block;
    margin:1.5rem 0;
    padding:0.5rem 0;
    border-left: 2px solid tomato;
}
.catebox-details{
    box-sizing:border-box;
    max-width: 80%;
}
.catebox-details-mode.active{
    display: block;
}
.catebox-details-mode{
    display: none;
    padding: 0.8rem 0.8rem 3rem;
}
.catebox-details-banner{
    height:7rem;
    overflow: hidden;
    margin-bottom:  0.8rem;
}
.catebox-details-banner>.navigation{
    position: relative;
    display: block;
    height:7rem;
    width:100%;
}
img{
    width:100%;
    vertical-align: middle;
}
.catebox-details-body{
    padding: 0.57142857rem 0.28571429rem;
    border-radius: 0.14285714rem;
    margin-bottom: 0.85714286rem;
    box-shadow: 0px 2px 6px 0px #e9ecf0;
    height:427.88px;
}
.catebox-details-item{
    float: left;
    width:33.33333333%;
    height:102.69px;
    padding: 0.57142857rem 0;
}
.catebox-details-item > .navigation{
    text-align: center;
}
.navigation{
    display: block;
}
.catebox-details-item > .navigation > img{
    height: 4.5rem;
    width: 4.5rem;
    border-radius: 100%;
    overflow: hidden;
}
.catebox-details-item > .navigation > p{
    font-size: 0.85714286rem;
    font-weight: 300;
    line-height: 1.33333333;
    max-width: 6em;
    margin: 0.57142857rem auto 0;
    color: #232323;
    overflow: hidden;
    -o-text-overflow: ellipsis;
    text-overflow: ellipsis;
    white-space: nowrap;
}


</style>
