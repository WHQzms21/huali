import FooterNav from './FooterNav.vue'
import HeaderNav from './HeaderNav.vue'
import inputName from './inputName.vue'

const Loading = {
  install:function(Vue){
    Vue.component('FooterNav',FooterNav)
    Vue.component('HeaderNav',HeaderNav)
    Vue.component('inputName',inputName)
  }
}

export default Loading