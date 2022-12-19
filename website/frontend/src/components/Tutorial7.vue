<!-- ====================================== -->
<!-- SCRIPTS                                -->
<!-- ====================================== -->

<script setup lang="ts">

    import { useRouter } from 'vue-router';

    const router = useRouter();

    /* ================== METHODS ================= */

    const redirect = () => {
        router.push({ name: 'about' });
    }

    const back = () => {
        router.go(-1);
    }

    const forward = () => {
        router.go(1);
    }

</script>

<!-- ====================================== -->
<!-- TEMPLATE                               -->
<!-- ====================================== -->

<template>

    <h2>Tutorial 7: Vue Router</h2>

    <!-- Dont use regular "a" tags for the links of your pages -->
    <!-- If you use "a" tags for your links, Vue wont be able to -->
    <!-- intercept the requests to the server and replace with the -->
    <!-- desired page according to vue router. -->
    <div id="nav">

        <!-- We use data binding to pass the name of the route, instead of -->
        <!-- the actual URL path -->
        <router-link :to="{ name: 'home' }">Home</router-link> |
        <router-link :to="{ name: 'about' }">About</router-link> | 
        <router-link :to="{ name: 'jobs' }">Jobs</router-link>
    </div>

    <button @click="redirect">Redirect</button>
    <button @click="back">Go Back</button>
    <button @click="forward">Go Forward</button>

    <!-- Render the view of the current path or URL -->
    <router-view/>

</template>

<!-- ====================================== -->
<!-- STYLES                                 -->
<!-- ====================================== -->

<style lang="scss">

    #nav {
        padding: 30px;

        a {
            font-weight: bold;
            color: #3eaf7c;
            text-decoration: none;
            padding: 10px;
            border-radius: 4px;
        }

        a.router-link-exact-active {
            background-color: #3eaf7c;
            color: white;
        }
    }

</style>
