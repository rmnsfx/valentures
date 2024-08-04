<template>
    <v-app id="inspire">
      <v-main class="bg-green-lighten-3">
        <v-container fluid class="fill-height">
          <v-row>
            <Vue3Lottie
              animationLink="https://lottie.host/b14150ff-70bd-47e3-9e37-41e94c5008b0/BkXe6swJiG.json"
              :height="250"
              :width="250"/>
          </v-row>
          <v-row class="d-flex justify-center">
            <div class="text-h1 font-weight-bold" style="width:60%;">С Днём Рождения, Валерий Олегович!</div>
          </v-row>
          <v-row>
              <Vue3Lottie
                @click="game"
                :autoPlay="true"
                animationLink="https://lottie.host/8bd70cb3-272f-40ad-95f5-2723c11642c0/yQtFHZCyZa.json"
                :height="350"
                :width="350"/>
          </v-row>
        </v-container>
      </v-main>
    </v-app>
  </template>
  
  <script>
  import { Vue3Lottie } from 'vue3-lottie'
  
    export default {
      data: () => ({
  
      }),
      methods:{
        game() {
            console.log('route to game');
            this.$router.push({ path: 'game'});
            // window.location.href = "http://31.128.46.248:8080"
        },
      },
    }
  </script>