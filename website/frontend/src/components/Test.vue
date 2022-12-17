<!-- ====================================== -->
<!-- TEMPLATE                               -->
<!-- ====================================== -->
<template>
    <hr>
    <h3>Test: On Click</h3>

    <!-- Event listener -->
    <button @click="toggleClicked">Toggle State: {{ "True" ? clicked : "False" }}</button>

    <div>
        <!-- Hide or show with CSS -->
        <p v-show="!clicked" class="on-click-secret">Clicked is false!</p>

        <!-- Remove and Re-add to the DOM on Click -->
        <p v-if="clicked">Clicked is true!</p>
    </div>

    <hr>

    <h3>Test: Mouseover</h3>

    <!-- Different mouseover events -->
    <!-- You can attach events by using both "v-on:event" or "@event" -->
    <div class="boxes">
        <div @mouseover="triggerMouseEvent">Mouseover</div>
        <div @mouseleave="triggerMouseEvent">Mouseleave</div>
        <div @dblclick="triggerMouseEvent">Double Click</div>
        <div @mousemove="handleMouseMove">Position: ({{ x }}, {{ y }})</div>
    </div>

    <hr>
</template>

<!-- ====================================== -->
<!-- SCRIPTS                                -->
<!-- ====================================== -->

<!-- Syntactic sugar for a regular script tag with -->
<!-- a "setup()" function defined inside -->
<script setup lang="ts">

    import { Ref, ref } from 'vue'

    // Reactive state
    const clicked: Ref<boolean> = ref(false);
    let x: Ref<number> = ref(0);
    let y: Ref<number> = ref(0);

    // Toggle the "clicked" state
    const toggleClicked = () => {
        clicked.value = !clicked.value;
    }

    // Mouse event
    const triggerMouseEvent = (event: MouseEvent) => {
        console.log("Mouse event occurred");
    }

    // Mouse move
    const handleMouseMove = (event: MouseEvent) => {
        console.log("Mouse move event occurred");
        x.value = event.offsetX;
        y.value = event.offsetY;
    }

    
</script>


<!-- ====================================== -->
<!-- STYLES                                 -->
<!-- ====================================== -->

<style lang="scss">

    // Mouseover boxes
    .boxes {
        display: grid;
        grid-template-columns: repeat(2, 1fr);
        gap: 10px;

        div {
            width: 200px;
            height: 200px;
            background-color: grey;
            padding: 30px;
        }
    }

    // On Click Secret
    .on-click-secret {
        background-color: red;
    }

</style>