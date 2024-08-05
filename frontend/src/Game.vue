<template>
    <v-app id="inspire2">
      <v-main class="bg-green-lighten-3">
        <v-container fluid class="fill-height ma-0 pa-0">
          <Vue3Lottie
            :autoPlay="true"
            animationLink="https://lottie.host/b2ddbee8-4cbb-44e0-9108-2a310d74f001/YiCSDvAtHY.json"
            :height="200"
            :width="200"/>
        </v-container>
      </v-main>
  </v-app>
</template>

<script>
  import { Vue3Lottie } from 'vue3-lottie'

  export default {
    mounted() {
      this.$nextTick(function () {
        // Код, который будет запущен только после
        // отрисовки всех представлений
        // let my_worker = new Worker("my_worker.js")

        setTimeout(() => {
          // console.log("Привет от web worker")
          window.location.href = "http://31.128.46.248:8080"
        },3000)
        
      })
    }
  }

</script>