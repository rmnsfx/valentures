<template>
</template>
  
  <script async src="https://www.googletagmanager.com/gtag/js?id=G-1YCM18H098"></script>
  <script>
  
    window.dataLayer = window.dataLayer || [];
    function gtag(){dataLayer.push(arguments);}
    gtag('js', new Date());
    gtag('config', 'G-1YCM18H098');


    export default {
      data: () => ({
  
      }),
      methods:{
        isMobile() {
                if( screen.width <= 760 ) {
                    return true;
                }
                else {
                    return false;
                }
        }
      },
      created() {
            if (this.isMobile()) {
                this.$router.push('/mobile');
            }
            else {
                this.$router.push('/home');
            }
      }
    }
  </script>