import Vue from 'vue'
import App from './App.vue'
import BeetColor from '../packages/index'

Vue.use(BeetColor)

Vue.config.productionTip = false

new Vue({
    render: h => h(App)
}).$mount('#app')