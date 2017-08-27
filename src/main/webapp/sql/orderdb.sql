/*
Navicat MySQL Data Transfer

Source Server         : yuancheng
Source Server Version : 50636
Source Host           : 139.199.224.45:3306
Source Database       : orderdb

Target Server Type    : MYSQL
Target Server Version : 50636
File Encoding         : 65001

Date: 2017-08-04 08:43:41
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tb_domain
-- ----------------------------
DROP TABLE IF EXISTS `tb_domain`;
CREATE TABLE `tb_domain` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_domain
-- ----------------------------
INSERT INTO `tb_domain` VALUES ('1', '139.199.224.45');

-- ----------------------------
-- Table structure for tb_inform
-- ----------------------------
DROP TABLE IF EXISTS `tb_inform`;
CREATE TABLE `tb_inform` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `tableId` int(11) DEFAULT NULL,
  `tableName` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_inform
-- ----------------------------

-- ----------------------------
-- Table structure for tb_ingredient
-- ----------------------------
DROP TABLE IF EXISTS `tb_ingredient`;
CREATE TABLE `tb_ingredient` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createDate` datetime DEFAULT NULL,
  `introduce` varchar(255) DEFAULT NULL,
  `name` varchar(10) DEFAULT NULL,
  `num` double DEFAULT NULL,
  `price` double DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `source` varchar(255) DEFAULT NULL,
  `type` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_ingredient
-- ----------------------------
INSERT INTO `tb_ingredient` VALUES ('1', '2017-07-15 11:16:19', '葱，解毒调味，预防癌症，发汗抑菌，舒张血管等功效。葱中含有蛋白质、维生素A、食物纤维以及磷、铁、镁等。', '葱', '42', '10', null, null, '配料');
INSERT INTO `tb_ingredient` VALUES ('2', '2017-07-15 11:19:45', '姜有增进食欲、镇吐、活血祛寒之功效，姜中含有大量的蛋白质、膳食纤维、维生素等。所含得姜辣素和二苯基庚烷类化合物得结构均具有很强的抗氧化和清除自由基作用，促消化、活血祛寒，解毒。', '姜', '50', '5', null, null, '配料');
INSERT INTO `tb_ingredient` VALUES ('3', '2017-07-15 11:24:54', '盐，清理胃火、清理口臭。', '盐', '100', '10', null, null, '配料');
INSERT INTO `tb_ingredient` VALUES ('4', '2017-07-15 11:26:59', '酱油，普通佐料。', '酱油', '10', '15', null, null, '配料');
INSERT INTO `tb_ingredient` VALUES ('5', '2017-07-15 11:28:21', '醋，软化血管，解暑，促进血液循环，促进新陈代谢之功效。', '醋', '3', '5', null, null, '配料');
INSERT INTO `tb_ingredient` VALUES ('6', '2017-07-15 11:29:05', '蒜，解毒败毒，促进食欲。', '蒜', '6', '10', null, null, '配料');
INSERT INTO `tb_ingredient` VALUES ('7', '2017-07-15 11:30:00', '十三香，调味佳肴，促进口感，下饭。', '十三香', '6', '5', null, null, '配料');
INSERT INTO `tb_ingredient` VALUES ('8', '2017-07-15 11:31:58', '辣椒，增进食欲，缓解疼痛，健胃消食，预防胆结石、改善心脏功能等功效。', '辣椒', '7', '4', null, null, '原料');
INSERT INTO `tb_ingredient` VALUES ('9', '2017-07-15 11:33:03', '花椒，增强食欲，抗菌、散寒。', '花椒', '6', '5', null, null, '原料');
INSERT INTO `tb_ingredient` VALUES ('11', '2017-07-15 20:41:51', '它是既能增加人们的食欲，又能提供一定营养的家常调味品', '鸡精', '17', '15', null, null, '配料');
INSERT INTO `tb_ingredient` VALUES ('12', '2017-07-15 20:42:23', '普通调味品', '番茄酱', '11', '4', null, null, '配料');
INSERT INTO `tb_ingredient` VALUES ('13', '2017-07-15 20:43:41', '原料', '鸡', '30', '20', null, null, '原料');
INSERT INTO `tb_ingredient` VALUES ('14', '2017-07-15 20:43:59', '普通原料', '鸭', '20', '20', null, null, '配料');
INSERT INTO `tb_ingredient` VALUES ('15', '2017-07-15 20:44:16', '普通原料', '鱼', '45', '13', null, null, '配料');
INSERT INTO `tb_ingredient` VALUES ('16', '2017-07-15 20:44:31', '普通原料', '香菇', '5', '20', null, null, '配料');
INSERT INTO `tb_ingredient` VALUES ('17', '2017-07-15 20:44:49', '普通原料', '花生米', '5', '10', null, null, '配料');
INSERT INTO `tb_ingredient` VALUES ('18', '2017-07-15 20:45:18', '普通原料', '千页豆腐', '3', '5', null, null, '配料');
INSERT INTO `tb_ingredient` VALUES ('19', '2017-07-15 20:45:32', '普通原料', '腐竹', '5', '10', null, null, '配料');
INSERT INTO `tb_ingredient` VALUES ('20', '2017-07-15 20:45:47', '普通原料', '豆角', '30', '10', null, null, '配料');
INSERT INTO `tb_ingredient` VALUES ('21', '2017-07-15 20:46:05', '普通原料', '猪肉', '50', '15', null, null, '配料');
INSERT INTO `tb_ingredient` VALUES ('22', '2017-07-15 20:46:15', '普通原料', '羊肉', '10', '100', null, null, '配料');
INSERT INTO `tb_ingredient` VALUES ('23', '2017-07-16 17:13:14', '普通原料', '虾', '20', '20', null, null, '配料');
INSERT INTO `tb_ingredient` VALUES ('25', '2017-07-17 08:21:01', '牛奶', '牛奶', '7', '30', null, null, '配料');
INSERT INTO `tb_ingredient` VALUES ('26', '2017-07-17 08:25:09', '鸡蛋', '鸡蛋', '5', '50', null, null, '原料');
INSERT INTO `tb_ingredient` VALUES ('27', '2017-07-17 08:28:10', '甄选优秀小麦', '面', '30', '30', null, null, '原料');
INSERT INTO `tb_ingredient` VALUES ('28', '2017-07-17 08:28:58', '甄选优秀江南大米', '大米', '57', '5', null, null, '原料');
INSERT INTO `tb_ingredient` VALUES ('29', '2017-07-24 11:12:33', '【别名】：洋芋、地蛋、山药蛋、洋番薯、马铃薯、馍馍蛋\r\n【食量建议】：每次一个中等大小约130克\r\n【适宜人群】：脾胃气虚者、癌症、高血压、动脉硬化患者适宜\r\n【禁忌人群】：消化不良者不宜多食', '土豆', '39', '4', null, null, '原料');
INSERT INTO `tb_ingredient` VALUES ('30', '2017-07-24 11:13:33', '又名黑川，原产于印度马拉巴海岸(Malabar Coast)。其果味辛辣，是人们最早使用的香料之一，可能是现在使用最为广泛的香料。', '黑胡椒', '20', '10', null, null, '原料');
INSERT INTO `tb_ingredient` VALUES ('31', '2017-07-24 14:33:20', '【别名】：番茄、洋柿子、狼桃、番李子、金橘、番柿、六月柿、洋海椒、毛腊果【食量建议】：每天2~3个【适宜人群】：高血压、急慢性肾炎、肝炎、夜盲症、近视眼患者适宜【禁忌人群】：脾胃虚寒、月经期间不宜进食\r\n', '西红柿', '20', '5.2', null, null, '原料');
INSERT INTO `tb_ingredient` VALUES ('32', '2017-07-24 14:36:15', '【别名】：落苏、茄瓜【食量建议】：每次约85克【适宜人群】：特别适合心血管疾病【禁忌人群】：脾胃虚寒的人、哮喘患者慎食', '茄子', '10', '5', null, null, '原料');
INSERT INTO `tb_ingredient` VALUES ('34', '2017-07-24 15:01:29', '毛豆既富含植物性蛋白质，又有非常高的钾、镁元素含量，维生素B族和膳食纤维特别丰富，同时还含有皂甙、植酸、低聚糖等保健成分，对于保护心脑血管和控制血压很有好处', '毛豆', '10', '6', null, null, '原料');
INSERT INTO `tb_ingredient` VALUES ('35', '2017-07-24 15:06:16', '莲藕生用性寒，有清热凉血作用，可用来治疗热性病症；莲藕味甘多液、对热病口渴、衄血、咯血、下血者尤为有益。', '莲藕', '18', '3', null, null, '原料');
INSERT INTO `tb_ingredient` VALUES ('36', '2017-07-24 15:18:24', '普通佐料', '糖', '10', '5', null, null, '配料');
INSERT INTO `tb_ingredient` VALUES ('37', '2017-07-24 15:20:29', '秋葵中含有一种黏性液质及阿拉伯聚糖、半乳聚糖、鼠李聚糖、蛋白质等，经常食用帮助消化、增强体力、保护肝脏、健胃整肠', '秋葵', '8', '10', null, null, '原料');
INSERT INTO `tb_ingredient` VALUES ('38', '2017-07-24 15:33:02', '山药又称薯蓣、土薯、山薯蓣、怀山药、淮山、白山药，具有滋养强壮，助消化，敛虚汗，止泻之功效，主治脾虚腹泻、肺虚咳嗽、糖尿病消渴、小便短频、遗精、妇女带下及消化不良的慢性肠炎。山药最适宜与灵芝搭配服用，具有防治糖尿病的作用，山药在食品业和加工业上大有发展前途。', '铁棍山药', '10', '10', null, null, '原料');
INSERT INTO `tb_ingredient` VALUES ('39', '2017-07-24 15:34:17', '别名】：甘杞、贡杞、枸杞子、红耳坠、苟起子、枸杞红实、西枸杞、狗奶子、血枸子、枸杞豆、血杞子【食量建议】：每天约10~20克【适宜人群】：一般人群均可食用\r\n【禁忌人群】：脾虚者忌食', '枸杞', '20', '10', null, null, '原料');

-- ----------------------------
-- Table structure for tb_menu
-- ----------------------------
DROP TABLE IF EXISTS `tb_menu`;
CREATE TABLE `tb_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createDate` datetime DEFAULT NULL,
  `exist` int(11) DEFAULT NULL,
  `imgUrl` varchar(255) DEFAULT NULL,
  `introduce` varchar(255) DEFAULT NULL,
  `name` varchar(10) DEFAULT NULL,
  `num` int(11) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `typeId` int(11) DEFAULT NULL,
  `typeName` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_menu
-- ----------------------------
INSERT INTO `tb_menu` VALUES ('35', '2017-07-27 10:17:27', '1', 'a2654771_145146378964538.jpg', '超级好吃的烤土豆片，香喷喷的，味道足，足不出户都能吃到椒香四溢的烤土豆，爱重口味的妹子不要错过了，有了这个，还会去烧烤店么？', '黑胡椒烤土豆片', '2', '30', null, '1', '招牌');
INSERT INTO `tb_menu` VALUES ('36', '2017-07-27 10:17:27', '1', 'a3394650_150047824115616.jpg', '腐竹含有多种矿物元素等，能补充钙质，增进骨骼发育是豆制品中的营养冠军。 常吃腐竹能预防老年痴呆，降低血液中胆固醇含量，有防止高脂血症、动脉硬化的效果。但是一些痛风患者就不宜过多食用', '腐竹煸香菇', '14', '20', null, '1', '招牌');
INSERT INTO `tb_menu` VALUES ('37', '2017-07-27 10:17:27', '1', 'a1259208_48119.jpg', '地鲜莫过于笋，河鲜莫过于鱼。鱼向来都是新鲜嫩滑，汁多美味的代表，各类鱼营养价值相当，所以不管吃什么鱼都是可以的，而且鱼容易消化，是非常好的蛋白质来源。不知道大家有没有觉得，吃鱼的时候，心情也会跟着变好呢？', '青花椒酸菜鱼', '57', '40', null, '2', '热菜');
INSERT INTO `tb_menu` VALUES ('38', '2017-07-27 10:17:27', '1', 'a9974510_149921966855979.jpg', '烧茄子是一道地方名菜，属于浙菜系或东北菜。咸鲜回甜、酱香浓郁。以茄子为主要食材的家常菜，营养价值丰富，味道咸鲜。', '烧茄子', '7', '10', null, '2', '热菜');
INSERT INTO `tb_menu` VALUES ('39', '2017-07-27 10:17:27', '1', 'a3967209_148223484572328.jpg', '火腿、鸡蛋、生菜，配上牛奶，就是一顿非常营养美味的早餐', '三色牛奶吐司', '0', '15', null, '6', '甜点');
INSERT INTO `tb_menu` VALUES ('40', '2017-07-27 10:17:27', '1', 'a2983154_143398878064041.jpg', '作为早餐或是午后甜点非常不错的选择，满满的奶香味', '奶香蛋挞', '0', '15', null, '6', '甜点');
INSERT INTO `tb_menu` VALUES ('41', '2017-07-27 10:17:27', '1', 'a3879176_150055262059865.jpg', '凉拌鸡胸肉，这道菜比较费时，煮过的鸡胸肉需要一点一点的按照纹理撕开，', '凉拌鸡胸肉', '54', '26', null, '3', '凉菜');
INSERT INTO `tb_menu` VALUES ('45', '2017-07-27 10:17:27', '1', 'a2795068_144920710670337.jpg', '到了冬天，一家人围坐火锅边，吃的热乎，吃的暖心。\r\n因为有孩子，所以没做辣锅，配了小蝶辣酱蘸着吃。', '蔬菜菌菇锅', '11', '30', null, '4', '火锅');
INSERT INTO `tb_menu` VALUES ('46', '2017-07-27 10:17:27', '1', 'a5647085_146097345688066.jpg', '采用精选大米，天气一热，宝宝胃口差了好多对不对？白米饭已经很难引起孩子的兴趣，所以我改变了米饭的口味和造型，搭配上宝宝喜欢的食材，稍稍加工，瞬间就成为美貌口感兼具、人见人爱的食物，而且它还很适合宝宝抓着吃，能锻炼宝宝的手眼协调能力。\r\n萌萌的外形让宝宝都忍不住抢着吃，再也不用担心孩子不爱吃饭啦～就轻松保证孩子一餐所需的能量啦！', '三色米饭', '0', '5', null, '7', '主食');
INSERT INTO `tb_menu` VALUES ('47', '2017-07-27 10:17:27', '1', 'a5dd0e31c7d5d6ad7e2695b03a28988b_150x150.jpg', '鲷鱼烧（日语：たい焼き）是一种源自日本东京的点心，主要以鸡蛋牛奶面粉制作的小食，所作成的形状像鲷鱼的和果子，衍生自今川烧。好吃不贵，清香可口 肥而不腻 肉质鲜美~ 鲜香 细嫩 爽滑 色泽诱人曾经上学时，正在长身体的我需更多的热量才足以撑起一天繁重的学业。母亲常在我考了满分成绩后犒赏我亲手烹饪的清蒸鱼，那味道至今仍洋溢在我脑中。现在，每当看见清蒸鱼，我便想起了我的妈妈和那熟悉的鲜香。 这条鱼，看大小，应该是2斤左右。...', '鲷鱼烧', '15', '25', null, '1', '招牌');
INSERT INTO `tb_menu` VALUES ('48', '2017-07-27 10:17:27', '1', 'a5417220_146980504773178.jpg', '天气渐渐热了，夜宵摊上必少不了龙虾，螺蛳，毛豆，相对于荤菜，我在外面还是最喜欢点蔬菜，心理上觉的干净卫生。小时候，一到毛豆收货的季节，家里总要煮上一大锅，即便什么都不放，只是一点盐水，也觉得鲜嫩的无敌', '盐水毛豆', '2', '16', null, '3', '凉菜');
INSERT INTO `tb_menu` VALUES ('49', '2017-07-27 10:17:27', '1', 'b57f6e0dc2b7ab425d8059e6ad94bf50_150x150.jpg', '胭脂藕花，喜欢藕身处污泥未染泥，它的口感微甜而爽脆，而且那淡淡的清香闻着就神清气爽，开胃清热，滋补养性', '爽脆胭脂藕', '5', '26', null, '3', '凉菜');
INSERT INTO `tb_menu` VALUES ('51', '2017-07-27 10:17:27', '1', 'a1008115_148766661876968.jpg', '秋葵中含有一种黏性液质及阿拉伯聚糖、半乳聚糖、鼠李聚糖、蛋白质等，经常食用帮助消化、增强体力、保护肝脏、健胃整肠', '蒜蓉秋葵', '5', '36', null, '3', '凉菜');
INSERT INTO `tb_menu` VALUES ('53', '2017-07-27 10:17:27', '1', 'u=349438921,3398853530&fm=26&gp=0.jpg', '饮料', '美年达', '0', '10', null, '8', '酒水');
INSERT INTO `tb_menu` VALUES ('54', '2017-07-27 10:17:27', '1', 'u=2877646057,199288505&fm=11&gp=0.jpg', '饮料', '维他可可', '0', '16', null, '8', '酒水');
INSERT INTO `tb_menu` VALUES ('55', '2017-07-27 10:17:27', '1', 'u=1330468639,1477642515&fm=26&gp=0.jpg', '饮料', '黑水', '0', '36', null, '8', '酒水');
INSERT INTO `tb_menu` VALUES ('56', '2017-07-27 10:17:27', '1', 'a6419753_146605894450743.jpg', '在北方长大的我，其实还是比较喜欢吃面食的。刚到南方时每天吃米饭一点也不习惯，现在十几年呆下来也早就吃习惯了。最关键是家里都是老公烧饭，面食他一点都不会。去年儿子暑假回山东姥娘家，吃了很多次水饺，说很好吃，叫我做给他吃，前几天我也包水饺了，剩下一点面团，就做面条吧。\r\n虽然说小时候看妈妈做的挺简单的，但是真正做起来还是有差距的。', '面条', '0', '10', null, '7', '主食');
INSERT INTO `tb_menu` VALUES ('57', '2017-07-27 10:17:27', '1', '768b52576696b65e156525588a6f265a.jpg', '天气炎热没胃口，就喜欢做一些汤汤水水的东西，开胃而且营养。', '山药枸杞鸡汤', '0', '50', null, '5', '汤品');
INSERT INTO `tb_menu` VALUES ('58', '2017-07-27 10:17:27', '1', 'a1418209_146233267889330.jpg', '成熟是一种明亮而不刺眼的光辉，一种圆润而不腻耳的声响，一种不再需要对别人察言观色的从容，一种终于停止向周围申诉求告的大气，一种不理会喧闹的微笑，一种洗刷了偏激的淡漠，一种无需声张的厚实，一种能够看的很远却并不陡峭的高度。', '海鲜一品汤', '0', '23', null, '5', '汤品');
INSERT INTO `tb_menu` VALUES ('59', '2017-07-27 10:17:27', '1', '9baad54d552c830d29c50dd0a912a866.jpg', '初茶淡饭尽留香，男女老少皆相宜。你来他往皆尽喜，嘴甜肚满皆尽欢。真材实料真心意，物美价廉甜蜜蜜。真奶真蛋真糕点，甜嘴甜舌甜心意', '樱桃甜点', '0', '23', null, '6', '甜点');
INSERT INTO `tb_menu` VALUES ('60', '2017-07-27 10:17:27', '1', 'fd355e4ce8d6262febd7e8085fde35b9_180x180.jpg', '  不吃米饭，而空腹大量进食鱼、肉等高蛋白质食物，不但浪费蛋白质，还增加了身体内的废物产生。', '米饭', '0', '1', null, '7', '主食');
INSERT INTO `tb_menu` VALUES ('61', '2017-07-27 10:17:27', '1', 'a5298369_147964771472844.jpg', '一到冬天我想火锅估计成了各家各户餐桌上的常客，我家也不例外，其实我个人还是很喜欢麻辣锅底。可是自从有了七月，这个习惯也因为他而改变了，我现在倒是喜欢番茄味的锅底，火红的颜色丝毫不逊色于红辣椒。', '番茄火锅', '0', '30', null, '4', '火锅');

-- ----------------------------
-- Table structure for tb_menumaterial
-- ----------------------------
DROP TABLE IF EXISTS `tb_menumaterial`;
CREATE TABLE `tb_menumaterial` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `imgUrl` varchar(255) DEFAULT NULL,
  `ingId` int(11) DEFAULT NULL,
  `ingName` varchar(10) DEFAULT NULL,
  `menuId` int(11) DEFAULT NULL,
  `menuName` varchar(10) DEFAULT NULL,
  `num` double DEFAULT NULL,
  `stockDate` datetime DEFAULT NULL,
  `type` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=165 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_menumaterial
-- ----------------------------
INSERT INTO `tb_menumaterial` VALUES ('108', null, '1', '葱', '35', '黑胡椒烤土豆片', '0.03', '2017-07-24 11:08:50', '配料');
INSERT INTO `tb_menumaterial` VALUES ('109', null, '29', '土豆', '35', '黑胡椒烤土豆片', '0.9', '2017-07-24 11:13:57', '原料');
INSERT INTO `tb_menumaterial` VALUES ('110', null, '30', '黑胡椒', '35', '黑胡椒烤土豆片', '0.1', '2017-07-24 11:14:33', '原料');
INSERT INTO `tb_menumaterial` VALUES ('111', null, '16', '香菇', '36', '腐竹煸香菇', '0.5', '2017-07-24 14:18:06', '原料');
INSERT INTO `tb_menumaterial` VALUES ('112', null, '19', '腐竹', '36', '腐竹煸香菇', '0.5', '2017-07-24 14:18:16', '原料');
INSERT INTO `tb_menumaterial` VALUES ('113', null, '9', '花椒', '37', '青花椒酸菜鱼', '0.5', '2017-07-24 14:20:55', '配料');
INSERT INTO `tb_menumaterial` VALUES ('114', null, '15', '鱼', '37', '青花椒酸菜鱼', '1', '2017-07-24 14:21:05', '原料');
INSERT INTO `tb_menumaterial` VALUES ('115', null, '31', '西红柿', '38', '烧茄子', '0.1', '2017-07-24 14:34:43', '原料');
INSERT INTO `tb_menumaterial` VALUES ('116', null, '8', '辣椒', '38', '烧茄子', '0.1', '2017-07-24 14:35:18', '原料');
INSERT INTO `tb_menumaterial` VALUES ('117', null, '32', '茄子', '38', '烧茄子', '0.5', '2017-07-24 14:37:15', '原料');
INSERT INTO `tb_menumaterial` VALUES ('118', null, '25', '牛奶', '39', '三色牛奶吐司', '0.5', '2017-07-24 14:40:07', '配料');
INSERT INTO `tb_menumaterial` VALUES ('119', null, '27', '面', '39', '三色牛奶吐司', '0.5', '2017-07-24 14:40:25', '原料');
INSERT INTO `tb_menumaterial` VALUES ('120', null, '26', '鸡蛋', '39', '三色牛奶吐司', '0.5', '2017-07-24 14:40:45', '原料');
INSERT INTO `tb_menumaterial` VALUES ('121', null, '26', '鸡蛋', '40', '奶香蛋挞', '0.5', '2017-07-24 14:43:42', '原料');
INSERT INTO `tb_menumaterial` VALUES ('122', null, '27', '面', '40', '奶香蛋挞', '0.2', '2017-07-24 14:43:52', '原料');
INSERT INTO `tb_menumaterial` VALUES ('123', null, '1', '葱', '41', '凉拌鸡胸肉', '0.06', '2017-07-24 14:57:16', '配料');
INSERT INTO `tb_menumaterial` VALUES ('124', null, '2', '姜', '41', '凉拌鸡胸肉', '0.01', '2017-07-24 14:58:38', '配料');
INSERT INTO `tb_menumaterial` VALUES ('125', null, '3', '盐', '41', '凉拌鸡胸肉', '0.01', '2017-07-24 14:59:13', '配料');
INSERT INTO `tb_menumaterial` VALUES ('126', null, '13', '鸡', '41', '凉拌鸡胸肉', '0.32', '2017-07-24 14:59:21', '原料');
INSERT INTO `tb_menumaterial` VALUES ('127', null, '11', '鸡精', '41', '凉拌鸡胸肉', '0.03', '2017-07-24 14:59:29', '配料');
INSERT INTO `tb_menumaterial` VALUES ('128', null, '7', '十三香', '41', '凉拌鸡胸肉', '0.01', '2017-07-24 14:59:36', '配料');
INSERT INTO `tb_menumaterial` VALUES ('129', null, '6', '蒜', '41', '凉拌鸡胸肉', '0.01', '2017-07-24 14:59:52', '配料');
INSERT INTO `tb_menumaterial` VALUES ('141', null, '16', '香菇', '45', '蔬菜菌菇锅', '0.5', '2017-07-24 15:06:02', '原料');
INSERT INTO `tb_menumaterial` VALUES ('142', null, '1', '葱', '45', '蔬菜菌菇锅', '0.1', '2017-07-24 15:06:26', '配料');
INSERT INTO `tb_menumaterial` VALUES ('143', null, '35', '莲藕', '44', '爽脆胭脂藕', '0.6', '2017-07-24 15:06:35', '原料');
INSERT INTO `tb_menumaterial` VALUES ('144', null, '17', '花生米', '46', '三色米饭', '0.03', '2017-07-24 15:08:58', '原料');
INSERT INTO `tb_menumaterial` VALUES ('145', null, '1', '葱', '48', '盐水毛豆', '0.01', '2017-07-24 15:16:15', '配料');
INSERT INTO `tb_menumaterial` VALUES ('146', null, '2', '姜', '48', '盐水毛豆', '0.01', '2017-07-24 15:16:20', '配料');
INSERT INTO `tb_menumaterial` VALUES ('147', null, '3', '盐', '48', '盐水毛豆', '0.01', '2017-07-24 15:16:26', '配料');
INSERT INTO `tb_menumaterial` VALUES ('148', null, '15', '鱼', '47', '鲷鱼烧', '1', '2017-07-24 15:16:28', '原料');
INSERT INTO `tb_menumaterial` VALUES ('149', null, '4', '酱油', '48', '盐水毛豆', '0.01', '2017-07-24 15:16:30', '配料');
INSERT INTO `tb_menumaterial` VALUES ('150', null, '34', '毛豆', '48', '盐水毛豆', '0.02', '2017-07-24 15:16:36', '原料');
INSERT INTO `tb_menumaterial` VALUES ('151', null, '35', '莲藕', '49', '爽脆胭脂藕', '1', '2017-07-24 15:17:51', '原料');
INSERT INTO `tb_menumaterial` VALUES ('152', null, '2', '姜', '49', '爽脆胭脂藕', '0.1', '2017-07-24 15:17:56', '配料');
INSERT INTO `tb_menumaterial` VALUES ('153', null, '36', '糖', '49', '爽脆胭脂藕', '0.03', '2017-07-24 15:18:50', '配料');
INSERT INTO `tb_menumaterial` VALUES ('154', null, '37', '秋葵', '51', '蒜蓉秋葵', '1', '2017-07-24 15:20:48', '原料');
INSERT INTO `tb_menumaterial` VALUES ('155', null, '1', '葱', '51', '蒜蓉秋葵', '0.01', '2017-07-24 15:21:02', '配料');
INSERT INTO `tb_menumaterial` VALUES ('156', null, '27', '面', '56', '面条', '1', '2017-07-24 15:30:04', '原料');
INSERT INTO `tb_menumaterial` VALUES ('157', null, '13', '鸡', '57', '山药枸杞鸡汤', '1', '2017-07-24 15:30:54', '原料');
INSERT INTO `tb_menumaterial` VALUES ('158', null, '1', '葱', '57', '山药枸杞鸡汤', '0.01', '2017-07-24 15:31:11', '配料');
INSERT INTO `tb_menumaterial` VALUES ('159', null, '23', '虾', '58', '海鲜一品汤', '1', '2017-07-24 15:33:32', '原料');
INSERT INTO `tb_menumaterial` VALUES ('160', null, '38', '铁棍山药', '57', '山药枸杞鸡汤', '0.05', '2017-07-24 15:35:06', '原料');
INSERT INTO `tb_menumaterial` VALUES ('161', null, '39', '枸杞', '57', '山药枸杞鸡汤', '0.01', '2017-07-24 15:35:16', '原料');
INSERT INTO `tb_menumaterial` VALUES ('162', null, '27', '面', '59', '樱桃甜点', '0.5', '2017-07-24 15:36:55', '原料');
INSERT INTO `tb_menumaterial` VALUES ('163', null, '28', '大米', '60', '米饭', '0.01', '2017-07-24 15:38:38', '原料');
INSERT INTO `tb_menumaterial` VALUES ('164', null, '31', '西红柿', '61', '番茄火锅', '1', '2017-07-24 17:32:47', '原料');

-- ----------------------------
-- Table structure for tb_menutype
-- ----------------------------
DROP TABLE IF EXISTS `tb_menutype`;
CREATE TABLE `tb_menutype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `imgUrl` varchar(255) DEFAULT NULL,
  `name` varchar(10) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_menutype
-- ----------------------------
INSERT INTO `tb_menutype` VALUES ('1', 'zhaopai.png', '招牌', '');
INSERT INTO `tb_menutype` VALUES ('2', 're.png', '热菜', '');
INSERT INTO `tb_menutype` VALUES ('3', 'liang.png', '凉菜', '');
INSERT INTO `tb_menutype` VALUES ('4', 'huoguo.png', '火锅', '');
INSERT INTO `tb_menutype` VALUES ('5', 'tang.png', '汤品', '');
INSERT INTO `tb_menutype` VALUES ('6', 'tiandian.png', '甜点', '');
INSERT INTO `tb_menutype` VALUES ('7', 'zhucai.png', '主食', '');
INSERT INTO `tb_menutype` VALUES ('8', 'jiu.png', '酒水', '');

-- ----------------------------
-- Table structure for tb_order
-- ----------------------------
DROP TABLE IF EXISTS `tb_order`;
CREATE TABLE `tb_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cookId` int(11) DEFAULT NULL,
  `cookName` varchar(10) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  `tableId` int(11) DEFAULT NULL,
  `tableName` varchar(10) DEFAULT NULL,
  `total` double DEFAULT NULL,
  `favourable` double DEFAULT NULL,
  `price` double DEFAULT NULL,
  `payway` varchar(20) DEFAULT NULL,
  `cashierId` int(11) DEFAULT NULL,
  `cashierName` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_order
-- ----------------------------

-- ----------------------------
-- Table structure for tb_orderdetails
-- ----------------------------
DROP TABLE IF EXISTS `tb_orderdetails`;
CREATE TABLE `tb_orderdetails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cookId` int(11) DEFAULT NULL,
  `cookName` varchar(10) DEFAULT NULL,
  `creatDate` datetime DEFAULT NULL,
  `imgUrl` varchar(255) DEFAULT NULL,
  `menuId` int(11) DEFAULT NULL,
  `menuName` varchar(10) DEFAULT NULL,
  `menuNum` int(11) DEFAULT NULL,
  `orderId` int(11) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  `tableId` int(11) DEFAULT NULL,
  `tableName` varchar(10) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `dishes` varchar(4) DEFAULT NULL,
  `gift` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_orderdetails
-- ----------------------------

-- ----------------------------
-- Table structure for tb_payment
-- ----------------------------
DROP TABLE IF EXISTS `tb_payment`;
CREATE TABLE `tb_payment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `remark` varchar(255) DEFAULT NULL,
  `ways` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_payment
-- ----------------------------
INSERT INTO `tb_payment` VALUES ('1', null, '现金');
INSERT INTO `tb_payment` VALUES ('3', null, '银行卡');
INSERT INTO `tb_payment` VALUES ('4', null, '支付宝');
INSERT INTO `tb_payment` VALUES ('5', null, '微信');

-- ----------------------------
-- Table structure for tb_restaurant
-- ----------------------------
DROP TABLE IF EXISTS `tb_restaurant`;
CREATE TABLE `tb_restaurant` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `address` varchar(255) DEFAULT NULL,
  `imgUrl` varchar(255) DEFAULT NULL,
  `introduce` varchar(255) DEFAULT NULL,
  `name` varchar(10) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_restaurant
-- ----------------------------
INSERT INTO `tb_restaurant` VALUES ('3', '郑州纬五路与经七路交叉口东北角', 'jd2.png', '天堂鸟酒店（纬五路分店）位于纬五路与经七路交叉口东北角，营业面积有二千平方，有两层楼，二楼为包间和多功能厅。酒店环境幽雅，中高档次。以川菜、粤菜为主。分店在过节期间正常营业，欢迎订台，欢迎光临！', '天堂鸟酒店', '0371-68265666');

-- ----------------------------
-- Table structure for tb_shopcart
-- ----------------------------
DROP TABLE IF EXISTS `tb_shopcart`;
CREATE TABLE `tb_shopcart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `imgUrl` varchar(255) DEFAULT NULL,
  `menuId` int(11) DEFAULT NULL,
  `menuName` varchar(10) DEFAULT NULL,
  `menuNum` int(11) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `tableId` int(11) DEFAULT NULL,
  `tableName` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_shopcart
-- ----------------------------

-- ----------------------------
-- Table structure for tb_stock
-- ----------------------------
DROP TABLE IF EXISTS `tb_stock`;
CREATE TABLE `tb_stock` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createDate` datetime DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `site` varchar(225) DEFAULT NULL,
  `total` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_stock
-- ----------------------------
INSERT INTO `tb_stock` VALUES ('1', '2017-07-11 09:43:32', '这次进货很完美', '日本', '1000');
INSERT INTO `tb_stock` VALUES ('2', '2017-07-27 09:47:55', '', '新乡红旗区', '1200');
INSERT INTO `tb_stock` VALUES ('3', '2017-07-05 09:56:35', '这次进货进的好', '河南科技学院', '529');
INSERT INTO `tb_stock` VALUES ('5', '2017-07-13 09:54:19', '主要为鱼类，肉类，蔬菜', '广东-珠海市-金湾区', '3000');
INSERT INTO `tb_stock` VALUES ('6', '2017-07-29 09:54:50', '', '德国', '3000');
INSERT INTO `tb_stock` VALUES ('7', '2017-07-05 09:58:40', '来自学校周围的进货', '香港', '689');
INSERT INTO `tb_stock` VALUES ('8', '2017-07-14 10:00:43', '来自雾霾的菜品', '北京', '2000');
INSERT INTO `tb_stock` VALUES ('10', '2017-07-11 10:02:28', '非基因合成产品', '美国', '456');
INSERT INTO `tb_stock` VALUES ('14', '2017-07-25 10:01:32', '南半球进货', '马来西亚', '10000');
INSERT INTO `tb_stock` VALUES ('15', '2017-08-01 17:32:17', '不错不错', '河南', '1000');

-- ----------------------------
-- Table structure for tb_stockdetails
-- ----------------------------
DROP TABLE IF EXISTS `tb_stockdetails`;
CREATE TABLE `tb_stockdetails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createDate` datetime DEFAULT NULL,
  `ingId` int(11) DEFAULT NULL,
  `ingName` varchar(10) DEFAULT NULL,
  `num` double DEFAULT NULL,
  `origins` longtext,
  `price` double DEFAULT NULL,
  `stockId` int(11) DEFAULT NULL,
  `place` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_stockdetails
-- ----------------------------
INSERT INTO `tb_stockdetails` VALUES ('1', '2017-07-11 09:43:32', '1', '葱', '20', '<p><img src=\"http://www.99dna.com/NCP/Content/images/farmproduce/topdesc.png\"></p><p>农产品的质量安全一直是消费者以及社会各界关注的重点，“99DNA溯源”利用物联网技术帮助农产品使用数字化追溯的方式解决这个问题，让产品全过程追溯，数据信息100%可视，不但能够提升品牌与销量，更能让消费者买得放心，吃得健康。</p><p>消费者一扫二维码即可了解农产品从“种植开始到餐桌”的各个环节。</p><p>消费者通过二维码或RFID芯片可以追溯养殖家禽从“养殖-屠宰-包装”等各个环节。</p><p>同时，商家也可以追溯“监管源头到销售”的整个过程，获得更精准的营销数据，打造“绿色、安全、健康”的农产品高质量品牌。</p><p><br></p>', '10', '1', '日本');
INSERT INTO `tb_stockdetails` VALUES ('2', '2017-07-11 09:43:32', '2', '姜', '10', '<p><img src=\"http://www.99dna.com/NCP/Content/images/farmproduce/topdesc.png\"></p><p>农产品的质量安全一直是消费者以及社会各界关注的重点，“99DNA溯源”利用物联网技术帮助农产品使用数字化追溯的方式解决这个问题，让产品全过程追溯，数据信息100%可视，不但能够提升品牌与销量，更能让消费者买得放心，吃得健康。</p><p>消费者一扫二维码即可了解农产品从“种植开始到餐桌”的各个环节。</p><p>消费者通过二维码或RFID芯片可以追溯养殖家禽从“养殖-屠宰-包装”等各个环节。</p><p>同时，商家也可以追溯“监管源头到销售”的整个过程，获得更精准的营销数据，打造“绿色、安全、健康”的农产品高质量品牌。</p><p><br></p>', '5.5', '1', '日本');
INSERT INTO `tb_stockdetails` VALUES ('3', '2017-07-11 09:43:32', '13', '鸡', '50', '<p><img src=\"http://www.99dna.com/NCP/Content/images/farmproduce/topdesc.png\">农产品的质量安全一直是消费者以及社会各界关注的重点，“99DNA溯源”利用物联网技术帮助农产品使用数字化追溯的方式解决这个问题，让产品全过程追溯，数据信息100%可视，不但能够提升品牌与销量，更能让消费者买得放心，吃得健康。</p><p>消费者一扫二维码即可了解农产品从“种植开始到餐桌”的各个环节。</p><p>消费者通过二维码或RFID芯片可以追溯养殖家禽从“养殖-屠宰-包装”等各个环节。</p><p>同时，商家也可以追溯“监管源头到销售”的整个过程，获得更精准的营销数据，打造“绿色、安全、健康”的农产品高质量品牌。</p><p><br></p>', '10.5', '1', '日本');
INSERT INTO `tb_stockdetails` VALUES ('4', '2017-07-27 09:47:55', '15', '鱼', '50', '<p></p><p><img src=\"http://m.99dna.com/Content/Instructions/UR635923573864970000/PD635923592087680000/635968592726730000/index/images/index/u24.png\" class=\"\" style=\"font-size: 1.5vw;\"></p><p><img src=\"http://m.99dna.com/Content/Instructions/UR635923573864970000/PD635923592087680000/635968592726730000/index/images/index/u26.jpg\"></p><p><img src=\"http://m.99dna.com/Content/Instructions/UR635923573864970000/PD635923592087680000/635968592726730000/index/images/index/u28.jpg\"></p><p><img src=\"http://m.99dna.com/Content/Instructions/UR635923573864970000/PD635923592087680000/635968592726730000/index/images/index/u30.jpg\"></p><p><img src=\"http://m.99dna.com/Content/Instructions/UR635923573864970000/PD635923592087680000/635968592726730000/index/images/index/u36.jpg\"></p><p><img src=\"http://m.99dna.com/Content/Instructions/UR635923573864970000/PD635923592087680000/635968592726730000/index/images/index/u42.jpg\"></p><p><img src=\"http://m.99dna.com/Content/Instructions/UR635923573864970000/PD635923592087680000/635968592726730000/index/images/index/u44.jpg\"></p><p><img src=\"http://m.99dna.com/Content/Instructions/UR635923573864970000/PD635923592087680000/635968592726730000/index/images/index/u50.jpg\"></p><p></p><p><img src=\"http://m.99dna.com/Content/Instructions/UR635923573864970000/PD635923592087680000/635968592726730000/index/resources/images/transparent.gif\"></p><p>检测报告</p><p><img src=\"http://m.99dna.com/Content/Instructions/UR635923573864970000/PD635923592087680000/635968592726730000/index/images/index/u60.jpg\" class=\"\"></p><p><img src=\"http://m.99dna.com/Content/Instructions/UR635923573864970000/PD635923592087680000/635968592726730000/index/images/index/u62.png\"></p><p></p><p><img src=\"http://m.99dna.com/Content/Instructions/UR635923573864970000/PD635923592087680000/635968592726730000/index/resources/images/transparent.gif\"></p><p>德洋现场</p><p><img src=\"http://m.99dna.com/Content/Instructions/UR635923573864970000/PD635923592087680000/635968592726730000/index/images/index/u68.jpg\"></p><p><img src=\"http://m.99dna.com/Content/Instructions/UR635923573864970000/PD635923592087680000/635968592726730000/index/resources/images/transparent.gif\"></p><p>&nbsp;&nbsp;六大生产关键环节，层层把关，实现全程监控，实时记录，建立99DNA身份认证！</p><p><img src=\"http://m.99dna.com/Content/Instructions/UR635923573864970000/PD635923592087680000/635968592726730000/index/images/index/u72.png\"></p><p></p><p><img src=\"http://m.99dna.com/Content/Instructions/UR635923573864970000/PD635923592087680000/635968592726730000/index/resources/images/transparent.gif\"></p><p>全产业链生产流程&nbsp;</p><p><img src=\"http://m.99dna.com/Content/Instructions/UR635923573864970000/PD635923592087680000/635968592726730000/index/images/index/u78.png\"></p><p><img src=\"http://m.99dna.com/Content/Instructions/UR635923573864970000/PD635923592087680000/635968592726730000/index/images/index/u80.png\"></p><p><img src=\"http://m.99dna.com/Content/Instructions/UR635923573864970000/PD635923592087680000/635968592726730000/index/images/index/u82.png\"></p><p><img src=\"http://m.99dna.com/Content/Instructions/UR635923573864970000/PD635923592087680000/635968592726730000/index/images/index/u84.png\"></p><p><img src=\"http://m.99dna.com/Content/Instructions/UR635923573864970000/PD635923592087680000/635968592726730000/index/images/index/u86.png\"></p><p><img src=\"http://m.99dna.com/Content/Instructions/UR635923573864970000/PD635923592087680000/635968592726730000/index/images/index/u88.png\"></p><p><img src=\"http://m.99dna.com/Content/Instructions/UR635923573864970000/PD635923592087680000/635968592726730000/index/images/index/u90.png\"></p><p><img src=\"http://m.99dna.com/Content/Instructions/UR635923573864970000/PD635923592087680000/635968592726730000/index/images/index/u92.png\"></p><p><img src=\"http://m.99dna.com/Content/Instructions/UR635923573864970000/PD635923592087680000/635968592726730000/index/images/index/u94.png\"></p><p><img src=\"http://m.99dna.com/Content/Instructions/UR635923573864970000/PD635923592087680000/635968592726730000/index/images/index/u96.png\"></p><p><img src=\"http://m.99dna.com/Content/Instructions/UR635923573864970000/PD635923592087680000/635968592726730000/index/resources/images/transparent.gif\"></p><p>公司基地全景</p><p><img src=\"http://m.99dna.com/Content/Instructions/UR635923573864970000/PD635923592087680000/635968592726730000/index/resources/images/transparent.gif\"></p><p>百亩种苗生产基地</p><p><img src=\"http://m.99dna.com/Content/Instructions/UR635923573864970000/PD635923592087680000/635968592726730000/index/images/index/u102.png\"></p><p><img src=\"http://m.99dna.com/Content/Instructions/UR635923573864970000/PD635923592087680000/635968592726730000/index/resources/images/transparent.gif\"></p><p>千亩大型原生态水库</p><p><img src=\"http://m.99dna.com/Content/Instructions/UR635923573864970000/PD635923592087680000/635968592726730000/index/resources/images/transparent.gif\"></p><p>万方海水优化平台</p><p><img src=\"http://m.99dna.com/Content/Instructions/UR635923573864970000/PD635923592087680000/635968592726730000/index/images/index/u108.jpg\"></p><p><img src=\"http://m.99dna.com/Content/Instructions/UR635923573864970000/PD635923592087680000/635968592726730000/index/images/index/u110.png\"><br></p><p><br></p>', '20', '2', '新乡红旗区');
INSERT INTO `tb_stockdetails` VALUES ('5', '2017-07-05 09:56:35', '1', '葱', '30', '<p>暂无溯源信息</p>', '5', '3', '河南科技学院');
INSERT INTO `tb_stockdetails` VALUES ('6', '2017-07-27 09:47:55', '16', '香菇', '10', '<p></p><p></p><p><span style=\"font-size: 1.5vw;\">企业资质证书</span></p><p><img src=\"http://m.99dna.com/Content/Instructions/UR636234597419070000/PD636234601470200000/636234630637880000/index/resources/images/transparent.gif\"></p><p>检测报告</p><p></p><p><img src=\"http://m.99dna.com/Content/Instructions/UR636234597419070000/PD636234601470200000/636234630637880000/index/resources/images/transparent.gif\"></p><p>蔬菜生产基地</p><p><img src=\"http://m.99dna.com/Content/Instructions/UR636234597419070000/PD636234601470200000/636234630637880000/index/images/index/u12.jpg\"></p><p><img src=\"http://m.99dna.com/Content/Instructions/UR636234597419070000/PD636234601470200000/636234630637880000/index/images/index/u14.jpg\" class=\"\"></p><p><img src=\"http://m.99dna.com/Content/Instructions/UR636234597419070000/PD636234601470200000/636234630637880000/index/images/index/u16.jpg\"></p><p><img src=\"http://m.99dna.com/Content/Instructions/UR636234597419070000/PD636234601470200000/636234630637880000/index/images/index/u18.jpg\"></p><p><img src=\"http://m.99dna.com/Content/Instructions/UR636234597419070000/PD636234601470200000/636234630637880000/index/images/index/u20.jpg\"></p><p><img src=\"http://m.99dna.com/Content/Instructions/UR636234597419070000/PD636234601470200000/636234630637880000/index/images/index/u22.jpg\"></p><p><img src=\"http://m.99dna.com/Content/Instructions/UR636234597419070000/PD636234601470200000/636234630637880000/index/images/index/u24.jpg\"></p><p><img src=\"http://m.99dna.com/Content/Instructions/UR636234597419070000/PD636234601470200000/636234630637880000/index/images/index/u26.jpg\"></p><p><br></p>', '10', '2', '新乡红旗区');
INSERT INTO `tb_stockdetails` VALUES ('7', '2017-07-29 09:54:50', '1', '葱', '50', '<p><img src=\"http://www.99dna.com/NCP/Content/images/farmproduce/topdesc.png\"></p><p>农产品的质量安全一直是消费者以及社会各界关注的重点，“99DNA溯源”利用物联网技术帮助农产品使用数字化追溯的方式解决这个问题，让产品全过程追溯，数据信息100%可视，不但能够提升品牌与销量，更能让消费者买得放心，吃得健康。</p><p>消费者一扫二维码即可了解农产品从“种植开始到餐桌”的各个环节。</p><p>消费者通过二维码或RFID芯片可以追溯养殖家禽从“养殖-屠宰-包装”等各个环节。</p><p></p><p>同时，商家也可以追溯“监管源头到销售”的整个过程，获得更精准的营销数据，打造“绿色、安全、健康”的农产品高质量品牌。</p><p><br></p>', '5.5', '6', '德国');
INSERT INTO `tb_stockdetails` VALUES ('8', '2017-07-29 09:54:50', '28', '大米', '200', '<p><img src=\"http://www.99dna.com/NCP/Content/images/farmproduce/topdesc.png\"></p><p>农产品的质量安全一直是消费者以及社会各界关注的重点，“99DNA溯源”利用物联网技术帮助农产品使用数字化追溯的方式解决这个问题，让产品全过程追溯，数据信息100%可视，不但能够提升品牌与销量，更能让消费者买得放心，吃得健康。</p><p>消费者一扫二维码即可了解农产品从“种植开始到餐桌”的各个环节。</p><p>消费者通过二维码或RFID芯片可以追溯养殖家禽从“养殖-屠宰-包装”等各个环节。</p><p>同时，商家也可以追溯“监管源头到销售”的整个过程，获得更精准的营销数据，打造“绿色、安全、健康”的农产品高质量品牌。</p><p><br></p>', '5', '6', '德国');
INSERT INTO `tb_stockdetails` VALUES ('9', '2017-07-05 09:58:40', '4', '酱油', '30', '<p><img src=\"/order/uploadImg/source/3d58f19b-f443-4528-b169-91c3b0022c5d.tm\" alt=\"3\" style=\"max-width:100%;\"></p><p>这次的进货较好</p>', '15', '7', '香港');
INSERT INTO `tb_stockdetails` VALUES ('11', '2017-07-14 10:00:43', '7', '十三香', '8', '<p>根深蒂固的还是法国撒旦sea固然有人撒分级基金很多地方规定</p>', '6', '8', '北京');
INSERT INTO `tb_stockdetails` VALUES ('13', '2017-07-13 09:54:19', '15', '鱼', '30', '<p>&nbsp;罗非鱼，别名&nbsp;“福寿鱼”，蛋白质含量高，富含人体必需谷氨酸和甘氨酸含量特别高；肌肉中不饱和脂肪酸含量约为54%～58%，且还含有较丰富的DHA和EPA（有利于智力发育）；视黄醇含量高（有助于治疗多种眼疾，维护免疫系统正常功能，促进发育，强壮骨骼）；牛磺酸含量高达210-220&nbsp;mg/100g（降低三高，有助视力恢复）；富含硒（较强的抗氧化作用）。</p><p><img src=\"/order/uploadImg/source/c57d9c6a-287d-4cf6-952e-675d84812c6c.tm\" alt=\"\" style=\"max-width:100%;\"></p><p><br></p>', '10', '5', '广东-珠海市-金湾区');
INSERT INTO `tb_stockdetails` VALUES ('16', '2017-07-11 10:02:28', '18', '千页豆腐', '8', '<p><img src=\"/order/uploadImg/source/c373f4b3-f918-46d8-afb4-c23d930a83ce.tm\" alt=\"8\" style=\"max-width:100%;\">这个面包好吃</p><p><br></p>', '5', '10', '美国');
INSERT INTO `tb_stockdetails` VALUES ('17', '2017-07-25 10:01:32', '8', '辣椒', '20', '<p>农产品的质量安全一直是消费者以及社会各界关注的重点，“99DNA溯源”利用物联网技术帮助农产品使用数字化追溯的方式解决这个问题，让产品全过程追溯，数据信息100%可视，不但能够提升品牌与销量，更能让消费者买得放心，吃得健康。</p><p>消费者一扫二维码即可了解农产品从“种植开始到餐桌”的各个环节。</p><p>消费者通过二维码或RFID芯片可以追溯养殖家禽从“养殖-屠宰-包装”等各个环节。</p><p></p><p>&nbsp;&nbsp;&nbsp;&nbsp;同时，商家也可以追溯“监管源头到销售”的整个过程，获得更精准的营销数据，打造“绿色、安全、健康”的农产品高质量品牌。</p><p><br></p>', '4', '14', '马来西亚');
INSERT INTO `tb_stockdetails` VALUES ('24', '2017-07-13 09:54:19', '31', '西红柿', '20', '<p>暂无溯源信息</p>', '5.2', '5', '广东-珠海市-金湾区');
INSERT INTO `tb_stockdetails` VALUES ('25', '2017-07-14 10:00:43', '30', '黑胡椒', '20', '<p>暂无溯源信息</p>', '10', '8', '北京');
INSERT INTO `tb_stockdetails` VALUES ('26', '2017-08-01 17:32:17', '29', '土豆', '40', '<p>暂无溯源信息</p>', '4', '15', '河南');
INSERT INTO `tb_stockdetails` VALUES ('27', '2017-08-01 17:32:17', '34', '毛豆', '10', '<p>暂无溯源信息</p>', '6', '15', '河南');
INSERT INTO `tb_stockdetails` VALUES ('28', '2017-08-01 17:32:17', '35', '莲藕', '20', '<p>暂无溯源信息</p>', '3', '15', '河南');
INSERT INTO `tb_stockdetails` VALUES ('29', '2017-08-01 17:32:17', '37', '秋葵', '10', '<p>暂无溯源信息</p>', '10', '15', '河南');
INSERT INTO `tb_stockdetails` VALUES ('30', '2017-08-01 17:32:17', '36', '糖', '10', '<p>暂无溯源信息</p>', '5', '15', '河南');
INSERT INTO `tb_stockdetails` VALUES ('31', '2017-08-01 17:32:17', '38', '铁棍山药', '10', '<p>暂无溯源信息</p>', '10', '15', '河南');
INSERT INTO `tb_stockdetails` VALUES ('32', '2017-07-27 09:47:55', '39', '枸杞', '20', '<p>暂无溯源信息</p>', '10', '2', '新乡红旗区');
INSERT INTO `tb_stockdetails` VALUES ('34', '2017-07-11 10:02:28', '21', '猪肉', '20', '<p>暂无溯源信息</p>', '15', '10', '美国');

-- ----------------------------
-- Table structure for tb_tables
-- ----------------------------
DROP TABLE IF EXISTS `tb_tables`;
CREATE TABLE `tb_tables` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(10) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `status` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_tables
-- ----------------------------
INSERT INTO `tb_tables` VALUES ('1', '清平乐', null, '无人');
INSERT INTO `tb_tables` VALUES ('2', '忆江南', null, '无人');
INSERT INTO `tb_tables` VALUES ('3', '水龙吟', null, '无人');
INSERT INTO `tb_tables` VALUES ('4', '西江月', null, '无人');
INSERT INTO `tb_tables` VALUES ('5', '雨霖铃', null, '无人');
INSERT INTO `tb_tables` VALUES ('6', '渔家傲', null, '无人');
INSERT INTO `tb_tables` VALUES ('7', '浣溪沙', null, '无人');
INSERT INTO `tb_tables` VALUES ('8', '蝶恋花', null, '无人');

-- ----------------------------
-- Table structure for tb_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createDate` datetime DEFAULT NULL,
  `name` varchar(10) DEFAULT NULL,
  `password` varchar(10) DEFAULT NULL,
  `phone` varchar(11) DEFAULT NULL,
  `remark` varchar(10) DEFAULT NULL,
  `sort` varchar(7) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_user
-- ----------------------------
INSERT INTO `tb_user` VALUES ('1', '2017-07-15 10:47:33', '张金高', '123456', '12345678910', null, 'manager');
INSERT INTO `tb_user` VALUES ('2', '2017-07-15 10:49:20', '马黎明', '123456', '12345678911', null, 'cashier');
INSERT INTO `tb_user` VALUES ('3', '2017-07-15 10:49:36', '王青杰', '123456', '12345678912', null, 'cook');
