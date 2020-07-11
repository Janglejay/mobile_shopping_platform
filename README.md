# mobile_shopping_platform

基于`Flutter`开发的移动购物平台

# 项目技术栈：

`flutter v1.17.4`、`Dio v3.0.9`、`flutter_swiper v1.1.6`、`flutter_screenUtil v2.1.0`、`url_launcher v5.4.11`、`flutter_easyrefresh v2.1.1`、`fluttertoast v5.0.1`、`shared_preferences v0.5.8`、`fluro: v1.6.3`

# 项目演示

首页效果图：https://s1.ax1x.com/2020/07/11/U1JGZQ.gif

分类页效果图：https://s1.ax1x.com/2020/07/11/U1GbvT.gif

购物车页面效果:https://s1.ax1x.com/2020/07/11/U1JeIA.gif

<figure class="third">     <img src="https://s1.ax1x.com/2020/07/11/U1JGZQ.gif"  width="260">     <img src="https://s1.ax1x.com/2020/07/11/U1GbvT.gif"  width="260">     <img src="https://s1.ax1x.com/2020/07/11/U1JeIA.gif"  width="260"> </figure>

# 首页开发

## 2020/7/3
基于Flutter的`BottomNavigationBar`实现首页的下导航

## 2020/7/4

1. 基于第三方组件`Dio v3.0.9`实现通过网络请求拉取图片

2. 基于第三方组件`flutter_swiper v1.1.6`实现轮播图

3. 完成了上部分导航栏的制作

4. 基于第三方组件`flutter_screenUtil v2.1.0`完成了图片大小及布局的控制

5. 基于第三方组件`url_launcher v5.4.11`实现点击跳转网页或者拨打电话功能

6. 完成了商品推荐的`ListView`，支持横向滚动

7. 基于混入`AutomaticKeepAliveClientMixin+IndexStack`保存页面状态（也可以用PageView支持滑动）
8. 完成了楼层布局设计

### Json处理问题

json.decode(String s);是为了将字符串转成相应的对象

而如果你所要转换的已经是对象了，就直接用自己定义的类进行转换即可

## 2020/7/5

1. 完成get网络请求方法的封装
2. 基于`Warp`组件实现流式布局
3. 基于第三方组件`flutter_easyrefresh v2.1.1`实现上拉加载效果

### 修复bug：GridView与上拉加载冲突的问题

GridView自带回弹效果

用`  physics: NeverScrollableScrollPhysics(),`禁用GridView的回弹效果

# 分类页面开发

## 2020/7/6

1. 完成分类页面后端接口调试
2. 实现商品分类的类别和品牌侧边栏
3. 基于`Provide`实现类别与品牌的联动
4. 基于`ListView`实现商品列表显示
5. 实现大类切换，商品列表变换的交互效果
6. 分类品牌的高亮切换
7. 实现品牌切换，商品列表变换的交互效果
8. 基于`easy_refresh`实现上拉加载与加载结束控制
9. 基于第三方组件`fluttertoast v5.0.1`实现下拉加载到底的提示，加强交互效果
10. 利用`shared_preferences v0.5.8`进行持久化 将购物车的状态进行持久化
### 修复bug:分类第一次打开没有品牌信息

### 修复bug:品牌选择反白显示

### 修复bug:加上“全部”子类

在状态改变之前加上全部这个品牌类

### 修复bug：height:1000高度溢出

利用Expanded修复溢出bug

### 修复bug:点击全部类别控制台报错问题

# 商品详细页面开发
## 2020/7/11
1. 利用`scorllController`来使得切换品牌能回到开始状态
```dart
  try {
        if (bp.page == 1) {
          //将列表放在最上面
          //jump到最上面
          //double值
          scorllController.jumpTo(0.0);
        }
      } catch (e) {
        print('第一次进入页面要catch');
      }
```
2. 使用第三方组件`fluro: v1.6.3`管理全局路由
main中初始化
handler编写
总体配置 根路径，路由规则
路由静态化
注册到顶层 在app build中，app中注册
3. UI与业务逻辑分离
获取数据的方法放在Provide 中
4. 完成商品详细页的商品展示部分
5. 利用Stack层叠组件来制作底部工具栏
6. 完成购买按钮

# 购物车页面开发
## 2020/7/11

1. 点击添加到购物车功能实现
2. 建立购物车的数据模型。利于维护
3. 改写购物城的Provide，与数据模型建立关联
4. 进行购物车页面UI布局
5. 完成购物车底部结算导航
6. 商品数量控制区域,购物车页面布局完成
7. 完成删除购物商品的功能
8. 计算总价功能
9. 复选和全选
10. 购物车增加删除功能完成
11. 完善详情页跳转和结算功能
12. 添加购物车按钮上方的显示数字小图标(气泡效果，stack上再加stack)

### 修复bug:总是多加载一页
在brand导航栏点击刷新页面的时候要page++
# 购物车页面开发
## 2020/7/11

1. 会员中心布局
2. 个人头像布局完成

# 项目完成

本项目仍会持续更新。