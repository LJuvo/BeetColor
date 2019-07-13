import AntColor from './color.vue'

AntColor.install = function(Vue) {
    Vue.component(AntColor.name, AntColor)
}

export default AntColor