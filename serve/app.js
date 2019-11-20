
// 2：将四个模块引入到当前程序
const express = require("express");
const mysql = require("mysql");
const cors = require("cors");
const session = require("express-session");
const bodyParser=require("body-parser");//引入body-parser中间件
// 3：创建数据库连接池
var server = express();
server.use(bodyParser.urlencoded({extended:true}))
server.use(bodyParser.json())
var pool = mysql.createPool({
  host:"127.0.0.1", //数据库地址
  user:"root",      //用户名
  password:"",      //数据库密码
  port:3306,        //数据库端口
  database:"huali",    //库名
  connectionLimit:15,  //15个连接
  multipleStatements: true
})

 
// 4：配置跨域模块
//   允许那个程序跨域访问服务器
//   脚手架：8080
//   服务器：4000

server.use(cors({
  //允许程序列表
  origin:["http://127.0.0.1:8080","http://localhost:8080"],
  credentials:true  //每次请求需要验证
}))
// 5：配置session模块
server.use(session({
  secret:"64位字符串",   //安全字符串
  resave:true,           //请求时更新数据
  saveUninitialized:true  //保存初始数据
}))
// 6：配置项目静态目录 Public
server.use(express.static("public"))
// 7：常见express对象绑定4000端口
server.listen(4000);


// // 功能五：添加购物车
// server.post("/addCart",bodyParser.json(),(req,res)=>{
//   // 1：查询购物车里是否有该类商品
//     //创建查询sql语句
//     var sql = `SELECT lid FROM flowe_cart WHERE lid = ${lid} AND uid = ${uid}`
//     pool.query(sql,(err,result)=>{
//     if(err)throw err;
//     // 2：如果有
//     if(result.length > 0){
//     // 3：数量加一
//     var sql1 = `UPDATE flowe_cart SET count=count+1,total=total+${price} WHERE lid=${lid} AND uid=${uid}`;
//     pool.query(sql1,(err,result)=>{
//       if(err) throw err;
//     })
//     // 返回添加成功
//     res.send({code:1})
//     // 4：如果没有
//     }else if (result.length == 0){
//     // 5：添加该商品至购物车
    
//       var sql2 = "INSERT INTO flowe_cart (uid,lid,lname,price,img,count,total) VALUES(?,?,?,?,?,?,?)";
//       pool.query(sql2,[uid,lid,lname,price,img,1,price],(err,result)=>{
//         if(err) throw err;
//       })
//       res.send({code:1})
//     }
//   })
// })
// 功能一用户注册模块
server.post('/reg',(req,res)=>{
  // 获取用户名和密码
  var uemail = req.body.uemail;
  var upwd = req.body.upwd;
  // 创建sql语句
  var sql = "SELECT user_name FROM huali_user WHERE user_name = ?"
  pool.query(sql,[uemail],(err,result)=>{
    if(err) throw err;
    if(result.length>0){
      return res.send({code:-2});
    }else{
      var sql1 = "INSERT INTO huali_user ( user_name, user_pwd) VALUES (?, ?)"
      pool.query(sql1,[uemail,upwd],(err,result)=>{
        if(err) throw err;
        if(result.affectedRows>0){
          res.send({code:1})
        }
      })
    }
  })

})
//功能二：用户登录
server.post("/login",(req,res)=>{
  var uname = req.body.uname; //获取用户名
  var upwd = req.body.upwd; //获取密码
  //创建SQL语句
  var sql = "SELECT user_name , user_pwd FROM huali_user WHERE user_name = ? AND user_pwd = ?"
  pool.query(sql,[uname,upwd],(err,result)=>{
    if(err) throw err;
    if(result.length > 0){
      res.send({code:1}) //成功返回1
    }else{
      res.send({code:-1}) //失败返回-1
    }
  })
})
// 功能三：首页商品详情
server.get("/homeproduct",(req,res)=>{
  // 创建sql语句
  var sql = "SELECT * FROM huali_home_product_list WHERE sort = 'heng'";
  var sql1 = "SELECT * FROM huali_home_product_list WHERE sort = 'shu'"
  pool.query(`${sql};${sql1}`,(err,result)=>{
    if(err) throw err;
    if(result.length>0){
      res.send(result);
    }
  })
})
// 功能四：商品分类页面
server.get("/category",(req,res)=>{
  //创建SQL语句
  var sql = "SELECT * FROM huali_category;"
  pool.query(sql,(err,result)=>{
    if(err) throw err;
    if(result.length>0){
      res.send(result)
    }
  })
})




