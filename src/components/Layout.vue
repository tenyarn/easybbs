<script setup>
import BbsHeader from './BbsHeader.vue';
import Vlist from './Vlist.vue'

</script>
<template>
    <div style="display: flex;background-color: aliceblue;height: 2000px;">
    <div style="z-index: 100;">
        <BbsHeader></BbsHeader>
    </div>
    <div class="bottom-layout">
        <router-link to="/vlist">list</router-link>
        <router-link to="/vfile">file</router-link>
        <router-link to="/vavater">avater</router-link>
        <router-link to="/">back</router-link>
        <router-view></router-view>
        
    </div>
  
</div>
</template>
<style scoped>
.bottom-layout{
    width: 100%;
    height: auto;
    
    margin-top: 100px;
    display: flex;
    flex-direction: column;
}
</style>

	



