<template>
    <div>
        <div class="main">
            <div class="emptycart">
                <img src="@/assets/img/11.png"  class="img">
                <p class="text">这里什么都没有呀...</p>
            </div>
            <div class="guess">
                <div class="guess-title">猜你喜欢</div>
                <div class="guess-list">
                    <div class="guess-item" @click="btn" v-for="(item,i) of list" :key="i">
                        <a href="javascript:;">
                            <div class="guess-item-img">
                                <img v-lazy="item.imgs" class="show_img">
                            </div>
                            <div class="guess-item-detail">
                                <div class="guess-item-info">
                                    <span class="guess-item-name">{{item.title}}</span>
                                </div>
                                <div class="guess-item-price">{{item.price}}</div>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="guess-bottom">
                    <span>已经到底了哦</span>
                </div>
            </div>
        </div>
    </div>
</template>
<script>
export default {
    data(){
        return{
            list:[
                {imgs:require("@/assets/img/2.jpg"),
                title:"一往情深.精品玫瑰礼盒:19枝红玫瑰，勿忘我0.1扎",price:"¥239"},
                 {imgs:require("@/assets/img/3.jpg"),
                title:"一往情深.精品玫瑰礼盒:19枝红玫瑰，勿忘我0.1扎",price:"¥368"},
                 {imgs:require("@/assets/img/4.jpg"),
                title:"一往情深.精品玫瑰礼盒:19枝红玫瑰，勿忘我0.1扎",price:"¥139"},
                 {imgs:require("@/assets/img/5.jpg"),
                title:"一往情深.精品玫瑰礼盒:19枝红玫瑰，勿忘我0.1扎",price:"￥539"},
                 {imgs:require("@/assets/img/6.jpg"),
                title:"一往情深.精品玫瑰礼盒:19枝红玫瑰，勿忘我0.1扎",price:"¥138"},
                 {imgs:require("@/assets/img/7.jpg"),
                title:"一往情深.精品玫瑰礼盒:19枝红玫瑰，勿忘我0.1扎",price:"¥202"},
            ],
        }
    },
    methods:{
        btn(){
            this.$router.push("/detail")
        }
    }
}
</script>
<style scoped>
    .headerbar {
        display: flex;
        height: 3.14285714rem;
        line-height: 3.14285714rem;
        background: #fff;
    }
    .headerbar-left{
        text-align: left;
        width: 6.28571429rem;
        height: 3.14285714rem;
        font-size: 0;
    }
    .headerbar-left > .navigation{
        display: inline-block;
        width: 3.14285714rem;
        height: 3.14285714rem;
        text-align: center;
    }
    .imgs{
        width:30px; 
        padding:10px; 
    }
    .headerbar-center{
        flex: 1;
        max-width: calc(100% - 12.57142857rem);
        text-align: center;
    }
    .headerbar-content{
        font-size: 1.14285714rem;
        overflow: hidden;
        text-overflow: ellipsis;
        white-space: nowrap;
    }
    p{
        margin: 0;
    
    }
    .main .emptycart{
        border-top: 1px solid #E9ECF0;
        background-color: #fff;
        padding: 3.14285714rem 0 2.28571429rem;
        text-align: center;
    }
    .main .emptycart img.img{
        width: 7.14285714rem;
        height: 7.14285714rem;
    }
    img {
        width: 100%;
        vertical-align: middle;
    }
    .main .emptycart p.text{
        margin-top: 1.14285714rem;
        color: #232628;
        font-size: 1rem;
    }
    .main .guess{
        margin-top: 0.5rem;
        padding-bottom: 3.5rem;
        background-color: #fff;
    }
    .main .guess-title{
        height: 4rem;
        font-size: 1.14285714rem;
        color: #232628;
        padding: 0 1.14285714rem;
        line-height: 4rem;
        text-align: left;
    }
    .main .guess-list{
        padding: 0 1.2%;
        text-align: left;
        display: flex;
        flex-wrap: wrap;
    }
    .main .guess-item{
        width: 48.08743169%;
        margin: 0 0.93333333% 0.57142857rem;
        border-radius: 0.28571429rem;
        overflow: hidden;
        box-shadow: 0px 4px 6px 0px #dee2e5;
    }
   .main .guess-item-detail{
       height: 3.71428571rem;
       padding: 0.42857143rem 0.57142857rem;
   }
   .main .guess-item-detail .guess-item-info{
       font-size: 0.85714286rem;
        color: #232628;
        overflow: hidden;
        text-overflow: ellipsis;
        white-space: nowrap;
   }
   .main .guess-item-detail .guess-item-price{
       margin-top: 0.42857143rem;
        font-size: 1rem;
        color: #FF734C;
   }
   .main .guess-bottom{
         height: 2.57142857rem;
        margin-top: 0.14285714rem;
        text-align: center;
        font-size: 0.85714286rem;
        line-height: 2.57142857rem;
        color: #71797F
   }
</style>
