<template>
    <hr>
    <h3>This a test</h3>

    <!-- Event listener -->
    <button @click="toggleClicked">Toggle State: {{ "True" ? clicked : "False" }}</button>

    <!-- Remove and Re-add to the DOM  -->
    <div v-if="clicked">
        <p>Hide this!</p>
    </div>

    <!-- Hide or show with CSS -->
    <div class="elamigos" v-show="!clicked">
        <p>Another secret!</p>
    </div>

    <hr>
</template>

<!-- Syntactic sugar for a regular script tag with -->
<!-- a "setup()" function defined inside -->
<script setup lang="ts">

    import { Ref, ref } from 'vue'

    // Reactive state
    const clicked: Ref<boolean> = ref(false);

    // Functions
    const toggleClicked = () => {
        clicked.value = !clicked.value;
        console.log("CLICKED THIS SHIT");
    }
    
</script>

<style lang="scss">

    .elamigos {
       border: 1px solid black; 
       border-radius: 10px;

       p {
        background-color: red;
       }
    }

</style>