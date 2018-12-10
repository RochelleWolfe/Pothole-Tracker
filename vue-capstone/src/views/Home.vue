<template>
  <div class="home">
    <img alt="Vue logo" src="../assets/logo.png">
    <google-map/>
    
  </div>
</template>

<script>
// @ is an alias to /src
import PotHoleList from '@/components/PotHoleList.vue'
import GoogleMap from '@/components/GoogleMap.vue'

export default {
  name: 'home',
  components: {
   PotHoleList,
   GoogleMap
  }
}
</script>