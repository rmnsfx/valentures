<template>
</template>
  
  <script>

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