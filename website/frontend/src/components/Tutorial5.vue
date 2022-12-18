<!-- ====================================== -->
<!-- TEMPLATE                               -->
<!-- ====================================== -->

<template>

    <h3>Test Your Reaction Time</h3>

    <!-- Have the button be disabled after being clicked -->
    <button @click="startGame" :disabled="gameHasStarted">Start Game</button>    
    <ReactionBlock 
        :delay="delay" 
        v-if="gameHasStarted" 
        @stop-reaction="endGame"
    />
    <p v-if="showScore">
        Reaction time is: {{ score }} ms
    </p>

</template>

<!-- ====================================== -->
<!-- SCRIPTS                                -->
<!-- ====================================== -->

<script setup lang="ts">

    import { ref, Ref } from 'vue'
    import ReactionBlock from './reactionBlock.vue'

    /* =================== REFS =================== */

    const gameHasStarted: Ref<boolean> = ref(false); 
    const delay: Ref<number> = ref(0);
    const score: Ref<number> = ref(0);
    const showScore: Ref<boolean> = ref(false);

    /* ================== METHODS ================= */

    const startGame = () => {
        delay.value = 2000 + Math.random() * 5000;
        showScore.value = false;
        gameHasStarted.value = true;
    }

    const endGame = (reactionTime: number) => {
        gameHasStarted.value = false;
        showScore.value = true;
        score.value = reactionTime;
    }

</script>

<!-- ====================================== -->
<!-- STYLES                                 -->
<!-- ====================================== -->

<style lang="scss" scoped>
</style>
