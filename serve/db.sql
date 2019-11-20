IF NOT EXISTS CREATE DATABASE flowe;
USE flowe;

 CREATE TABLE flowe_index(
  id INT PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR (100),
  price VARCHAR (100),
  img VARCHAR (100)
)

INSERT INTO `flowe_index` VALUES('9朵玫瑰，康乃馨，向日葵','188','server/public/index/37339_0.jpg');
INSERT INTO `flowe_index` VALUES('11朵雪山粉玫瑰，9朵粉','198','server/public/index/37355_0.jpg');
INSERT INTO `flowe_index` VALUES('11朵蓝玫瑰，长形礼盒','258','server/public/index/37355_0.jpg');
INSERT INTO `flowe_index` VALUES('19支精品红玫瑰，礼盒款','185','server/public/index/36171_0.jpg');

CREATE TABLE flowe_login(
  id INT PRIMARY KEY AUTO_INCREMENT,
  uname VARCHAR (20),
  upwd VARCHAR (16)
)
INSERT INTO `flowe_login` (uname,upwd) VALUES('tom','123456');
INSERT INTO `flowe_login` (uname,upwd) VALUES('jerry','123456');
-- 首列添加自增列 id
ALTER TABLE flowe_index ADD id INT(4) NOT NULL PRIMARY KEY AUTO_INCREMENT FIRST;
UPDATE flowe_index SET img='index/37339_0.jpg' WHERE id=1;
UPDATE flowe_index SET img='index/37355_0.jpg' WHERE id=2;
UPDATE flowe_index SET img='index/36171_0.jpg' WHERE id=3;
UPDATE flowe_index SET img='index/36689_0.jpg' WHERE id=4;

-- 创建商品分类数据表
USE flowe;

CREATE TABLE flowe_list(
  id INT PRIMARY KEY AUTO_INCREMENT,
  listName VARCHAR (50)
)
-- 修改flowe_list中listName存储格式允许汉字
ALTER TABLE `flowe_list` CHANGE `listName` `listName` VARCHAR(50) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL;

INSERT INTO `flowe_list` (`id`, `listName`) VALUES (NULL, '热门推荐');
INSERT INTO `flowe_list` (`id`, `listName`) VALUES (NULL, '精美鲜花');
INSERT INTO `flowe_list` (`id`, `listName`) VALUES (NULL, '美味蛋糕');
INSERT INTO `flowe_list` (`id`, `listName`) VALUES (NULL, '浪漫组合');
INSERT INTO `flowe_list` (`id`, `listName`) VALUES (NULL, '商务典礼');
INSERT INTO `flowe_list` (`id`, `listName`) VALUES (NULL, '特别花礼');

-- 创建商品分类面板数据表
USE flowe;
CREATE TABLE flowe_listProduct(
  id INT PRIMARY KEY AUTO_INCREMENT,
  productName VARCHAR (30),
  productImg VARCHAR (100)
)CHARACTER SET gbk COLLATE gbk_chinese_ci;
-- 添加数据
INSERT INTO `flowe_listProduct` (`id`, `productName`,`productImg`) VALUES (NULL,'送爱人','list/2161.jpg');
INSERT INTO `flowe_listProduct` (`id`, `productName`,`productImg`) VALUES (NULL,'生日花束','list/2162.jpg');
INSERT INTO `flowe_listProduct` (`id`, `productName`,`productImg`) VALUES (NULL,'生日蛋糕','list/2215.jpg');
INSERT INTO `flowe_listProduct` (`id`, `productName`,`productImg`) VALUES (NULL,'儿童蛋糕','list/2220.jpg');
INSERT INTO `flowe_listProduct` (`id`, `productName`,`productImg`) VALUES (NULL,'情人节蛋糕','list/2221.jpg');
INSERT INTO `flowe_listProduct` (`id`, `productName`,`productImg`) VALUES (NULL,'花束蛋糕','list/2233.jpg');
INSERT INTO `flowe_listProduct` (`id`, `productName`,`productImg`) VALUES (NULL,'开业花篮','list/2237.jpg');
INSERT INTO `flowe_listProduct` (`id`, `productName`,`productImg`) VALUES (NULL,'开业花篮','list/2486.jpg');


USE flowe;
IF NOT EXISTS CREATE TABLE `flowe_lunbo` (
  `lid` INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
  `img1` varchar(100) DEFAULT NULL
  `img2` varchar(100) DEFAULT NULL
  `img3` varchar(100) DEFAULT NULL
  `img4` varchar(100) DEFAULT NULL
  `img5` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=gbk;
-- 添加轮播图数据
INSERT INTO `flowe_lunbo` (`img`,`img1`,`img2`,`img3`,`img4`) VALUES ('commodity/21朵粉玫瑰/lunbo.jpg','commodity/21朵粉玫瑰/lunbo1.jpg','commodity/21朵粉玫瑰/lunbo2.jpg','commodity/21朵粉玫瑰/lunbo3.jpg','commodity/21朵粉玫瑰/lunbo4.jpg');

INSERT INTO `flowe_lunbo` (`img`,`img1`,`img2`,`img3`,`img4`) VALUES ('commodity/红玫11枝满天星/lunbo.jpg','commodity/红玫11枝满天星/lunbo1.jpg','commodity/红玫11枝满天星/lunbo2.jpg','commodity/红玫11枝满天星/lunbo3.jpg','commodity/红玫11枝满天星/lunbo4.jpg');

INSERT INTO `flowe_lunbo` (`img`,`img1`,`img2`,`img3`,`img4`) VALUES ('commodity/卡罗拉红玫瑰/lunbo.jpg','commodity/卡罗拉红玫瑰/lunbo1.jpg','commodity/卡罗拉红玫瑰/lunbo2.jpg','commodity/卡罗拉红玫瑰/lunbo3.jpg','commodity/卡罗拉红玫瑰/lunbo4.jpg');

INSERT INTO `flowe_lunbo` (`img`,`img1`,`img2`,`img3`,`img4`) VALUES ('commodity/香槟/lunbo.jpg','commodity/香槟/lunbo1.jpg','commodity/香槟/lunbo2.jpg','commodity/香槟/lunbo3.jpg','commodity/香槟/lunbo4.jpg');




USE flowe;
CREATE TABLE `flowe_jianj` (
  `lid` INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
  `lname` varchar(20) DEFAULT NULL,
  `number` varchar(20) DEFAULT NULL,
  `title` varchar(20) DEFAULT NULL,
  `price` INT(4) DEFAULT NULL,
  `BigImg` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

INSERT INTO `flowe_jianj` (`lname`,`number`,`title`,`price`,`BigImg`) VALUES ('香妃','E-36560','香槟玫瑰9枝','128','commodity/香槟/36707.jpg');
INSERT INTO `flowe_jianj` (`lname`,`number`,`title`,`price`,`BigImg`) VALUES ('致美丽的你','E-36548','红玫瑰11枝','129','commodity/红枚11枝满天星/36548.jpg');
INSERT INTO `flowe_jianj` (`lname`,`number`,`title`,`price`,`BigImg`) VALUES ('浪漫告白','E-36749','卡罗拉红玫瑰11枝','168','commodity/卡罗拉红玫瑰/36749.jpg');
INSERT INTO `flowe_jianj` (`lname`,`number`,`title`,`price`,`BigImg`) VALUES ('纯美的时光','E-36707','21朵粉玫瑰','188','commodity/21朵粉玫瑰/36707.jpg');

USE flowe;
CREATE TABLE `flowe_gd` (
  `lid` INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
  `img` varchar(100) DEFAULT NULL,
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

INSERT INTO `flowe_gd` (`img`) VALUES ('gd/香槟.jpg');
INSERT INTO `flowe_gd` (`img`) VALUES ('gd/红玫瑰.jpg');
INSERT INTO `flowe_gd` (`img`) VALUES ('gd/卡罗拉.jpg');
INSERT INTO `flowe_gd` (`img`) VALUES ('gd/粉玫瑰.jpg');


USE flowe;
CREATE TABLE `flowe_sm` (
  `lid` INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
  `material` varchar(100) DEFAULT NULL,
  `pack` varchar(100) DEFAULT NULL,
  `blessing` varchar(100) DEFAULT NULL,
  `gift` varchar(100) DEFAULT NULL,
  `img` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

INSERT INTO `flowe_sm` (`material`,`pack`,`blessing`,`gift`,`img`) VALUES ('香槟玫瑰9枝，白色石竹梅适量搭配','白色薄面纸，青灰色双面牛皮纸，白绿罗纹带','你的香气，是我思念的味道，那是最独特的。9多香槟玫瑰，是天长地久的爱情，专属你我之间的真爱，无限期，永不凋零!','免费赠送贺卡，代写祝福语','commodity/21朵粉玫瑰/5mft2.jpg');
INSERT INTO `flowe_sm` (`material`,`pack`,`blessing`,`gift`,`img`) VALUES ('红玫瑰11枝，满天星围绕，栀子叶0.5扎','外层浅灰紫/香芋紫人造纸，里层白色人造单面纸，白绿粗罗纹带','很爱你，想把你捧在手心，放在心里......11枝红玫瑰，寓意一心一意。纵然途中万般风景，我的眼里只有你！','免费赠送贺卡，代写祝福语','commodity/21朵粉玫瑰/5mft2.jpg');
INSERT INTO `flowe_sm` (`material`,`pack`,`blessing`,`gift`,`img`) VALUES ('卡罗拉红玫瑰11枝、白色小雏菊4枝、银叶菊0.5扎','米白色平面纸1张、黑色条纹纸1张、酒红色丝带1米、灰包装盒','空气中弥漫着爱的味道，送你11枝红玫瑰，只因“我爱你”！','免费赠送贺卡，代写祝福语','commodity/21朵粉玫瑰/5mft2.jpg');
INSERT INTO `flowe_sm` (`material`,`pack`,`blessing`,`gift`,`img`) VALUES ('21朵粉玫瑰，搭配相思梅点缀','粉色、灰色卡纸包装，精美花结','微风伴着花香，吹来爱的气息。用一颗真心轻轻爱你，温柔的话只说给你听。','免费赠送贺卡，代写祝福语','commodity/21朵粉玫瑰/5mft2.jpg');


USE flowe;
CREATE TABLE `flowe_js` (
  `lid` INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
  `title` varchar(30) DEFAULT NULL,
  `img` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

INSERT INTO `flowe_js` (`title`,`img`) VALUES ('产品特点','');

INSERT INTO `flowe_js` (`title0`,`title1`,`title2`,`title3`,`title4`,`title5`,`img0`,`img1`,`img2`,`img3`,`img4`,`img5`) VALUES ('产品特点','角度展示','产地保证','实体配送','全国连锁','服务特色','commodity/香槟/1.jpg','commodity/香槟/2.jpg','commodity/香槟/3.jpg','commodity/香槟/4.jpg','commodity/香槟/5.jpg','commodity/香槟/6.jpg');

INSERT INTO `flowe_js` (`title0`,`title1`,`title2`,`title3`,`title4`,`title5`,`img0`,`img1`,`img2`,`img3`,`img4`,`img5`) VALUES ('产品特点','角度展示','产地保证','实体配送','全国连锁','服务特色','commodity/红玫11枝满天星/1.jpg','commodity/红玫11枝满天星/2.jpg','commodity/红玫11枝满天星/3.jpg','commodity/红玫11枝满天星/4.jpg','commodity/红玫11枝满天星/5.jpg','commodity/红玫11枝满天星/6.jpg');

INSERT INTO `flowe_js` (`title0`,`title1`,`title2`,`title3`,`title4`,`title5`,`img0`,`img1`,`img2`,`img3`,`img4`,`img5`) VALUES ('产品特点','角度展示','产地保证','实体配送','全国连锁','服务特色','commodity/卡罗拉红玫瑰/1.jpg','commodity/卡罗拉红玫瑰/2.jpg','commodity/卡罗拉红玫瑰/3.jpg','commodity/卡罗拉红玫瑰/4.jpg','commodity/卡罗拉红玫瑰/5.jpg','commodity/卡罗拉红玫瑰/6.jpg');

INSERT INTO `flowe_js` (`title0`,`title1`,`title2`,`title3`,`title4`,`title5`,`img0`,`img1`,`img2`,`img3`,`img4`,`img5`) VALUES ('产品特点','角度展示','产地保证','实体配送','全国连锁','服务特色','commodity/21朵粉玫瑰/1.jpg','commodity/21朵粉玫瑰/2.jpg','commodity/21朵粉玫瑰/3.jpg','commodity/21朵粉玫瑰/4.jpg','commodity/21朵粉玫瑰/5.jpg','commodity/21朵粉玫瑰/6.jpg');


INSERT INTO `flowe_js` (`title0`,`title1`,`title2`,`title3`,`title4`,`title5`) VALUES ('commodity/21朵粉玫瑰/lunbo.jpg',);


INSERT INTO flowe_listproduct (lid, productName, productImg) VALUES ('','','',);

INSERT INTO `flowe_listproduct`(`lid`, `productName`, `productImg`) VALUES (2,`祝福`,`list/1 (12).jpg`);



