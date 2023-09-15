<script setup >
import {computed} from 'vue'
    const props = defineProps({
        name:{
            type:String
        },
        count:{
            type:Number
        },
        price:{
            type:Number
        }
    })
    
    const totalprice = computed(()=>{
        return props.count*props.price
    })
</script>
<template>
    <div class="v-list">
        <div class="v-list-items">
                {{ name }}
            </div>
            <div class="v-list-items">
                {{ price }}
            </div>
            <slot>

            </slot>
            
            <div class="v-list-items">
                {{ totalprice }}
            </div>
    </div>
     
</template>
<style scoped>
.v-list{
    display: flex;
    flex-direction: row;
    
}
.v-list-items{
    margin-right: 100px;
}
</style>