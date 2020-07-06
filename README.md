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