<template>
    <v-app id="inspire">
      <v-main class="bg-green-lighten-3">
        <v-container class="d-flex flex-column flex-nowrap">
          <v-row class="flex-1-1-100 mb-10">
            <Vue3Lottie
              animationLink="https://lottie.host/b14150ff-70bd-47e3-9e37-41e94c5008b0/BkXe6swJiG.json"
              :height="200"
              :width="200"/>
          </v-row>
          <v-row class="text-center">
            <div class="text-h1 font-weight-bold" style="width:100%">С ДР БРО!</div>
          </v-row>
          <v-row>
              <Vue3Lottie
                @click="game"
                :autoPlay="true"
                animationLink="https://lottie.host/8bd70cb3-272f-40ad-95f5-2723c11642c0/yQtFHZCyZa.json"
                :height="200"
                :width="200"/>
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
            // console.log('route to game');
            this.$router.push({ path: 'mobilegame'});
            // window.location.href = "http://localhost:8080"
        }
      }
    }
  </script>