# vuex
##### 五大模块：
## state 数据
```
在vuex中调用：state.xxx;

组件内使用：this.$store.state.xxxx

mapstate函数:
computed: mapState([
  // 映射 this.count 为 store.state.count
  'count'
])
```

## mutation 同步方法
```
在vuex中调用 store.commit('func',{arguments}) 第一个为方法名，第二个为载荷（参数），为一个对象。
在组件调用  this.$store.commit('func',{arguments}) 同上，
mapMutation:
methods:{
  ...mapMutation([
    "func",
    func1:"func"
    ]) 
}
```

## action 异步方法
```
异步方法调用同步方法，而不是直接去更改state的值！
例如：
mutation:{
  mutationfunc(){
    //dosomething
  }
}
action:{
/*  actionfun(store){
    store.commit('mutationfunc')
  }*/
简写：
es6解构
actionfun({commit}){
  commit("mutationfunc");
}
}

action 触发方式：
   store里面：store.dispatch('actionfun');
  组件里面：this.$store.dispatch('actionfun');
  mapActions:
  methods:{
    ...mapActions([
      'actionfun',
      func:"actionfun"
    ])
  }
```

## getters 过滤
```
  与vue过滤属性几乎一致：调用方法：
  store：store.getters.doneTodos
  组件里面：this.$store.getters.doneTodos
  mapGetters:
  computed:{
    ...mapGetters([
      'getters',
      othergetters:"getters",
    ])
  }
```
## Module vuex分模块
```
  例子： 
  new Vuex.Store({
  modules: {
    a: moduleA,
    b: moduleB
  }
})
调用：store.state.a; 可以获得moduleA的状态
组件内 this.$store.state.a;
对于模块内部的 mutation 和 getter，接收的第一个参数是模块的局部状态对象。
对于模块内部的 action，局部状态通过 context.state 暴露出来，根节点为context.rootState：
对于模块内部的 getter，根节点状态会作为第三个参数暴露出来

默认情况下： action、mutation 和 getter 是注册在全局命名空间的（也就是调用时候和全局一样调用），可以通过namespaced: true（在module模块命名空间内加），设置所有action、mutation、getter设置为命名空间的。通过调用命名空间才可以触发，


在命名空间模块内访问全局内容（Global Assets）（官网）




```
## 模块动态注册的方法：
```
// 注册模块 `myModule`
store.registerModule('myModule', {
  // ...
})

// 注册嵌套模块 `nested/myModule`
store.registerModule(['nested', 'myModule'], {
  // ...
})
之后就可以通过 store.state.myModule 和 store.state.nested.myModule 访问模块的状态。

```
## 模块卸载的方法：store.unregisterModule(moduleName)
## vuex api:https://vuex.vuejs.org/zh-cn/api.html

-
-
-
-
-


# vue-router : 
## 动态路由匹配
```
使用冒号
例子：
const router = new VueRouter({
  router:[
    {
      path:'/index/:id',component:index,
    }
  ]
})


可以通过beforeRouteUpdate(to,from,next)钩子来获取路由变化

```
## 嵌套路由：
```
例子：
const router = new VueRouter({
  router:[
    {
      path:'/father',
      component:index,
      children:[
        {
          //地址是：/father/children
          path:'children',
          component:children,
        }
      ]
    }
  ]
})
以 / 开头的嵌套路径会被当作根路径。
```
## 操作浏览器地址
```
 router.push        组件内  this.$router.push        导航到指定的url（会在历史记录中添加当前url）
 router.replace     组件内  this.$router.replace     导航到指定的url（不会在历史记录中添加当前url）
 router.go          组件内  this.$router.go          后退或者前进多少步

 以上方法同js中window.history
```
## 命名视图
```
<router-view name = "a"/>
可以在路由中设置渲染到指定视图
const router = new VueRouter({
  router :[
    {
      path:"/zhangsan",
      component:[
        a:A-view,
        default:default-view,
      ]
    }
  ]
})
```
## History 模式: mode: 'history'mutation

## vue-router 守卫（生命周期函数）：
 ```
 全局导航：前面都需要加router
 一、beforeEach ： 前置守卫；参数：
  to: Route: 即将要进入的目标 路由对象
  from: Route: 当前导航正要离开的路由
  next: Function: 一定要调用该方法来 resolve 这个钩子。执行效果依赖 next 方法的调用参数。
二、beforeResolve 在所有组件内守卫和异步路由组件被解析之后
三、afterEach 全局后置钩子

组件内导航：
beforeRouteEnter：在实例创建以前调用，
beforeRouteUpdate：在当前路由改变，但是该组件被复用时调用
beforeRouteLeave 导航离开该组件的对应路由时调用


 ```
 ## 完整的导航解析流程
 ```
1\导航被触发
2\在失活的组件里调用离开守卫。
3\调用全局的 beforeEach 守卫。(beforeEach)
4\在重用的组件里调用 beforeRouteUpdate 守卫 (2.2+)。
5\在路由配置里调用 beforeEnter。
6\解析异步路由组件。
7\在被激活的组件里调用 beforeRouteEnter。
8\调用全局的 beforeResolve 守卫 (2.5+)。
9\导航被确认。
10\调用全局的 afterEach 钩子。
11\触发 DOM 更新。
12\用创建好的实例调用 beforeRouteEnter 守卫中传给 next 的回调函数。
```
## 滚动行为
```
scrollBehavior(to,from,savedPosition){
  return { x: 0, y: 0 }
}
```

## 路由懒加载
```
const Foo = () => import('./Foo.vue')
```

## vue-loader sass/less/es6等转化
## vue+axios 
```
在vue中axios不支持use可以使用一下两种方法进行写入：
1\Vue.prototype.$http = axios

2\在 Vuex 中封装
  actions: {
    // 封装一个 ajax 方法
    saveForm (context) {
      axios({
        method: 'post',
        url: '/user',
        data: context.state.test02
      })
    }
  }


axios.get(url[, config])
axios.post(url[, data[, config]])
axios.request(config)
axios.delete(url[, config])
axios.head(url[, config])
axios.put(url[, data[, config]])
axios.patch(url[, data[, config]])
//多重并发
function getUserAccount(){
    return axios.get('/user/12345');
}

function getUserPermissions(){
    return axios.get('/user/12345/permissions');
}

axios.all([getUerAccount(),getUserPermissions()])
    .then(axios.spread(function(acc,pers){
        //两个请求现在都完成
    }));
//拦截器

axios.interceptors.request.use(function(config){
    //在请求发送之前做一些事
    return config;
},function(error){
    //当出现请求错误是做一些事
    return Promise.reject(error);
});

//添加一个返回拦截器
axios.interceptors.response.use(function(response){
    //对返回的数据进行一些处理
    return response;
},function(error){
    //对返回的错误进行一些处理
    return Promise.reject(error);
});


今天做到了axios取json并放到vuex上








```
## 预写： vue-devtools google调试vue插件
```
  1、github下载源码（无法翻墙的做法），
  https://github.com/vuejs/vue-devtools
  2、下载好后进入vue-devtools-master工程 执行cnpm install, 下载依赖
  3、执行npm run build，编译源程序。
  4、修改shells/chrome目录下的mainifest.json 中的persistent为true
  5、打开谷歌浏览器的设置--->扩展程序，并勾选开发者模式
  6、然后将刚刚编译后的工程中的shells目录下，chrome的整个文件夹直接拖拽到当前浏览器中，并选择启用，即可将插件安装到浏览器。
  7、入口文件加上Vue.config.devtools = true

  8、打开一个已有的vue项目，运行项目，然后在浏览器中--->设置--->更多工具--->开发者工具，进入调试模式，点击vue
```
## github提交项目流程
```
1 、第一步： 建立本地仓库cd到你的本地项目根目录下，执行git命令
2、git init
3、git add .
4、git commit -m “注释"
5、git log（如果有则添加缓存区成功）
6、git show (检测是否添加的对)
7、git remote add origin github地址
8、git push -f origin master
```
## github增加内容
```
1、git add .
2、git commit
3、git push -f origin master
```