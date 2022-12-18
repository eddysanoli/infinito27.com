<!-- ====================================== -->
<!-- TEMPLATE                               -->
<!-- ====================================== -->

<template>
    
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
    <p>Events that trigger when the mouse moves across an element</p>

    <!-- Different mouseover events -->
    <!-- You can attach events by using both "v-on:event" or "@event" -->
    <div class="boxes">
        <div @mouseover="triggerMouseEvent">Mouseover</div>
        <div @mouseleave="triggerMouseEvent">Mouseleave</div>
        <div @dblclick="triggerMouseEvent">Double Click</div>
        <div @mousemove="handleMouseMove">Position: ({{ x }}, {{ y }})</div>
    </div>

    <hr>
    <h3>Test: V-for, dynamic data classes and computed properties</h3>
    <p>
        Cycle through an array of data with v-for. Use a v-bind, in conjunction with a 
        special syntax ({className: boolean}) to dynamically add classes to an element.
        Also, use computed properties to filter the reactive data present on the frontend.
    </p>

    <button @click="{ filterFav = !filterFav; }">Filter Favorites: {{ filterFav }}</button>

    <!-- Remember that ":attribute" is the same as "v-bind:attribute" -->
    <div v-if="showBooks">
        <div 
            v-for="book in filteredBooks" 
            :class="{ fav: book.isFav }"
            @dblclick="{ book.isFav = !book.isFav; }"
        >
            <h3>{{ book.title }}</h3>
            <p>{{ book.author }}</p>
        </div>
    </div>

    <hr>
    <h3>Attribute Binding</h3>

    <!-- Insert dynamic values inside of the attributes of an HTML tag --> 
    <!-- Since you can only insert variable like this "{{ var }}" inside -->
    <!-- the contents of the tag. -->
    <a v-bind:href="test_url">Best website ever!</a>

</template>

<!-- ====================================== -->
<!-- SCRIPTS                                -->
<!-- ====================================== -->

<!-- Syntactic sugar for a regular script tag with -->
<!-- a "setup()" function defined inside -->
<script setup lang="ts">

    import { Ref, ref, computed, ComputedRef } from 'vue'

    // Types
    type Book = {
        title: string;
        author: string;
        isFav?: boolean;
    }

    // Reactive state
    const clicked: Ref<boolean> = ref(false);
    let x: Ref<number> = ref(0);
    let y: Ref<number> = ref(0);
    const showBooks: Ref<boolean> = ref(true);
    const filterFav: Ref<boolean> = ref(false);
    const books: Ref<Array<Book>> = ref([
        { title: "The Hobbit", author: "J.R.R. Tolkien", isFav: true },
        { title: "The Lord of the Rings", author: "J.R.R. Tolkien", isFav: false },
        { title: "The Silmarillion", author: "J.R.R. Tolkien", isFav: true },
    ]);
    const test_url: Ref<string> = ref("https://www.eddysanoli.com");

    // Computed Properties
    const filteredBooks: ComputedRef = computed(() => {
        if (filterFav.value) {
            return books.value.filter((book) => book.isFav);
        }
        else {
            return books.value;
        }
    });

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

<!-- The "scoped" keyword allows the styles to be exclusive to this component only -->
<!-- There is a performance hit associated with including "scoped", since "scoped" -->
<!-- just adds a prefix to the selectors of a file -->
<style lang="scss" scoped>

    // Mouseover boxes
    .boxes {
        display: grid;
        grid-template-columns: repeat(2, 1fr);
        gap: 10px;

        div {
            height: 200px;
            background-color: grey;
            padding: 30px;
        }
    }

    // Favorite book
    .fav {
        background-color: rgba(230, 230, 106, 0.24);
        border-radius: 10px;
    }

    // On Click Secret
    .on-click-secret {
        background-color: red;
    }

</style>