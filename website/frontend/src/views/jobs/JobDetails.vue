
<!-- ====================================== -->
<!-- SCRIPTS                                -->
<!-- ====================================== -->

<script setup lang="ts">

    import { ref, Ref, defineProps } from 'vue'
    import { useRoute } from 'vue-router'

    /* =================== PROPS ================== */

    const props = defineProps({
        id: {
            type: Number,
            required: true
        }
    })

    /* =================== REFS =================== */

    const id: Ref<number> = ref(props.id);

</script>

<!-- ====================================== -->
<!-- TEMPLATE                               -->
<!-- ====================================== -->

<template>
    <h1>Job Details Page</h1>
    <p>The job id is {{ $route.params.id }}</p>
</template>

<!-- ====================================== -->
<!-- STYLES                                 -->
<!-- ====================================== -->

<style lang="scss">
</style>
