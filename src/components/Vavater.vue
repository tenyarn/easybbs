<script setup>
import { ref } from 'vue'
let preview = ref('')
    const choosepic = function (a) {
        console.log(a,a.srcElement.files)
        const file = a.target.files[0]
        const reader = new FileReader()
        reader.onload = e => {
            preview.value = e.target.result
        }
        reader.readAsDataURL(file)
    }
</script>
<template>
    xuanz
    <input type="file" v-on:change="choosepic">
    <div class="a-pic" @click="choosepic" >
        <img :src="preview" style="width: 300px; height: auto;">
    </div>
    <div class="a-ava">
        <img :src="preview" style="width: 300px; height: auto;">
    </div>
</template>
<style scoped>
    .a-pic{
        width: 300px;
        height: 300px;
    }
    .a-ava{
        width: 300px;
        width: 300px;
    }
</style>