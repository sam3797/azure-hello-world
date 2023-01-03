<template>
  <div class="hello">
    <p>hello everyone</p>
    <h1>{{ msg }}</h1>
    <img alt="Vue logo" src="../assets/ker.*.jpg">
    <img alt="Vue logo" src="../assets/ker.*.jpg">
    //<img alt="Vue logo" src="~@/assets/ker.jpg">
    //<img alt="Vue logo" src="../assets/man.jpg">
  </div>

</template>

<script>
export default {
  name: 'HelloWorld',
  props: {
    msg: String
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
img {
  margin: 40px;
  width:300px;
  height:300px;
}
</style>
