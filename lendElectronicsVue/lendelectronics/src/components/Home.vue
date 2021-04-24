<template>
  <div>
      <nav class="nav  navbar navbar-expand-lg navbar-light">
        <div class="navbar-nav flex-column">
          <a class="nav-item"><router-link class="nav-link" to="/Article">Ausleihe nach Artikeln</router-link></a>
          <a class="nav-item"><router-link class="nav-link" to="/ArticleByStudent">Ausleihe nach Schüler</router-link></a>
          <a class="nav-item"><router-link class="nav-link" to="/ArticleManagement">Artikel Verwaltung</router-link></a>
          <a class="nav-item"><router-link class="nav-link" to="/StudentManagement">Schüler Verwaltung</router-link></a>
        </div>
        </nav>
      <router-view />
  </div>
</template>

<script>
export default {
    name: 'Home'
}
</script>

<style scoped>
 a{
     text-align: left;
 }
</style>