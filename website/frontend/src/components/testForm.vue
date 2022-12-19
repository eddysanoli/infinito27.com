<!-- ====================================== -->
<!-- SCRIPTS                                -->
<!-- ====================================== -->

<script setup lang="ts">

    import { ref, Ref } from 'vue'

    /* =================== REFS =================== */

    const email: Ref<string> = ref('Mario');
    const password: Ref<string> = ref('');
    const role: Ref<string> = ref('developer');
    const termsAccepted: Ref<boolean> = ref(false);
    const names: Ref<string[]> = ref([]);
    const tempSkill: Ref<string> = ref('');
    const skills: Ref<string[]> = ref([]);
    const passwordError: Ref<string> = ref('');

    /* ================== METHODS ================= */

    // Push a new skill if we type a comma and the current skill is not empty
    // (To cover for the fact that the user may just type a comma without a skill)
    const parseSkills = (event: KeyboardEvent) => {
        if (event.key === ',' && tempSkill.value !== '') {
            const parsedSkill: string = tempSkill.value.replace(",", "");
            if (!skills.value.includes(parsedSkill)) {
                skills.value.push(parsedSkill);
            }
            tempSkill.value = "";
        }
    }

    // Filter the skills array to remove the skill that was clicked
    const deleteSkill = (event: MouseEvent) => {
        const skillToDelete: string = (event.target as HTMLElement).innerText;
        skills.value = skills.value.filter(skill => skill !== skillToDelete);
    }

    // Submit the form
    const handleSubmit = (event: Event) => {

        // Validate the password
        passwordError.value = password.value.length < 5 ? 
            "Password must be at least 8 characters long" : "";

        if (!passwordError.value) {
            console.log("email", email.value);
            console.log("password", password.value);
            console.log("role", role.value);
            console.log("termsAccepted", termsAccepted.value);
            console.log("names", names.value);
            console.log("skills", skills.value)
        }
    }

</script>

<!-- ====================================== -->
<!-- TEMPLATE                               -->
<!-- ====================================== -->

<template>

    <!-- "submit.prevent" is the same as doing "event.preventDefault()"  -->
    <!-- on the event handler -->
    <form @submit.prevent="handleSubmit">

        <!-- "v-model" makes use of something called "2-way" data binding -->
        <!-- This is said to be this way because it allows the data fields -->
        <!-- to be changed by both the user and the developer -->
        <label>Email:</label>
        <input type="email" required v-model="email">

        <label>Password</label>
        <input type="password" required v-model="password">
        <p v-if="passwordError" class="error">{{ passwordError }}</p>

        <label>Role:</label>
        <select v-model="role">
            <option value="developer">Developer</option>
            <option value="designer">Designer</option>
            <option value="tester">QA Tester</option>
        </select>

        <label>Skills:</label>
        <input type="text" v-model="tempSkill" @keyup="parseSkills">
        <div v-for="skill in skills" class="pill" @click="deleteSkill">
            {{  skill  }}
        </div>

        <div class="terms">
            <input  type="checkbox" required v-model="termsAccepted">
            <label>Accept terms and conditions</label>
        </div>

        <!-- We can map a group of checkboxes to an array -->
        <div>
            <input type="checkbox" value="mario" v-model="names">
            <label>Mario</label>
            <input type="checkbox" value="luigi" v-model="names">
            <label>Luigi</label>
            <input type="checkbox" value="yoshi" v-model="names">
            <label>Yoshi</label>
        </div>

        <div class="submit">
            <button type="submit">Create Account</button>
        </div>

    </form>

    <p>Email: {{ email }}</p>
    <p>Password: {{ password }}</p>
    <p>Role: {{ role }}</p>
    <p>Accepted Terms: {{ termsAccepted }}</p>
    <p>Names: {{ names }}</p>

</template>

<!-- ====================================== -->
<!-- STYLES                                 -->
<!-- ====================================== -->

<style lang="scss" scoped>

    form {
        max-width: 420px;
        margin: 30px auto;
        background: white;
        text-align: left;
        padding: 40px;
        border-radius: 10px;
    }

    label {
        color: #aaa;
        display: inline-block;
        margin: 25px 0 15px;
        font-size: 0.6em;
        text-transform: uppercase;
        letter-spacing: 1px;
        font-weight: bold;
    }

    input, select {
        display: block;
        padding: 10px 6px;
        width: 100%;
        box-sizing: border-box;
        border: none;
        border-bottom: 1px solid #ddd;
        color: #555;
        background-color: #eee;
    }

    input[type="checkbox"] {
        display: inline-block;
        width: 16px;
        margin: 0 10px 0 0;
        position: relative;
        top: 2px;
        background-color: #eee;
    }

    .pill {
        display: inline-block;
        margin: 20px 10px 0 0;
        padding: 6px 12px;
        background: #eee;
        border-radius: 20px;
        font-size: 12px;
        letter-spacing: 1px;
        font-weight: bold;
        color: #777;
        cursor: pointer;
    }

    button {
        background: #0b6dff;
        border: 0;
        padding: 10px 20px;
        margin-top: 20px;
        color: white;
        border-radius: 20px;
    }
    .submit {
        text-align: center;
    }

    .error {
        color: #ff0062;
        margin-top: 10px;
        font-size: 0.8em;
        font-weight: bold;
    }
</style>
