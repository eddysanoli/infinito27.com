<!-- ====================================== -->
<!-- TEMPLATE                               -->
<!-- ====================================== -->

<template>

    <!-- Only hide the modal if you click on the backdrop itself -->
    <div class="backdrop" @click.self="closeModal">
        <div class="modal">

            <h3>{{ props.title }}</h3>    
            <hr>

            <p ref="important_text" @click="handleClick">Important text</p>

            <!-- The tags that are passed inside of the Tutorial4 element -->
            <!-- The text inside of the slot is the fallback text -->
            <slot>Nothing to see here</slot>

            <!-- We insert the named slot of "links" inside this div -->
            <div class="actions">
                <slot name="links"></slot>
            </div>

        </div>
    </div>

</template>

<!-- ====================================== -->
<!-- SCRIPTS                                -->
<!-- ====================================== -->

<script setup lang="ts">

    import { Ref, ref, defineEmits } from 'vue'

    // The expected props for this component
    interface Props {
        title?: string;
    }

    // Props 
    const props = withDefaults(defineProps<Props>(), {
        title: "Tutorial 4",
    });

    /* =============== TEMPLATE REFS ============== */

    const important_text: Ref<HTMLElement | null> = ref(null);

    /* ================== METHODS ================= */

    const handleClick = () => {
        if (important_text.value) {
            important_text.value.classList.toggle("active");
        }
    }

    // Custom event emitter for the "close" event on the modal
    // (The name of the event is free for the developer to choose)
    const emit = defineEmits(["close"]);
    const closeModal = () => {
        emit("close");
    }


</script>

<!-- ====================================== -->
<!-- STYLES                                 -->
<!-- ====================================== -->

<style lang="scss">

    // Darkened backdrop
    .backdrop {
        background-color: #0000001e;
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        z-index: 1000;
        transition: all 0.3s ease-in-out;
    }

    .modal {    

        // Position in the center of the screen
        position: fixed;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);

        // Shape and Styling
        background-color: #707070;
        border-radius: 10px;
        padding: 20px;
        width: 50%;
        max-width: 400px;
        margin: 0 auto;
        margin-top: 20px;
        z-index: 1010;
        transition: all 0.3s ease-in-out;
    }

    .actions {
        a {
            color: white;
            padding: 10px;
            border: 1px solid white;
            border-radius: 10px;
            margin: 1rem;
        }
    }
</style>