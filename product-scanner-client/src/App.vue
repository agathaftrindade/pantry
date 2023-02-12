<script setup>
import { RouterLink, RouterView } from 'vue-router'
import HelloWorld from './components/HelloWorld.vue'
</script>

<template>
    <header>
        <div class="wrapper">
            <HelloWorld msg="You did it!" />

            <nav>
                <RouterLink to="/">Home</RouterLink>
                <RouterLink to="/purchases">Compras</RouterLink>
                <RouterLink to="/about">About</RouterLink>
            </nav>

            <!-- <h1 class="page-title text-center"> Compras </h1> -->

        </div>
    </header>

    <RouterView />
</template>

<style scoped>
header {
  line-height: 1.5;
  max-height: 100vh;
  margin-bottom: 20px;
}

.logo {
  display: block;
  margin: 0 auto 2rem;
}

.page-title {
    margin-top: 10px;
}

nav {
  width: 100%;
  font-size: 12px;
  text-align: center;
}

nav a.router-link-exact-active {
  color: var(--color-text);
}

nav a.router-link-exact-active:hover {
  background-color: transparent;
    text-decoration: none;
}

nav a {
  display: inline-block;
  padding: 0 1rem;
  border-left: 1px solid var(--color-border);
}

nav a:first-of-type {
  border: 0;
}

</style>
