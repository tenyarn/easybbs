<script setup>
import { reactive , watch ,computed } from 'vue';
import VlistItem from './VlistItem.vue'
const goodsitems = reactive([
    {
        name:'a',
        count:1,
        price:100
    },
    {
        name:'b',
        count:2,
        price:60
    },
    {
        name:'c',
        count:3,
        price:30
    },
])
const totalPrice = function(obj){
    return computed(()=>{obj.price*obj.count})
}


watch(goodsitems,(a,b)=>{
    console.log('a',a,b)
})

</script>

<template>
    <VlistItem v-for="(item, index) in goodsitems"
     :key="index" :name="item.name"
     :count="item.count" :price="item.price">
    
        <input v-model="item.count" type="number">
      
           
    </VlistItem>
</template>
<style scoped>


</style>