git ```
	1、微信小程序学习：
		json配置：pages,window,tabBar,networkTimeout,debug
		pages:
		{
			1\接受一个数组，每一项都是字符串，来指定小程序由哪些页面组成。每一项代表对应页面的【路径+文件名】信息，
			数组的第一项代表小程序的初始页面。小程序中新增/减少页面，都需要对 pages 数组进行修改。
			文件名不需要写文件后缀，因为框架会自动去寻找路径下 .json, .js, .wxml, .wxss 四个文件进行整合。


		
		}
		window用于设置小程序的状态栏、导航条、标题、窗口背景色。navigationBarBackgroundColor(导航栏背景色)
		navigetionBarTextStyle 导航栏标题颜色，仅支持 black/white
		navigationBarTitleText导航栏标题文字内容
		backgroundColor窗口的背景色
		backgroundTextStyle	下拉背景字体、loading 图的样式，仅支持 dark/light
		enablePullDownRefresh 是否开启下拉刷新，详见页面相关事件处理函数。
		onReachBottomDistance页面上拉触底事件触发时距页面底部距离，单位为px



		wechart progrem data 

		js中使用Page 返回  例子：
			Page({
				data:{
					msg:'zhangsan'
				}
			})

		指令使用变量：

			wechart：<view class="{{class}}" wx-if="{{isok}}"> {{ message+name }} </view>

			Page({
  data:{
    message:'张三',
    name:"里斯",
    class:"zhangsan",
    isok:true
  }
})



```
```
	以下数值可以使用数据绑定进行渲染：
		data
		组件属性
		控制属性
		关键字（<checkbox checked="{{false}}"> </checkbox>）  在微信中直接写false会被解析为字符串
		运算（三元运算、算数运算、逻辑判断、字符串运算、对象输出、数组输出）

```
```

		事件：
		







```