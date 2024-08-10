import { createApp } from 'vue'
import App from './App.vue'
import vuetify from './plugins/vuetify'
import { loadFonts } from './plugins/webfontloader'
import Vue3Lottie from 'vue3-lottie'
import { createRouter, createWebHistory } from 'vue-router'
import Home from './Home.vue'
import Game from './Game.vue'
import Mobile from './Mobile.vue'
import MobileGame from './MobileGame.vue'
import Init from './Init.vue'
import VueGtag from "vue-gtag";

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
    {
      path: '/mobilegame',
      component: MobileGame
    },    
  ],
  history: createWebHistory()
})


loadFonts()

createApp(App)
  .use(vuetify)
  .use(Vue3Lottie)
  .use(router)
  .use(VueGtag, { config: { id: "G-1YCM18H098" }})
  .mount('#app')
