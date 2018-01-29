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
            axios.get('http://localhost:8081/static/data.json').then((data) => {
                commit('setdata', data.data);
            })
        }
    },
    mutations: {

        setdata(state, data) {
            state.person = data.person2[1];
        }
    }
})