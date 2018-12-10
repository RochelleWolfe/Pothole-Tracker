<template>
  <div class="home">
    <img alt="pot-hole" src="../assets/pothole-patrol.jpg">
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