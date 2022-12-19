import { createApp } from 'vue';
import App from './App.vue';
import router from './router';
import './style.css';


// Insert the "App" vue component into the div with ID "app".
// Said div is located in the index.html file. We then use the
// router we created above.
createApp(App).use(router).mount('#app');
