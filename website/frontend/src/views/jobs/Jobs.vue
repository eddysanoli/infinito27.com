<!-- ====================================== -->
<!-- SCRIPTS                                -->
<!-- ====================================== -->

<script setup lang="ts">

    import { ref, Ref } from 'vue'

    /* =================== TYPES ================== */

    type Job = {
        title: string,
        id: number,
        details: string
    }

    /* =================== REFS =================== */

    const jobs: Ref<Array<Job>> = ref([
        { title: "UX Designer", id: 1, details: "Something" },
        { title: "Web Developer", id: 2, details: "Something" },
        { title: "Vue Developer", id: 3, details: "Something" },
    ])

</script>

<!-- ====================================== -->
<!-- TEMPLATE                               -->
<!-- ====================================== -->

<template>
    <h1>Jobs</h1> 
    <div v-for="job in jobs" :key="job.id" class="job">
        <router-link :to="{ name: 'JobDetails', params: {id: job.id}}">
            <p>{{ job.title }}</p>
        </router-link>
    </div>
</template>

<!-- ====================================== -->
<!-- STYLES                                 -->
<!-- ====================================== -->

<style lang="scss">
    .job {
        border: 2px solid #ccc;
        padding: 10px;
        margin: 10px;
        border-radius: 10px;

        a {
            color: white;
            font-weight: bold;

            &:hover {
                color: #3eaf7c;
            }
        }
    } 
</style>
