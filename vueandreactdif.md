# vue 和 react 学习 异同点
### 本文不做两个框架比较，只对比了两个框架的语法对比，不代表任何观点，盗版必究，本人唯一qq：421217189 欢迎大家一起来学习探讨，壮我大前端
## 先说一下两个框架的中文文档 
### [Vue](https://cn.vuejs.org) 
### [react](https://doc.react-china.org) 
` 可以点击直接前往 `
## 安装
### vue
```
$ vue init webpack my-project
$ cd my-project
$ npm install
$ npm run dev
```
### react
```
$ create-react-app my-app
$ cd my-app/
$ npm start
```
---
## 修改端口
### vue
/config/index.js/

![Alt text](file:///Users/a123456/Desktop/%E5%AD%A6%E4%B9%A0/2.png)
### react
/package.json

![Alt text](file:///Users/a123456/Desktop/%E5%AD%A6%E4%B9%A0/1.png)

## hellow world 展示实例生成
### vue
```
import Vue from 'vue'
new Vue({
  el: '#app',
  template:`
    <h1> hello world </h1>
  `
})
```
### react
```
import React from 'react'
import ReactDOM from 'react-dom'

ReactDOM.render(
    <h1>hello world</h1>,
    document.getElementById('root')
)
```
---
## dev 运行方式
### vue
* npm run dev
### react
* npm start
---
## 变量的使用
### vue
```
import Vue from 'vue'
new Vue({
  el: '#app',
  data(){
    return {
      msg: 'hello world',
    }
  },
  template:`
    <h1> {{ msg }} </h1>
  `
})
```
### react
```
import React from "react";
import ReactDOM from "react-dom";

class State extends React.Component{
    constructor(){
        super();
        this.state={
            msg:'this is react'
        }
    }
    render(){
        return(
            <div>{this.state.msg}</div>
        )
    }
}
ReactDOM.render(
   <State/>,
    document.getElementById('root')
)
```
---
## 组件props的使用
### vue
##### main.js
```
import Vue from 'vue'
import app from './components/app.vue'
new Vue({
  el: '#app',
  components:{
    app,
  },

  template:'<app zhangsan="zhangsan"/>'
})

```
#### app.vue
```
<template>
  <h1>{{zhangsan}}</h1>
</template>

<script>
export default {
    props:[
        'zhangsan'
    ],
    data(){
        return {
            msg:'hello world'
        }
    }
}
</script>

<style>

</style>

```
### react
#### index.js

```
import React from "react";
import ReactDOM from "react-dom";
import Dome from "./reactDome.js"
ReactDOM.render(
    <Dome msg = "this is react"/>,
    document.getElementById('root')
)
```
#### reactDome.js

```
import React from "react";
class State extends React.Component {
    constructor(props) {
        super(props);
    }
    render() {
        return (
            <div>{this.props.msg}</div>
        )
    }
}
export default State;
```
---
## 组件props默认值、验证
### react
```
import React from "react";
import ReactDOM from "react-dom";

class State extends React.Component {
    static defaultProps = {
        msg: 'I am react defaultProps' 
    }
    constructor(props) {
        super(props);
    }
    render() {
        return (
            <div>{this.props.msg}</div>
        )
    }
}
ReactDOM.render(
    <State/>,
    document.getElementById('root')
)
```
### vue
### app.vue
```
<template>
    <div>{{ msg }}</div>  
</template>
<script>
  export default {
     props: {
        msg: {
            type: Number,
            default: 0,
        }
     }
  }
</script>
```
### main.js
```
import Vue from 'vue'
Vue.config.productionTip = false
import App from '../src/components/app.vue'
/* eslint-disable no-new */
new Vue({
  el: '#app',
  template: '<App msg="dsadsda"/>',
  components: { App }
})

```
---
## class和style的赋值
### react
```
import React from "react";
import ReactDOM from "react-dom";
require('./App.css')
class From extends React.Component{
    constructor(){
        super();
        this.state = {
            className : 'mystyle'
        }
    }
    render() {
        let style = {
            color:'#333',
            fontSize:50,
        }
        return(
            <div>
                
                <p class={this.state.className}>11111</p>
                <p style={style}>2222</p>
            </div>
        )
    }
}

ReactDOM.render(
    <From></From>,
    document.getElementById('root')
);
```
### vue
```
<template>
    <div>
      <p :class="className">
        class动态
      </p>
      <p :style = "mystyle">
        style动态
      </p>
    </div>
</template>

<script>
export default {
  data(){
    return {
      className : 'mystyle',
      mystyle : {
        color:'#333',
        fontSize:'50px',
      }
    }
  }
}
</script>

<style>
.mystyle{
  color:#f00;
}
</style>

```
* 在这里有一点要记住，react可以自动增加px尾缀，vue不会
---
## 事件
### react
```
import React from "react";
import ReactDOM from "react-dom";
class App extends React.Component {
    constructor(){
        super();
        this.clickfunc = this.clickfunc.bind(this);
        this.state = {
            tar : true,
        }
    }
    clickfunc(){
       this.setState({
           tar:!this.state.tar
       })
    }
    render() {
        return (
            <div onClick={this.clickfunc}>{this.state.tar?'点我':'再点我'}</div>
        )
    }
}
ReactDOM.render(
    <App></App>,
    document.getElementById('root')


)
```
### vue
```
<template>
  <button @click="clickfunc">{{ msg }}</button>
</template>

<script>
export default {
  data(){
    return {
        msg : '点我',
        tar : true,
    }
   
  },
  methods:{
    clickfunc(){
      
      this.msg = this.tar?'在点我':'点我';
      this.tar = !this.tar;
    }
  }
}
</script>
```
---
## 表单双向绑定
### react
```
import React from "react";
import ReactDOM from "react-dom";
class Module extends React.Component {
    constructor(){
        super();
        this.state = {
            value:'react is good',
        };
        this.changeFrom = this.changeFrom.bind(this);
    }
    changeFrom(event){
        this.setState({
            value : event.target.value
        })
    }
    render(){
        return (
            <div>
                <input value = {this.state.value} onChange = {this.changeFrom}/>
                <p>{this.state.value}</p>
            </div>
        )
    }
}

ReactDOM.render(
    <Module></Module>,
    document.getElementById('root')
);
```
### vue
```
<template>
  <div>
    <input v-model="value"/>
    <p>{{ value }}</p>
  </div>
</template>

<script>
export default {
  data(){
    return {
      value:"vue is good"
    }
  }
}
</script>

<style>

</style>

```
---

## 条件渲染模版
### react 
```
import React from "react";
import ReactDOM from "react-dom";

class Module1 extends React.Component{
    render(){
        return (
            <div>我是模版1</div>
        )
    }
}
class Module2 extends React.Component {
    render() {
        return (
            <h1>我是模版2</h1>
        )
    }
}
class Module extends React.Component{
    constructor(){
        super();
        this.state = {
            tar : true
        }
        this.changeModule = this.changeModule.bind(this);
    }
    componentWillUpdate(){
        console.log(this.state.tar)
    }
    changeModule(){
        this.setState(s => ({
            tar : !s.tar
        }))
        // console.log(this.state.tar);
        
    }
    render(){
        if(this.state.tar){
            
            return (
                <div>
                    <button onClick={this.changeModule}>切换模版</button>
                    <Module1/>
                </div>
            )
        }else{
            return (
                <div>
                    <button onClick={this.changeModule}>切换模版</button>
                    <Module2 />
                </div>
            )
        }
 
           
    
    }
}
ReactDOM.render(
    <Module/>,
    document.getElementById('root')
)
```

### vue
#### App.vue
```
<template>
    <div>
      <div v-if="show">
          我是模版一
      </div>
      <div  v-if="!show">
        我是模版二
      </div>
      <button @click="changeModule">模版切换</button>
    </div>
</template>

<script>
export default {
data(){
  return {
    show:false
  }
},
methods:{
  changeModule(){
    this.show = !this.show
  }
}
}
</script>

<style>

</style>

```
#### mainjs
```
    import Vue from 'vue'
    Vue.config.productionTip = false
    import App from './App.vue'
/* eslint-disable no-new */
    let cpt=new Vue({
    el: '#app',
    template: '<App/>',
    components: { App },
})
```
---
## 列表渲染
### react
> 这里写了一个点击按钮增加一个的方法，也不知道当时怎么想的  反正就是写了不需要的小伙伴删了就好
```
import React from "react";
import ReactDOM from "react-dom";
class Module extends React.Component {
    constructor(props) {
        super(props);
    }
    render() {
        
        var listtpl = this.props.listarr.map((todo, index) => 
            <li key={index}>{todo}</li> 
        )
        return (
           <ul>{listtpl}</ul>
        )       
    }
}
class AddModule extends React.Component{
    constructor(){
        super();
        this.state={
            listarr: [1, 2, 3, 4, 6, 7],
        }
        this.add=this.add.bind(this);
    }
    add(){
        
        this.setState(s =>({
            listarr: s.listarr.concat([this.state.listarr.length+2])
        }))
        console.log(this.state.listarr)
       
    }
    render(){
        return (
            <div>
                <Module listarr={this.state.listarr}/>
                <button onClick = {this.add} >添加</button>
            </div>
        )
    }
}

ReactDOM.render(
    <AddModule/>,
    document.getElementById('root')
)
```
### vue
```
<template>
    <ul>
      <li v-for="(i,k) in arr">{{k+' => '+i}}</li>
    </ul>
</template>

<script>
export default {
  data(){
    return {
      arr:[1,2,3,5,6,7]
    }
  }
}
</script>
```
---
## 组件声明周期函数
### react
```
import React from "react";
import ReactDOM from "react-dom";
import { setInterval } from "timers";


class State extends React.Component {




    static defaultProps = {
        msg: 'I am react defaultProps' 
    };
   //项目一开始调用
    constructor(props) {
        super(props);
        
        this.state = {
            msg:11,
            msg2: props.msg
           
        }
        this.func = this.func.bind('this')
    }
    func(){
        console.log(1);
    }
    //在初始化渲染执行之前立刻调用
    componentWillMount(){
        console.log('组件将要挂载');
        //在这里使用setstate会让实例使用这个state
        this.setState({
            msg: 'react componentWillMount'
        });
    }
    //在初始化渲染执行之后立刻调用一次，
    componentDidMount(){
        console.log('组件已经挂载完成');
        
    }
    //组件更新时候调用
    componentWillReceiveProps(){
        console.log('组件props更改了');
        this.setState({
            msg2 : this.props.msg
        })
    }
    shouldComponentUpdate(){
        console.log('组件props更改了，即将渲染了')
        //需要提供返回值为true或者false  false就不渲染了

        return true;
        // return false;
    }
    //在shouldComponentUpdate之后
    componentWillUpdate(){
        console.log('现在有一个props或者state更新了')
    }
    componentDidUpdate(){
        console.log('props更新完毕了')
    }
    componentWillUnmount(){
        console.log('组件从dom移除了');
    }


    render() {
        return (

            <div>{this.state.msg +'+++++++' +this.state.msg2}</div>
            
        )
    }
}

class App extends React.Component{
    constructor(){
        super();
        this.state =  {
            msg:'hellow',
        };
        this.handleChange = this.handleChange.bind(this);
    }
    handleChange(event) {
        this.setState({ msg: event.target.value });
    }
    render(){
       return (
           <div>
               <input type="text" value={this.state.msg} onChange={this.handleChange} />
              
               <State msg = {this.state.msg}/>
           </div>
       )
    }
}


ReactDOM.render(
    
    <App/>,
    document.getElementById('root')
)
```
### vue
```
<template>
  <div>
      <p>Data内容{{ msg }}</p>
      
      <input type="text" v-model.lazy="msg">
  </div>
</template>

<script>
export default {
  data(){
    return {
      msg:1,
    }
  },
    beforeCreate(){
    console.log('组件实例话');
  },
 
  beforeMount(){
    console.log('在挂载完成之后被调用');
  },
   created(){
    console.log('组件挂载完成之后被调用，但是比beforeMount更早一点');
  },
  mounted(){
     this.$nextTick(function () {
      console.log('推荐在nextTick里面走函数，防止子组件没挂载完成');
  })
    console.log(this.$el);
   
  },
  beforeUpdate(){
    console.log('数据更新开始了,'+this.msg);
  },
  updated(){
    console.log('数据更新完成了')
  },
  beforeDestroy(){
    console.log('实例销毁之前之前调用')
  },
   beforeDestroy(){
    console.log('Vue 实例销毁后调用')
  }
}
</script>

<style>

</style>

```