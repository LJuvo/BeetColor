import BeetColor from './color.vue'

BeetColor.install = function(Vue) {
    Vue.component(BeetColor.name, Textarea)
}

export default BeetColor