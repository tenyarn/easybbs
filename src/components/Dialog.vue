<script setup>

const props = defineProps({
    show:{
        type:Boolean,
        default:true
    },
    showClose:{
        type:Boolean,
        default:true
    },
    width:{
        type:String,
        default:'30%'
    },
    title:{
        type:String,
        default:'标题'
    },
    top:{
        type:String,
        default:'50px'
    },
    buttons:{
        type:Array,
        default:[]
    },
    showCancel:{
        type:Boolean,
        default:true
    },
    customdialog:{
        type:String,
        default:'customdialog'
    }
 
})
const emit = defineEmits()
const close = ()=>{
    emit("close")
}

</script>

<template>
  <el-dialog
    :model-value="show"
    :title="title"
    :show-close="showClose"
    :draggable="true"
    @close="close"
    :close-on-click-modal="false"
    class="customdialog"
    :width="width"
    :top="top"
  >
    <div class="dialog-body">
        <slot></slot>
    </div>  
    <template v-if="buttons&&buttons.length>0||showCancel">
        <div class="dialog-footer">
            <el-button @click="close" v-if="showCancel">取消</el-button>
            <el-button v-for="(item, index) in buttons" :key="index" :type="item.type" @click="item.click">{{ item.text }}</el-button>
        </div>
        
    </template>
    
    
  </el-dialog>

</template>
<style scoped lang="scss">
.customdialog{
    margin-bottom: 0 !important;
    .dialog-body{
        margin: 0;
        min-height: 100px;
        max-height: calc(100vh - 300px);
        overflow: auto;
    }
    .dialog-footer{
        margin-left: 400px;

    }
}

</style>