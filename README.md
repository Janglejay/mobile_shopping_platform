# mobile_shopping_platform

基于Flutter开发的移动购物平台

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

### 修复bug:分类第一次打开没有品牌信息

### 修复bug:品牌选择反白显示

### 修复bug:加上“全部”子类

在状态改变之前加上全部这个品牌类

### 修复bug：height:1000高度溢出

利用Expanded修复溢出bug

### 修复bug:点击全部类别控制台报错问题