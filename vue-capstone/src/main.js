import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
import * as VueGoogleMaps from "vue2-google-maps";

Vue.use(VueGoogleMaps, {
  load: {
    key: "AIzaSyAaSp0LHmOUe9IZWjQktQ0DhKgj2Id_QtE",
    libraries: "places" // necessary for places input
  }
});



Vue.config.productionTip = false

new Vue({
  router,
  store,
  VueGoogleMaps,

  render: h => h(App)
}).$mount('#app')
