<template>
  <div>
      <router-link class="nav-link" to="/"><img alt="Vue logo" src="./assets/ms2-zugeschnitten.jpg"></router-link>
      <div id="app" class="container col-xs-12 col-sm-12 col-md-5 col-md-offset-1 col-lg-6">  
      <router-view/>
    </div>
  </div>
</template>

<script>
//import ArticleList from './components/AusleiheByArticle/ArticleList.vue'

export default {
  name: 'App',
  components: {
    //ArticleList
  }
}
</script>

<style>
@import "https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css";

#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
  
}

img {
  width: 8%;
  height: 8%;
  margin-top: 0em;
  margin-bottom: 0em;
  margin-left: 1em;
  text-align: left;
}
</style>
