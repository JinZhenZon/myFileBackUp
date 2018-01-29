<template>
  <div>{{this.$store.state.person}}
    <button @click="setdata">1111</button>
  </div>
</template>

<script>
export default {
  methods:{
    setdata(){
      this.$store.dispatch("setdata");
    }
  }
}
</script>

<style>

</style>
