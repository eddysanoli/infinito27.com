import { createRouter, createWebHistory } from 'vue-router';
import Home from '../views/Home.vue';
import About from '../views/About.vue';
import Jobs from '../views/jobs/Jobs.vue';
import JobDetails from "../views/jobs/JobDetails.vue";
import NotFound from "../views/404.vue";

// Create the router
const router = createRouter({
    history: createWebHistory(),
    routes: [
        { path: "/", name: "home", component: Home },
        { path: "/about", name: "about", component: About },
        { path: "/jobs", name: "jobs", component: Jobs },

        // Route parameter for id
        { path: "/jobs/:id", name: "JobDetails", component: JobDetails, props: true },

        // Redirect
        { path: "/all-jobs", redirect: "/jobs" },

        // Catch all 404
        { path: "/:catchAll(.*)", name: "NotFound", component: NotFound }
    ]
});

export default router;