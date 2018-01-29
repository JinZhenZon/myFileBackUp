import vuex from "vuex";
import vue from "vue";
import axios from 'axios'

vue.use(vuex);
export default new vuex.Store({
    state: {
        person: {
            name: "zahngsan",
            age: "16"
        }
    },
    actions: {
        setdata({ commit }) {
            axios({
                methods: "post", //GET POST request header delete options put patch
                url: "../../static/data.json",
                headers: { "Content-Type": 'application/x-www-form-urlencoded; charset=UTF-8' }
            }).then((data) => {
                commit('setdata', data.data);
            })
        }
    },
    mutations: {

        setdata(state, data) {
            state.person = data.person2[1];
            // console.log(data);
        }
    }
})