const IP = "192.168.1.100";
const _homePageUrl = "http://${IP}:8000/homepage";
const _categoryPageUrl = "http://${IP}:8000/category";

const GETINFORMATHION = _homePageUrl + "/information"; //首页基本信息
const GETHOTGOODS = _homePageUrl + "/hotgoods"; //首页下拉加载信息

const GETCATEGORY = _categoryPageUrl + "/categories"; //分类商品所有类别
const GETBRANDS = _categoryPageUrl + "/categories/brands"; //一个分类下的所有品牌
const GETALLGOODS = _categoryPageUrl + "/categories/goods"; //一个分类下的所有品牌
const GETBANDGOODS =
    _categoryPageUrl + "/categories/brands/goods"; //一个分类下某个品牌的所有商品
const GETGOODS = _categoryPageUrl + "/goods"; //获取某个商品的详细信息
