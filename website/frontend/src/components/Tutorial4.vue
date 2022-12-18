<!-- ====================================== -->
<!-- TEMPLATE                               -->
<!-- ====================================== -->

<template>

    <!-- We can apply modifiers to an event by doing "event.modifier" -->
    <button @click.left="{ showModal = !showModal; }">Show Modal (Left Click)</button>
    <Modal
        v-if="showModal"
        title="Hello my brotha, this is tutorial 4"
        @close="{ showModal = false; }"
    > 
        <p>😊</p>
        <template v-slot:links>
            <a href="https://google.com">Google</a>
            <a href="https://youtube.com">Youtube</a>
        </template>        
        
    </Modal>

</template>

<!-- ====================================== -->
<!-- SCRIPTS                                -->
<!-- ====================================== -->

<script setup lang="ts">

    import { Ref, ref } from 'vue'
    import Modal from './modal.vue'

    // Refs
    const showModal: Ref<boolean> = ref(false);

</script>

<!-- ====================================== -->
<!-- STYLES                                 -->
<!-- ====================================== -->

<style lang="scss">
</style>
