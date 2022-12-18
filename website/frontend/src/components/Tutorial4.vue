<!-- ====================================== -->
<!-- TEMPLATE                               -->
<!-- ====================================== -->

<template>

    <h3>Tutorial 4</h3>    
    <hr>

    <p ref="important_text">Important text</p>
    <button @click="handleClick">Click me</button>

</template>

<!-- ====================================== -->
<!-- SCRIPTS                                -->
<!-- ====================================== -->

<script setup lang="ts">

    import { Ref, ref } from 'vue'

    // Template refs
    const important_text: Ref<HTMLElement | null> = ref(null);

    const handleClick = () => {
        if (important_text.value) {
            important_text.value.classList.toggle("active");
        }
    }


</script>

<!-- ====================================== -->
<!-- STYLES                                 -->
<!-- ====================================== -->

<style lang="scss" scoped>
</style>
