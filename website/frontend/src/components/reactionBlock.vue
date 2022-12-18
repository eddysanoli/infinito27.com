
<!-- ====================================== -->
<!-- TEMPLATE                               -->
<!-- ====================================== -->

<template>

    <div class="reaction-block" v-if="showBlock" @click="stopTimer">
        Click Me
    </div>

</template>

<!-- ====================================== -->
<!-- SCRIPTS                                -->
<!-- ====================================== -->

<script setup lang="ts">

    import { ref, Ref, onMounted } from 'vue'

    /* =================== REFS =================== */

    const showBlock: Ref<boolean> = ref(false);
    const timer: Ref<NodeJS.Timer | null> = ref(null);
    const reactionTime: Ref<number> = ref(0);

    /* =================== PROPS ================== */

    interface Props {
        delay: number;
    } 

    const props = defineProps<Props>();

    /* =================== HOOKS ================== */

    // This hook will run when the component is mounted
    onMounted(() => {
        setTimeout(() => {
            showBlock.value = true;
            startTimer();
        }, props.delay);
    })

    /* ============== EVENT EMITTERS ============= */
    
    const emitStopReaction = defineEmits(["stop-reaction"]);

    /* ================== METHODS ================= */

    // Starts counting when the reaction block gets mounted into the DOM
    const startTimer = () => {
        timer.value = setInterval(() => {
            reactionTime.value += 10;
        }, 10);
    };

    // Stops the timer and logs the reaction time when the reaction block is clicked
    const stopTimer = () => {
        clearInterval(timer.value as NodeJS.Timer);
        emitStopReaction("stop-reaction", reactionTime.value); 
    };

</script>

<!-- ====================================== -->
<!-- STYLES                                 -->
<!-- ====================================== -->

<style lang="scss" scoped>

    .reaction-block  {
        margin: 2rem;
        height: 200px;
        background-color: green;
        display: flex;
        justify-content: center;
        align-items: center;
        font-size: 2rem;
        border-radius: 1rem;
    }
</style>
