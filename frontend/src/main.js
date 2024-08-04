import { createApp } from 'vue'
import App from './App.vue'
import vuetify from './plugins/vuetify'
import { loadFonts } from './plugins/webfontloader'
import Vue3Lottie from 'vue3-lottie'
import { createRouter, createWebHistory } from 'vue-router'
import Home from './Home.vue'
import Game from './Game.vue'
import Mobile from './Mobile.vue'
import Init from './Init.vue'

const router = createRouter({
  routes: [
    {
      path: '/',
      component: Init
    },
    {
      path: '/home',
      component: Home
    },
    {
      path: '/mobile',
      component: Mobile
    },
    {
      path: '/game',
      component: Game
    },
  ],
  history: createWebHistory()
})


loadFonts()

createApp(App)
  .use(vuetify)
  .use(Vue3Lottie)
  .use(router)
  .mount('#app')
