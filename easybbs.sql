/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50734
Source Host           : localhost:3306
Source Database       : easybbs

Target Server Type    : MYSQL
Target Server Version : 50734
File Encoding         : 65001

Date: 2023-01-16 15:35:33
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for email_code
-- ----------------------------
DROP TABLE IF EXISTS `email_code`;
CREATE TABLE `email_code` (
  `email` varchar(150) NOT NULL COMMENT '邮箱',
  `code` varchar(5) NOT NULL COMMENT '编号',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `status` tinyint(1) DEFAULT NULL COMMENT '0:未使用  1:已使用',
  PRIMARY KEY (`email`,`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='邮箱验证码';

-- ----------------------------
-- Records of email_code
-- ----------------------------
INSERT INTO `email_code` VALUES ('test02@qq.com', '02758', '2023-01-16 09:38:44', '1');
INSERT INTO `email_code` VALUES ('test@qq.com', '08531', '2023-01-15 17:45:44', '1');

-- ----------------------------
-- Table structure for forum_article
-- ----------------------------
DROP TABLE IF EXISTS `forum_article`;
CREATE TABLE `forum_article` (
  `article_id` varchar(15) NOT NULL COMMENT '文章ID',
  `board_id` int(11) DEFAULT NULL COMMENT '板块ID',
  `board_name` varchar(50) DEFAULT NULL COMMENT '板块名称',
  `p_board_id` int(11) DEFAULT NULL COMMENT '父级板块ID',
  `p_board_name` varchar(50) DEFAULT NULL COMMENT '父板块名称',
  `user_id` varchar(15) NOT NULL COMMENT '用户ID',
  `nick_name` varchar(20) NOT NULL COMMENT '昵称',
  `user_ip_address` varchar(100) DEFAULT NULL COMMENT '最后登录ip地址',
  `title` varchar(150) NOT NULL COMMENT '标题',
  `cover` varchar(100) DEFAULT NULL COMMENT '封面',
  `content` text COMMENT '内容',
  `markdown_content` text COMMENT 'markdown内容',
  `editor_type` tinyint(4) NOT NULL COMMENT '0:富文本编辑器 1:markdown编辑器',
  `summary` varchar(200) DEFAULT NULL COMMENT '摘要',
  `post_time` datetime NOT NULL COMMENT '发布时间',
  `last_update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '最后更新时间',
  `read_count` int(11) DEFAULT '0' COMMENT '阅读数量',
  `good_count` int(11) DEFAULT '0' COMMENT '点赞数',
  `comment_count` int(11) DEFAULT '0' COMMENT '评论数',
  `top_type` tinyint(4) DEFAULT '0' COMMENT '0未置顶  1:已置顶',
  `attachment_type` tinyint(4) DEFAULT NULL COMMENT '0:没有附件  1:有附件',
  `status` tinyint(4) DEFAULT NULL COMMENT '-1已删除 0:待审核  1:已审核 ',
  PRIMARY KEY (`article_id`),
  KEY `idx_board_id` (`board_id`),
  KEY `idx_pboard_id` (`p_board_id`),
  KEY `idx_post_time` (`post_time`),
  KEY `idx_top_type` (`top_type`),
  KEY `idx_title` (`title`),
  KEY `idx_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='文章信息';

-- ----------------------------
-- Records of forum_article
-- ----------------------------
INSERT INTO `forum_article` VALUES ('7QdXp0FkOIyJAsG', '0', '', '10002', '摸鱼', '7437465925', '测试账号02', '未知', '同样是光头造型，把刘学义茅子俊边程放一起，差别就出来了', null, '<p data-v-md-line=\"1\">《少年歌行》剧版上线，豆瓣开分7.3，相信有数不清的书粉、漫粉慕名而来。圈里有这么一句大家都认同的老话，是说一部优秀的作品，原著是天，漫改是地，剧版则是毁天又灭地。那到底这部剧拍出来精髓还剩了多少？</p>\r\n', '《少年歌行》剧版上线，豆瓣开分7.3，相信有数不清的书粉、漫粉慕名而来。圈里有这么一句大家都认同的老话，是说一部优秀的作品，原著是天，漫改是地，剧版则是毁天又灭地。那到底这部剧拍出来精髓还剩了多少？', '1', '《少年歌行》剧版上线，豆瓣开分7.3，相信有数不清的书粉、漫粉慕名而来。圈里有这么一句大家都认同的老话，是说一部优秀的作品，原著是天，漫改是地，剧版则是毁天又灭地。那到底这部剧拍出来精髓还剩了多少？', '2023-01-16 10:01:14', '2023-01-16 10:10:57', '3', '0', '0', '0', '0', '1');
INSERT INTO `forum_article` VALUES ('D3fj3tiHMCpDubm', '10003', 'Vue', '10000', '前端', '1890524956', '测试账号', '未知', 'Class 与 Style 绑定', null, '<p data-v-md-line=\"1\">数据绑定的一个常见需求场景是操纵元素的 CSS class 列表和内联样式。因为 class 和 style 都是 attribute，我们可以和其他 attribute 一样使用 v-bind 将它们和动态的字符串绑定。但是，在处理比较复杂的绑定时，通过拼接生成字符串是麻烦且易出错的。因此，Vue 专门为 class 和 style 的 v-bind 用法提供了特殊的功能增强。除了字符串外，表达式的值也可以是对象或数组。</p>\r\n', '数据绑定的一个常见需求场景是操纵元素的 CSS class 列表和内联样式。因为 class 和 style 都是 attribute，我们可以和其他 attribute 一样使用 v-bind 将它们和动态的字符串绑定。但是，在处理比较复杂的绑定时，通过拼接生成字符串是麻烦且易出错的。因此，Vue 专门为 class 和 style 的 v-bind 用法提供了特殊的功能增强。除了字符串外，表达式的值也可以是对象或数组。', '1', null, '2023-01-16 09:35:14', '2023-01-16 09:35:16', '1', '0', '0', '0', '0', '1');
INSERT INTO `forum_article` VALUES ('f9xkyY6K6mZZ41G', '10003', 'Vue', '10000', '前端', '7437465925', '测试账号02', '未知', '条件渲染', null, '<p data-v-md-line=\"1\">条件渲染</p>\r\n<h1 data-v-md-heading=\"v-if\" data-v-md-line=\"2\">v-if</h1>\r\n<p data-v-md-line=\"3\">指令用于条件性地渲染一块内容。这块内容只会在指令的表达式返回真值时才被渲染。</p>\r\n<div data-v-md-line=\"4\"><div class=\"v-md-pre-wrapper v-md-pre-wrapper-js extra-class\"><pre class=\"v-md-hljs-js\"><code>&lt;h1 v-<span class=\"hljs-keyword\">if</span>=<span class=\"hljs-string\">&quot;awesome&quot;</span>&gt;Vue is awesome!&lt;/h1&gt;\r\n</code></pre>\r\n</div></div><h1 data-v-md-heading=\"v-else\" data-v-md-line=\"7\">v-else</h1>\r\n<p data-v-md-line=\"8\">你也可以使用 v-else 为 v-if 添加一个“else 区块”。</p>\r\n<div data-v-md-line=\"9\"><div class=\"v-md-pre-wrapper v-md-pre-wrapper-js extra-class\"><pre class=\"v-md-hljs-js\"><code>&lt;button @click=<span class=\"hljs-string\">&quot;awesome = !awesome&quot;</span>&gt;Toggle&lt;/button&gt;\r\n\r\n<span class=\"xml\"><span class=\"hljs-tag\">&lt;<span class=\"hljs-name\">h1</span> <span class=\"hljs-attr\">v-if</span>=<span class=\"hljs-string\">&quot;awesome&quot;</span>&gt;</span>Vue is awesome!<span class=\"hljs-tag\">&lt;/<span class=\"hljs-name\">h1</span>&gt;</span></span>\r\n<span class=\"xml\"><span class=\"hljs-tag\">&lt;<span class=\"hljs-name\">h1</span> <span class=\"hljs-attr\">v-else</span>&gt;</span>Oh no ?<span class=\"hljs-tag\">&lt;/<span class=\"hljs-name\">h1</span>&gt;</span></span>\r\n</code></pre>\r\n</div></div>', '条件渲染\r\n# v-if \r\n指令用于条件性地渲染一块内容。这块内容只会在指令的表达式返回真值时才被渲染。\r\n```js\r\n<h1 v-if=\"awesome\">Vue is awesome!</h1>\r\n```\r\n# v-else\r\n你也可以使用 v-else 为 v-if 添加一个“else 区块”。\r\n```js\r\n<button @click=\"awesome = !awesome\">Toggle</button>\r\n\r\n<h1 v-if=\"awesome\">Vue is awesome!</h1>\r\n<h1 v-else>Oh no ?</h1>\r\n```', '1', '令用于条件性地渲染一块内容。这块内容只会在指令的表达式返回真值时才被渲染。', '2023-01-16 09:55:37', '2023-01-16 09:55:36', '1', '0', '0', '0', '0', '1');
INSERT INTO `forum_article` VALUES ('foP3hhNAJTVCQYz', '0', '', '10002', '摸鱼', '7437465925', '测试账号02', '未知', '新射雕英雄传：梅超风路透，孟子义散发超美，洪七公南帝路透！', '202301/qkq0V8xvwQ8pQ4m.png', '<p data-v-md-line=\"1\">新版的射雕英雄传《金庸武侠世界》，目前还在拍摄中。一共有5个单元，请来了很多大家熟悉的演员。不过在服化道这块，似乎不是很有质感的样子。最近看到了孟子义，何润东，明道等人的造型，一起来看看吧。（本文为溪风影视汇聚独家首发，严禁抄袭洗稿！）</p>\r\n<p data-v-md-line=\"3\">孟子义版梅超风路透<br>\r\n这个新版的女演员颜值都在线，尤其是陈都灵的冯蘅，还有孟子义的梅超风。</p>\r\n<p data-v-md-line=\"6\">可惜周一围的黄药师，实在是不值得两大美女吃醋啊。<br>\r\n<img src=\"/api/file/getImage/202301/SQqeK0H5vMbrJgGa6y0FG247MIplyP.png\" alt=\"图片\"></p>\r\n', '新版的射雕英雄传《金庸武侠世界》，目前还在拍摄中。一共有5个单元，请来了很多大家熟悉的演员。不过在服化道这块，似乎不是很有质感的样子。最近看到了孟子义，何润东，明道等人的造型，一起来看看吧。（本文为溪风影视汇聚独家首发，严禁抄袭洗稿！）\r\n\r\n孟子义版梅超风路透\r\n这个新版的女演员颜值都在线，尤其是陈都灵的冯蘅，还有孟子义的梅超风。\r\n\r\n可惜周一围的黄药师，实在是不值得两大美女吃醋啊。\r\n![图片](/api/file/getImage/202301/SQqeK0H5vMbrJgGa6y0FG247MIplyP.png)', '1', '新版的射雕英雄传《金庸武侠世界》，目前还在拍摄中。一共有5个单元，请来了很多大家熟悉的演员', '2023-01-16 09:58:54', '2023-01-16 10:15:09', '78', '0', '0', '0', '0', '1');
INSERT INTO `forum_article` VALUES ('gWiZMhCluNCfYRR', '0', '', '10002', '摸鱼', '7437465925', '测试账号02', '未知', '外媒镜头里的国内女星，简直堪比照妖镜：刘亦菲美的太不真实', '202301/2lR1QAS78RUrdX4.png', '<p data-v-md-line=\"1\">拍照五分钟，P图两小时，想要青春永驻、容颜不老，P图和美颜技术必须要好，普通人拍照尚且需要遵守这样的原则，在堪称“颜值即正义”的娱乐圈更不用说了。现在国内许多高颜值的明星很难碰到有不修图的。<br>\r\n<img src=\"/api/file/getImage/202301/ns0ysKmwKIiyHdHJt7UOSM9XYZZbJ2.png\" alt=\"图片\"></p>\r\n', '拍照五分钟，P图两小时，想要青春永驻、容颜不老，P图和美颜技术必须要好，普通人拍照尚且需要遵守这样的原则，在堪称“颜值即正义”的娱乐圈更不用说了。现在国内许多高颜值的明星很难碰到有不修图的。\r\n![图片](/api/file/getImage/202301/ns0ysKmwKIiyHdHJt7UOSM9XYZZbJ2.png)', '1', '拍照五分钟，P图两小时，想要青春永驻、容颜不老，P图和美颜技术必须要好', '2023-01-16 09:58:13', '2023-01-16 10:15:12', '23', '0', '0', '0', '0', '1');
INSERT INTO `forum_article` VALUES ('HBNzH4CgFsitvtf', '0', '', '10002', '摸鱼', '7437465925', '测试账号02', '未知', '赵樱子的演技，好吗？吴镇宇的不鼓掌就是最好的回答', null, '<p data-v-md-line=\"1\">赵樱子身穿乞丐服，化着乞丐的妆容，扮演起了娇俏可人的黄蓉。</p>\r\n<p data-v-md-line=\"3\">这样一个经典的IP，这样一个经典的人物，赵樱子能够拿捏得住吗？</p>\r\n<p data-v-md-line=\"5\">从鼓掌就可以看出来了。</p>\r\n<p data-v-md-line=\"7\">佘诗曼、尔冬升、惠英红、许魏洲等人都给予了热烈的掌声。来放慢速度细品一下，尔冬升和佘诗曼是发自内心的，惠英红则是有一些无奈，并不是发自内心的鼓掌。</p>\r\n<p data-v-md-line=\"9\">尔冬升夸赵樱子哭戏好，让他颠覆了对她之前的看法。在尔冬升看来，一个好的演员只需要专注于自己的演技就好，把戏演好就可以了，不要去制造太多的新闻。这样容易本末倒置。</p>\r\n', '赵樱子身穿乞丐服，化着乞丐的妆容，扮演起了娇俏可人的黄蓉。\r\n\r\n这样一个经典的IP，这样一个经典的人物，赵樱子能够拿捏得住吗？\r\n\r\n从鼓掌就可以看出来了。\r\n\r\n佘诗曼、尔冬升、惠英红、许魏洲等人都给予了热烈的掌声。来放慢速度细品一下，尔冬升和佘诗曼是发自内心的，惠英红则是有一些无奈，并不是发自内心的鼓掌。\r\n\r\n尔冬升夸赵樱子哭戏好，让他颠覆了对她之前的看法。在尔冬升看来，一个好的演员只需要专注于自己的演技就好，把戏演好就可以了，不要去制造太多的新闻。这样容易本末倒置。', '1', '赵樱子身穿乞丐服，化着乞丐的妆容，扮演起了娇俏可人的黄蓉。', '2023-01-16 10:02:53', '2023-01-16 10:14:23', '4', '0', '0', '0', '0', '1');
INSERT INTO `forum_article` VALUES ('kFmzzykJHesxjuv', '0', '', '10002', '摸鱼', '7437465925', '测试账号02', '未知', '金庸笔下，若把射雕三男主vs天龙三兄弟，哪个更厉害？', '202301/kOL99fdJztTWTa1.png', '<p data-v-md-line=\"1\">前言：金庸先生一生写了多篇武侠小说，而最有影响力的莫过于《天龙八部》与“射雕三部曲”共四部小说。这四部小说不断被翻拍为影视作品，活跃在大众视野之下。相信不少人第一次接触金庸先生的小说便是通过观看这四部小说改编而成的影视作品吧<br>\r\n<img src=\"/api/file/getImage/202301/QkduGtSxvqY2fhoUA5T0geVmU3TSpv.png\" alt=\"图片\"></p>\r\n', '前言：金庸先生一生写了多篇武侠小说，而最有影响力的莫过于《天龙八部》与“射雕三部曲”共四部小说。这四部小说不断被翻拍为影视作品，活跃在大众视野之下。相信不少人第一次接触金庸先生的小说便是通过观看这四部小说改编而成的影视作品吧\r\n![图片](/api/file/getImage/202301/QkduGtSxvqY2fhoUA5T0geVmU3TSpv.png)', '1', '金庸先生一生写了多篇武侠小说，而最有影响力的莫过于《天龙八部》与“射雕三部曲”共四部小说。这四部小说不断被翻拍为影视作品，活跃在大众视野之下', '2023-01-16 10:09:28', '2023-01-16 10:15:13', '52', '0', '0', '0', '0', '1');
INSERT INTO `forum_article` VALUES ('NaU1ktjwN7h0EHf', '10003', 'Vue', '10000', '前端', '1890524956', '测试账号', '未知', '创建一个应用', '202301/iqlAZcksrj7NaDd.png', '<p data-v-md-line=\"1\">应用实例<br>\r\n每个 Vue 应用都是通过 createApp 函数创建一个新的 应用实例</p>\r\n<div data-v-md-line=\"3\"><div class=\"v-md-pre-wrapper v-md-pre-wrapper-js extra-class\"><pre class=\"v-md-hljs-js\"><code><span class=\"hljs-keyword\">import</span> { createApp } <span class=\"hljs-keyword\">from</span> <span class=\"hljs-string\">&#x27;vue&#x27;</span>\r\n\r\n<span class=\"hljs-keyword\">const</span> app = createApp({\r\n  <span class=\"hljs-comment\">/* 根组件选项 */</span>\r\n})\r\n</code></pre>\r\n</div></div>', '应用实例\r\n每个 Vue 应用都是通过 createApp 函数创建一个新的 应用实例\r\n```js\r\nimport { createApp } from \'vue\'\r\n\r\nconst app = createApp({\r\n  /* 根组件选项 */\r\n})\r\n```', '1', '', '2023-01-16 09:31:13', '2023-01-16 09:34:02', '5', '0', '0', '0', '0', '1');
INSERT INTO `forum_article` VALUES ('odFjtwnRa5pVvD8', '10003', 'Vue', '10000', '前端', '1890524956', '测试账号', '未知', '计算属性', null, '<p data-v-md-line=\"1\">基础示例#<br>\r\n模板中的表达式虽然方便，但也只能用来做简单的操作。如果在模板中写太多逻辑，会让模板变得臃肿，难以维护。比如说，我们有这样一个包含嵌套数组的对象：</p>\r\n', '基础示例#\r\n模板中的表达式虽然方便，但也只能用来做简单的操作。如果在模板中写太多逻辑，会让模板变得臃肿，难以维护。比如说，我们有这样一个包含嵌套数组的对象：', '1', null, '2023-01-16 09:34:52', '2023-01-16 09:34:55', '1', '0', '0', '0', '0', '1');
INSERT INTO `forum_article` VALUES ('QbanyzWzq3XV5KU', '0', '', '10002', '摸鱼', '7437465925', '测试账号02', '未知', '华为二公主姚安娜赢麻了！带资进组做配角，演技自然收获一致好评', '202301/nxUQw81IuTtUYCU.png', '<p data-v-md-line=\"1\">由刘亦菲和李现合作出演的电视剧《去有风的地方》正在热播中，据悉这是神仙姐姐刘亦菲首部现代剧，自从刘亦菲主演的《梦华录》成为现象级爆款后，很多观众都开始期待起这部双顶流影视剧了<br>\r\n<img src=\"/api/file/getImage/202301/MI545z3GH9q5E0lwP3SM2rqqhMJkVL.png\" alt=\"图片\"></p>\r\n', '由刘亦菲和李现合作出演的电视剧《去有风的地方》正在热播中，据悉这是神仙姐姐刘亦菲首部现代剧，自从刘亦菲主演的《梦华录》成为现象级爆款后，很多观众都开始期待起这部双顶流影视剧了\r\n![图片](/api/file/getImage/202301/MI545z3GH9q5E0lwP3SM2rqqhMJkVL.png)', '1', '由刘亦菲和李现合作出演的电视剧《去有风的地方》正在热播中，据悉这是神仙姐姐刘亦菲首部现代剧，自从刘亦菲主演的', '2023-01-16 09:57:32', '2023-01-16 10:08:33', '7', '0', '0', '0', '0', '1');
INSERT INTO `forum_article` VALUES ('Qyj3cTZFfhO3wZM', '0', '', '10002', '摸鱼', '7437465925', '测试账号02', '未知', '在拍戏的过程中我们真的很爱对方”，张彬彬为什么这样说', '202301/d7eGKIvOtsBUFUo.png', '<p data-v-md-line=\"1\">在拍摄《司藤》时，发生了一件让张彬彬十分不理解的事，那就是大甜甜都能凭着那几十套的旗袍火，为啥自己同样换了十几套衣服，就没人在意呢？<br>\r\n<img src=\"/api/file/getImage/202301/e3FkzpUaSbjPkI0xX47Y4LbYmd8t4B.png\" alt=\"图片\"></p>\r\n', '在拍摄《司藤》时，发生了一件让张彬彬十分不理解的事，那就是大甜甜都能凭着那几十套的旗袍火，为啥自己同样换了十几套衣服，就没人在意呢？\r\n![图片](/api/file/getImage/202301/e3FkzpUaSbjPkI0xX47Y4LbYmd8t4B.png)', '1', null, '2023-01-16 10:05:02', '2023-01-16 10:15:03', '10', '0', '0', '0', '0', '1');
INSERT INTO `forum_article` VALUES ('rRnX4Oz6vHihElY', '10003', 'Vue', '10000', '前端', '1890524956', '测试账号', '未知', '响应式基础', null, '<p data-v-md-line=\"1\">声明响应式状态#<br>\r\n选用选项式 API 时，会用 data 选项来声明组件的响应式状态。此选项的值应为返回一个对象的函数。Vue 将在创建新组件实例的时候调用此函数，并将函数返回的对象用响应式系统进行包装。此对象的所有顶层属性都会被代理到组件实例 (即方法和生命周期钩子中的 this) 上</p>\r\n', '声明响应式状态#\r\n选用选项式 API 时，会用 data 选项来声明组件的响应式状态。此选项的值应为返回一个对象的函数。Vue 将在创建新组件实例的时候调用此函数，并将函数返回的对象用响应式系统进行包装。此对象的所有顶层属性都会被代理到组件实例 (即方法和生命周期钩子中的 this) 上', '1', null, '2023-01-16 09:34:34', '2023-01-16 09:34:37', '1', '0', '0', '0', '0', '1');
INSERT INTO `forum_article` VALUES ('RtiXj832TFL4nhW', '10003', 'Vue', '10000', '前端', '1890524956', '测试账号', '未知', '第一个帖子，带图，带附件', '202301/8Hyca1SDrUWhBRy.jpeg', '<p data-v-md-line=\"1\">第一个帖子，下面是图片<br>\r\n<img src=\"/api/file/getImage/202301/F9TerZiONdqrZBk5o3NDqeRJuIlTaP.jpeg\" alt=\"图片\"></p>\r\n', '第一个帖子，下面是图片\r\n![图片](/api/file/getImage/202301/F9TerZiONdqrZBk5o3NDqeRJuIlTaP.jpeg)', '1', '第一个帖子，带图，带附件，这里是摘要', '2023-01-15 18:01:23', '2023-01-16 14:44:00', '102', '1', '4', '0', '1', '1');
INSERT INTO `forum_article` VALUES ('sgXFWoQx4Fn3BsN', '0', '', '10002', '摸鱼', '7437465925', '测试账号02', '未知', '连续9天拿下收视冠军！久违的谭松韵一出手，就是国剧天花板！', '202301/OazOPuaQnfmpJcF.png', '<p data-v-md-line=\"1\">20岁，她在《甄嬛传》中演豆蔻少女“淳贵人”，少女的天真烂漫被她完美诠释，从而收获首波关注。<br>\r\n<img src=\"/api/file/getImage/202301/Xr6prSbCVgrMJNmFrVphOogQRRIaSQ.png\" alt=\"图片\"><br>\r\n再出现，她已经是《耿耿于怀》中的“耿耿”。这一年，她即将奔三，但还是搭配19岁的刘昊然，演起青春校园剧。15年，《旋风少女》爆了，风靡一整个暑假，无人不知无人不上头。而谭松韵饰演的“范晓萤”，人气比主角还高。这部剧中，“范晓萤”一角的定位依然是十七八的小女孩。<br>\r\n<img src=\"/api/file/getImage/202301/S2UKIwJH7RfKMh0nRkV2Z7GF9adh2I.png\" alt=\"图片\"></p>\r\n', '20岁，她在《甄嬛传》中演豆蔻少女“淳贵人”，少女的天真烂漫被她完美诠释，从而收获首波关注。\r\n![图片](/api/file/getImage/202301/Xr6prSbCVgrMJNmFrVphOogQRRIaSQ.png)\r\n再出现，她已经是《耿耿于怀》中的“耿耿”。这一年，她即将奔三，但还是搭配19岁的刘昊然，演起青春校园剧。15年，《旋风少女》爆了，风靡一整个暑假，无人不知无人不上头。而谭松韵饰演的“范晓萤”，人气比主角还高。这部剧中，“范晓萤”一角的定位依然是十七八的小女孩。\r\n![图片](/api/file/getImage/202301/S2UKIwJH7RfKMh0nRkV2Z7GF9adh2I.png)', '1', '20岁，她在《甄嬛传》中演豆蔻少女“淳贵人”，少女的天真烂漫被她完美诠释，从而收获首波关注。', '2023-01-16 09:59:37', '2023-01-16 10:15:16', '42', '0', '0', '0', '0', '1');
INSERT INTO `forum_article` VALUES ('U2zRa4cFPwLF4rR', '0', '', '10002', '摸鱼', '7437465925', '测试账号02', '未知', '38岁凤姐现状：异国他乡漂泊十年，孤苦无依，网友“自作自受”', '202301/M5Apq2fXSfqQ9Lu.png', '<p data-v-md-line=\"1\">在贴吧和博客刚刚诞生的那几年，一位凹着“S型”造型的美女，横空出世，她就是来自陕西的芙蓉姐姐。<br>\r\n<img src=\"/api/file/getImage/202301/RxjFhBwN6XgR8Yy5V8po7UvkKoyK2W.png\" alt=\"图片\"><br>\r\n她以极其自恋的照片和无比自信的文字，在未名和水木的BBS上成为人尽皆知的红人。</p>\r\n<p data-v-md-line=\"5\">2005年，有好事的网友将她的文字和照片转载到彼时火热的猫扑和天涯上，让她成为了全网皆知的红人。</p>\r\n<p data-v-md-line=\"7\">无数人调侃她的长相，嘲讽她的舞姿，也有无数人坐等着她的博客更新。</p>\r\n<p data-v-md-line=\"9\">一时间，她的新闻和热搜霸榜各大门户网站的娱乐版块。</p>\r\n<p data-v-md-line=\"11\">她以”扮丑”和“低俗审美”的方式成为了许多无聊看客茶余饭后的谈资，也成了互联网上的“明星”。</p>\r\n<p data-v-md-line=\"13\">4年后，来自重庆的罗玉凤试图以同样的方式完成从“素人”到“明星”的转变。<br>\r\n<img src=\"/api/file/getImage/202301/1RyNjXxTr2F5Kb7KnwPdWCbxiLQvu2.png\" alt=\"图片\"></p>\r\n', '在贴吧和博客刚刚诞生的那几年，一位凹着“S型”造型的美女，横空出世，她就是来自陕西的芙蓉姐姐。\r\n![图片](/api/file/getImage/202301/RxjFhBwN6XgR8Yy5V8po7UvkKoyK2W.png)\r\n她以极其自恋的照片和无比自信的文字，在未名和水木的BBS上成为人尽皆知的红人。\r\n\r\n2005年，有好事的网友将她的文字和照片转载到彼时火热的猫扑和天涯上，让她成为了全网皆知的红人。\r\n\r\n无数人调侃她的长相，嘲讽她的舞姿，也有无数人坐等着她的博客更新。\r\n\r\n一时间，她的新闻和热搜霸榜各大门户网站的娱乐版块。\r\n\r\n她以”扮丑”和“低俗审美”的方式成为了许多无聊看客茶余饭后的谈资，也成了互联网上的“明星”。\r\n\r\n4年后，来自重庆的罗玉凤试图以同样的方式完成从“素人”到“明星”的转变。\r\n![图片](/api/file/getImage/202301/1RyNjXxTr2F5Kb7KnwPdWCbxiLQvu2.png)', '1', '在贴吧和博客刚刚诞生的那几年，一位凹着“S型”造型的美女，横空出世，她就是来自陕西的芙蓉姐姐。', '2023-01-16 10:00:18', '2023-01-16 10:15:04', '45', '0', '0', '0', '0', '1');
INSERT INTO `forum_article` VALUES ('uT4FJLoDXSJhNYo', '10003', 'Vue', '10000', '前端', '1890524956', '测试账号', '未知', '模板语法', null, '<p data-v-md-line=\"1\">Vue 使用一种基于 HTML 的模板语法，使我们能够声明式地将其组件实例的数据绑定到呈现的 DOM 上。所有的 Vue 模板都是语法层面合法的 HTML，可以被符合规范的浏览器和 HTML 解析器解析。</p>\r\n<p data-v-md-line=\"3\">在底层机制中，Vue 会将模板编译成高度优化的 JavaScript 代码。结合响应式系统，当应用状态变更时，Vue 能够智能地推导出需要重新渲染的组件的最少数量，并应用最少的 DOM 操作。</p>\r\n<p data-v-md-line=\"5\">如果你对虚拟 DOM 的概念比较熟悉，并且偏好直接使用 JavaScript，你也可以结合可选的 JSX 支持直接手写渲染函数而不采用模板。但请注意，这将不会享受到和模板同等级别的编译时优化。</p>\r\n', 'Vue 使用一种基于 HTML 的模板语法，使我们能够声明式地将其组件实例的数据绑定到呈现的 DOM 上。所有的 Vue 模板都是语法层面合法的 HTML，可以被符合规范的浏览器和 HTML 解析器解析。\r\n\r\n在底层机制中，Vue 会将模板编译成高度优化的 JavaScript 代码。结合响应式系统，当应用状态变更时，Vue 能够智能地推导出需要重新渲染的组件的最少数量，并应用最少的 DOM 操作。\r\n\r\n如果你对虚拟 DOM 的概念比较熟悉，并且偏好直接使用 JavaScript，你也可以结合可选的 JSX 支持直接手写渲染函数而不采用模板。但请注意，这将不会享受到和模板同等级别的编译时优化。', '1', null, '2023-01-16 09:34:14', '2023-01-16 09:34:17', '1', '0', '0', '0', '0', '1');
INSERT INTO `forum_article` VALUES ('V4a8RUmYw6X9R0y', '0', '', '10002', '摸鱼', '7437465925', '测试账号02', '未知', '投资仅850万，翻拍战狼，一上映就夺冠，于荣光带来一部生猛新片', '202301/8nsyR6wYBFi2wBL.png', '<p data-v-md-line=\"1\">近些年的内地电影市场，线下院线的发展有所停滞，但是网大电影似乎迎来了一波发展高潮，众多明星都开始转型拍摄网大电影。<br>\r\n<img src=\"/api/file/getImage/202301/NFpVgHDDeMLO7tyycZmd5Wxm7wSuuS.png\" alt=\"图片\"></p>\r\n', '近些年的内地电影市场，线下院线的发展有所停滞，但是网大电影似乎迎来了一波发展高潮，众多明星都开始转型拍摄网大电影。\r\n![图片](/api/file/getImage/202301/NFpVgHDDeMLO7tyycZmd5Wxm7wSuuS.png)', '1', '近些年的内地电影市场，线下院线的发展有所停滞，但是网大电影似乎迎来了一波发展高潮，众多明星都开始转型拍摄网大电影', '2023-01-16 10:01:43', '2023-01-16 10:15:06', '56', '0', '0', '0', '0', '1');

-- ----------------------------
-- Table structure for forum_article_attachment
-- ----------------------------
DROP TABLE IF EXISTS `forum_article_attachment`;
CREATE TABLE `forum_article_attachment` (
  `file_id` varchar(15) NOT NULL COMMENT '文件ID',
  `article_id` varchar(15) NOT NULL COMMENT '文章ID',
  `user_id` varchar(15) DEFAULT NULL COMMENT '用户id',
  `file_size` bigint(20) DEFAULT NULL COMMENT '文件大小',
  `file_name` varchar(200) DEFAULT NULL COMMENT '文件名称',
  `download_count` int(11) DEFAULT NULL COMMENT '下载次数',
  `file_path` varchar(100) DEFAULT NULL COMMENT '文件路径',
  `file_type` tinyint(4) DEFAULT NULL COMMENT '文件类型',
  `integral` int(11) DEFAULT NULL COMMENT '下载所需积分',
  PRIMARY KEY (`file_id`),
  KEY `idx_article_id` (`article_id`),
  KEY `idx_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='文件信息';

-- ----------------------------
-- Records of forum_article_attachment
-- ----------------------------
INSERT INTO `forum_article_attachment` VALUES ('014569155409431', 'RtiXj832TFL4nhW', '1890524956', '425672', '帅照.zip', '0', '202301/TADTC77LNjeO7Bs.zip', '0', '0');

-- ----------------------------
-- Table structure for forum_article_attachment_download
-- ----------------------------
DROP TABLE IF EXISTS `forum_article_attachment_download`;
CREATE TABLE `forum_article_attachment_download` (
  `file_id` varchar(15) NOT NULL COMMENT '文件ID',
  `user_id` varchar(15) NOT NULL COMMENT '用户id',
  `article_id` varchar(15) NOT NULL COMMENT '文章ID',
  `download_count` int(11) DEFAULT '1' COMMENT '文件下载次数',
  PRIMARY KEY (`file_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户附件下载';

-- ----------------------------
-- Records of forum_article_attachment_download
-- ----------------------------

-- ----------------------------
-- Table structure for forum_board
-- ----------------------------
DROP TABLE IF EXISTS `forum_board`;
CREATE TABLE `forum_board` (
  `board_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '板块ID',
  `p_board_id` int(11) DEFAULT NULL COMMENT '父级板块ID',
  `board_name` varchar(50) DEFAULT NULL COMMENT '板块名',
  `cover` varchar(50) DEFAULT NULL COMMENT '封面',
  `board_desc` varchar(150) DEFAULT NULL COMMENT '描述',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `post_type` tinyint(1) DEFAULT '1' COMMENT '0:只允许管理员发帖 1:任何人可以发帖',
  PRIMARY KEY (`board_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10008 DEFAULT CHARSET=utf8mb4 COMMENT='文章板块信息';

-- ----------------------------
-- Records of forum_board
-- ----------------------------
INSERT INTO `forum_board` VALUES ('10000', '0', '前端', null, '前端', '1', '1');
INSERT INTO `forum_board` VALUES ('10001', '0', '后端', null, '后端', '2', '1');
INSERT INTO `forum_board` VALUES ('10002', '0', '摸鱼', null, '摸鱼', '3', '1');
INSERT INTO `forum_board` VALUES ('10003', '10000', 'Vue', null, 'Vue', '1', '1');
INSERT INTO `forum_board` VALUES ('10004', '10000', 'React', null, 'React', '2', '1');
INSERT INTO `forum_board` VALUES ('10005', '10001', 'React', null, 'React', '1', '1');
INSERT INTO `forum_board` VALUES ('10006', '0', '社区管理', null, '社区管理', '4', '0');
INSERT INTO `forum_board` VALUES ('10007', '10006', '规章制度', null, '规章制度', '1', '0');

-- ----------------------------
-- Table structure for forum_comment
-- ----------------------------
DROP TABLE IF EXISTS `forum_comment`;
CREATE TABLE `forum_comment` (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '评论ID',
  `p_comment_id` int(11) DEFAULT NULL COMMENT '父级评论ID',
  `article_id` varchar(15) NOT NULL COMMENT '文章ID',
  `content` varchar(800) DEFAULT NULL COMMENT '回复内容',
  `img_path` varchar(150) DEFAULT NULL COMMENT '图片',
  `user_id` varchar(15) NOT NULL COMMENT '用户ID',
  `nick_name` varchar(20) DEFAULT NULL COMMENT '昵称',
  `user_ip_address` varchar(100) DEFAULT NULL COMMENT '用户ip地址',
  `reply_user_id` varchar(15) DEFAULT NULL COMMENT '回复人ID',
  `reply_nick_name` varchar(20) DEFAULT NULL COMMENT '回复人昵称',
  `top_type` tinyint(4) DEFAULT '0' COMMENT '0:未置顶  1:置顶',
  `post_time` datetime DEFAULT NULL COMMENT '发布时间',
  `good_count` int(11) DEFAULT '0' COMMENT 'good数量',
  `status` tinyint(4) DEFAULT NULL COMMENT '0:待审核  1:已审核',
  PRIMARY KEY (`comment_id`),
  KEY `idx_article_id` (`article_id`),
  KEY `idx_post_time` (`post_time`),
  KEY `idx_top` (`top_type`),
  KEY `idx_p_id` (`p_comment_id`),
  KEY `idx_status` (`status`),
  KEY `idx_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10004 DEFAULT CHARSET=utf8mb4 COMMENT='评论';

-- ----------------------------
-- Records of forum_comment
-- ----------------------------
INSERT INTO `forum_comment` VALUES ('10000', '0', 'RtiXj832TFL4nhW', '自己做沙发', null, '1890524956', '测试账号', '未知', null, null, '0', '2023-01-15 18:01:35', '0', '1');
INSERT INTO `forum_comment` VALUES ('10001', '0', 'RtiXj832TFL4nhW', '带图的评论', '202301/G6f2JlVazmYMLYP.jpeg', '1890524956', '测试账号', '未知', null, null, '0', '2023-01-16 09:26:07', '0', '1');
INSERT INTO `forum_comment` VALUES ('10002', '0', 'RtiXj832TFL4nhW', '我来个评论', null, '7437465925', '测试账号02', '未知', null, null, '0', '2023-01-16 09:54:04', '0', '1');
INSERT INTO `forum_comment` VALUES ('10003', '0', 'RtiXj832TFL4nhW', '啦啦啦啦啦啦啦啦啦啦啦啦', null, '7437465925', '测试账号02', '未知', null, null, '0', '2023-01-16 14:40:53', '0', '1');

-- ----------------------------
-- Table structure for like_record
-- ----------------------------
DROP TABLE IF EXISTS `like_record`;
CREATE TABLE `like_record` (
  `op_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `op_type` tinyint(4) DEFAULT NULL COMMENT '操作类型0:文章点赞 1:评论点赞',
  `object_id` varchar(15) NOT NULL COMMENT '主体ID',
  `user_id` varchar(15) NOT NULL COMMENT '用户ID',
  `create_time` datetime DEFAULT NULL COMMENT '发布时间',
  `author_user_id` varchar(15) DEFAULT NULL COMMENT '主体作者ID',
  PRIMARY KEY (`op_id`),
  UNIQUE KEY `idx_key` (`object_id`,`user_id`,`op_type`) USING BTREE,
  KEY `idx_user_id` (`user_id`,`op_type`)
) ENGINE=InnoDB AUTO_INCREMENT=10001 DEFAULT CHARSET=utf8mb4 COMMENT='点赞记录';

-- ----------------------------
-- Records of like_record
-- ----------------------------
INSERT INTO `like_record` VALUES ('10000', '0', 'RtiXj832TFL4nhW', '7437465925', '2023-01-16 09:53:50', '1890524956');

-- ----------------------------
-- Table structure for sys_setting
-- ----------------------------
DROP TABLE IF EXISTS `sys_setting`;
CREATE TABLE `sys_setting` (
  `code` varchar(10) NOT NULL COMMENT '编号',
  `json_content` varchar(500) DEFAULT NULL COMMENT '设置信息',
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='系统设置信息';

-- ----------------------------
-- Records of sys_setting
-- ----------------------------
INSERT INTO `sys_setting` VALUES ('audit', '{\"commentAudit\":false,\"postAudit\":false}');
INSERT INTO `sys_setting` VALUES ('comment', '{\"commentDayCountThreshold\":50,\"commentIntegral\":1,\"commentOpen\":true}');
INSERT INTO `sys_setting` VALUES ('email', '{\"emailContent\":\"你好，您的邮箱验证码是：%s，15分钟有效\",\"emailTitle\":\"邮箱验证码--EasyBBS\"}');
INSERT INTO `sys_setting` VALUES ('like', '{\"likeDayCountThreshold\":50}');
INSERT INTO `sys_setting` VALUES ('post', '{\"attachmentSize\":1,\"dayImageUploadCount\":50,\"postDayCountThreshold\":50,\"postIntegral\":1}');
INSERT INTO `sys_setting` VALUES ('register', '{\"registerWelcomInfo\":\"社区欢迎你，以后的日子里，有老罗陪伴你一起学编程\"}');

-- ----------------------------
-- Table structure for user_info
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info` (
  `user_id` varchar(15) NOT NULL COMMENT '用户ID',
  `nick_name` varchar(20) DEFAULT NULL COMMENT '昵称',
  `email` varchar(150) DEFAULT NULL COMMENT '邮箱',
  `password` varchar(50) DEFAULT NULL COMMENT '密码',
  `sex` tinyint(1) DEFAULT NULL COMMENT '0:女 1:男',
  `person_description` varchar(200) DEFAULT NULL COMMENT '个人描述',
  `join_time` datetime DEFAULT NULL COMMENT '加入时间',
  `last_login_time` datetime DEFAULT NULL COMMENT '最后登录时间',
  `last_login_ip` varchar(15) DEFAULT NULL COMMENT '最后登录IP',
  `last_login_ip_address` varchar(100) DEFAULT NULL COMMENT '最后登录ip地址',
  `total_integral` int(11) DEFAULT NULL COMMENT '积分',
  `current_integral` int(11) DEFAULT NULL COMMENT '当前积分',
  `status` tinyint(4) DEFAULT NULL COMMENT '0:禁用 1:正常',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `key_email` (`email`),
  UNIQUE KEY `key_nick_name` (`nick_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户信息';

-- ----------------------------
-- Records of user_info
-- ----------------------------
INSERT INTO `user_info` VALUES ('1890524956', '测试账号', 'test@qq.com', '47ec2dd791e31e2ef2076caf64ed9b3d', '1', '我只是一个测试账号而已', '2023-01-15 17:45:46', '2023-01-16 14:43:55', '127.0.0.1', '未知', '13', '13', '1');
INSERT INTO `user_info` VALUES ('7437465925', '测试账号02', 'test02@qq.com', '47ec2dd791e31e2ef2076caf64ed9b3d', '0', '我是测试账号02', '2023-01-16 09:52:31', '2023-01-16 14:36:13', '127.0.0.1', '未知', '18', '18', '1');

-- ----------------------------
-- Table structure for user_integral_record
-- ----------------------------
DROP TABLE IF EXISTS `user_integral_record`;
CREATE TABLE `user_integral_record` (
  `record_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '记录ID',
  `user_id` varchar(15) DEFAULT NULL COMMENT '用户ID',
  `oper_type` tinyint(4) DEFAULT NULL COMMENT '操作类型',
  `integral` int(11) DEFAULT NULL COMMENT '积分',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`record_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10026 DEFAULT CHARSET=utf8mb4 COMMENT='用户积分记录表';

-- ----------------------------
-- Records of user_integral_record
-- ----------------------------
INSERT INTO `user_integral_record` VALUES ('10000', '1890524956', '1', '5', '2023-01-15 17:45:46');
INSERT INTO `user_integral_record` VALUES ('10004', '1890524956', '4', '1', '2023-01-15 18:01:23');
INSERT INTO `user_integral_record` VALUES ('10005', '1890524956', '4', '1', '2023-01-15 18:01:35');
INSERT INTO `user_integral_record` VALUES ('10006', '1890524956', '4', '1', '2023-01-16 09:26:07');
INSERT INTO `user_integral_record` VALUES ('10007', '1890524956', '4', '1', '2023-01-16 09:31:13');
INSERT INTO `user_integral_record` VALUES ('10008', '1890524956', '4', '1', '2023-01-16 09:34:14');
INSERT INTO `user_integral_record` VALUES ('10009', '1890524956', '4', '1', '2023-01-16 09:34:34');
INSERT INTO `user_integral_record` VALUES ('10010', '1890524956', '4', '1', '2023-01-16 09:34:52');
INSERT INTO `user_integral_record` VALUES ('10011', '1890524956', '4', '1', '2023-01-16 09:35:14');
INSERT INTO `user_integral_record` VALUES ('10012', '7437465925', '1', '5', '2023-01-16 09:52:31');
INSERT INTO `user_integral_record` VALUES ('10013', '7437465925', '4', '1', '2023-01-16 09:54:04');
INSERT INTO `user_integral_record` VALUES ('10014', '7437465925', '4', '1', '2023-01-16 09:55:37');
INSERT INTO `user_integral_record` VALUES ('10015', '7437465925', '4', '1', '2023-01-16 09:57:32');
INSERT INTO `user_integral_record` VALUES ('10016', '7437465925', '4', '1', '2023-01-16 09:58:13');
INSERT INTO `user_integral_record` VALUES ('10017', '7437465925', '4', '1', '2023-01-16 09:58:54');
INSERT INTO `user_integral_record` VALUES ('10018', '7437465925', '4', '1', '2023-01-16 09:59:37');
INSERT INTO `user_integral_record` VALUES ('10019', '7437465925', '4', '1', '2023-01-16 10:00:19');
INSERT INTO `user_integral_record` VALUES ('10020', '7437465925', '4', '1', '2023-01-16 10:01:14');
INSERT INTO `user_integral_record` VALUES ('10021', '7437465925', '4', '1', '2023-01-16 10:01:43');
INSERT INTO `user_integral_record` VALUES ('10022', '7437465925', '4', '1', '2023-01-16 10:02:53');
INSERT INTO `user_integral_record` VALUES ('10023', '7437465925', '4', '1', '2023-01-16 10:05:02');
INSERT INTO `user_integral_record` VALUES ('10024', '7437465925', '4', '1', '2023-01-16 10:09:28');
INSERT INTO `user_integral_record` VALUES ('10025', '7437465925', '4', '1', '2023-01-16 14:43:28');

-- ----------------------------
-- Table structure for user_message
-- ----------------------------
DROP TABLE IF EXISTS `user_message`;
CREATE TABLE `user_message` (
  `message_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `received_user_id` varchar(15) DEFAULT NULL COMMENT '接收人用户ID',
  `article_id` varchar(15) DEFAULT NULL COMMENT '文章ID',
  `article_title` varchar(150) DEFAULT NULL COMMENT '文章标题',
  `comment_id` int(11) DEFAULT NULL COMMENT '评论ID',
  `send_user_id` varchar(15) DEFAULT NULL COMMENT '发送人用户ID',
  `send_nick_name` varchar(20) DEFAULT NULL COMMENT '发送人昵称',
  `message_type` tinyint(4) DEFAULT NULL COMMENT '0:系统消息 1:评论 2:文章点赞  3:评论点赞 4:附件下载',
  `message_content` varchar(1000) DEFAULT NULL COMMENT '消息内容',
  `status` tinyint(4) DEFAULT NULL COMMENT '1:未读 2:已读',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`message_id`),
  UNIQUE KEY `idx_key` (`article_id`,`comment_id`,`send_user_id`,`message_type`) USING BTREE,
  KEY `idx_received_user_id` (`received_user_id`),
  KEY `idx_status` (`status`),
  KEY `idx_type` (`message_type`)
) ENGINE=InnoDB AUTO_INCREMENT=10005 DEFAULT CHARSET=utf8mb4 COMMENT='用户消息';

-- ----------------------------
-- Records of user_message
-- ----------------------------
INSERT INTO `user_message` VALUES ('10000', '1890524956', null, null, null, null, null, '0', '社区欢迎你，以后的日子里，有老罗陪伴你一起学编程', '2', '2023-01-15 17:45:46');
INSERT INTO `user_message` VALUES ('10001', '7437465925', null, null, null, null, null, '0', '社区欢迎你，以后的日子里，有老罗陪伴你一起学编程', '2', '2023-01-16 09:52:31');
INSERT INTO `user_message` VALUES ('10002', '1890524956', 'RtiXj832TFL4nhW', '第一个帖子，带图，带附件', '0', '7437465925', '测试账号02', '2', null, '1', '2023-01-16 09:53:50');
INSERT INTO `user_message` VALUES ('10003', '1890524956', 'RtiXj832TFL4nhW', '第一个帖子，带图，带附件', '10002', '7437465925', '测试账号02', '1', '我来个评论', '1', '2023-01-16 09:54:04');
INSERT INTO `user_message` VALUES ('10004', '1890524956', 'RtiXj832TFL4nhW', '第一个帖子，带图，带附件', '10003', '7437465925', '测试账号02', '1', '啦啦啦啦啦啦啦啦啦啦啦啦', '1', '2023-01-16 14:43:28');
