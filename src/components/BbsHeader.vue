<script setup>
    import { ref , onMounted, watch } from 'vue'
    import LoginAndRegister from './LoginAndRegister.vue'

    const scrolltop = ref(0)
    onMounted(() => {
        initScroll()
    })
    //添加滚动条监听
    const initScroll = ()=>{
        scrolltop.value = getScrollTop()
        window.addEventListener("scroll",()=>{
            scrolltop.value = getScrollTop()
            
        })
    }
    //获取滚动条高度
    const getScrollTop = () => {
        let scrolltop = document.documentElement.scrolltop||window.scrollY||document.body.scrollTop
        return scrolltop
    }
    //监听滚动条的移动方向
    watch(scrolltop,(preValue,newValue)=>{
        if(preValue>newValue&&newValue>400){
            showheader.value=false
        }
        else{
            showheader.value=true
        }
    })

    const logoinfo = ref([
        {letter:'T',color:'red'},
        {letter:'E',color:'orange'},
        {letter:'N',color:'green'},
        {letter:'G',color:'yellow'},
        {letter:'Y',color:'blue'},
        {letter:'A',color:'purple'},
        {letter:'N',color:'beige'},
    ])
    const showheader = ref(true)
    const buttons = [
        {
            text:'确定',
            type:'primary'
        }
    ]
    const show = ref(false)

    const loginregisterref = ref()
    const loginAndRegister = (type)=> {
       
        loginregisterref.value.showPanel(type)
    }

</script>
<template>
    <div class="top-header" v-if="showheader">
        <div class="top-content">
            <div style="background-color: aliceblue;font-size: 40px;"> 
                <span v-for="(item, index) in logoinfo" :key="index" :style="{ color: item.color }">{{ item.letter }}</span>
            </div>
            <div class="menu-panel">
                <div class="menu-items">首页</div>
                <div class="menu-items">Easybbs开发</div>
                <div class="menu-items">程序猿</div>
                <div class="menu-items">前端</div>
                <div class="menu-items">后端</div>
                <div class="menu-items">社区管理</div>
            </div>
            <div class="user-info-panel">
                <div class="hello-button">
                    <el-button type="primary">
                        发帖
                    </el-button>
                    <el-button type="primary">
                        搜索
                    </el-button>
                    <el-button type="primary" plain @click="loginAndRegister(1)">
                        登录
                    </el-button>
                    <el-button type="primary" plain @click="loginAndRegister(0)" >
                        注册
                    </el-button>
                </div>
            </div>
            
        </div>
    </div>

    <Dialog :buttons="buttons" :show="show" @close="show=false">
        <div >
            zhelishiquxiao
        </div>
        
    </Dialog>
    <LoginAndRegister ref="loginregisterref"></LoginAndRegister>
</template>
<style scoped lang="scss">
    .top-header{
        width: 100%;
        height: 60px;
        position: fixed;
        
        box-shadow: 0 2px 6px 0 #ddd;
        .top-content{
        width: 100%;
        height: 60px;
        align-items: center;
        margin: 0px auto;
        display: flex;
        justify-content: space-around;
        .menu-panel{
            width: auto;
            height: 100%;
            display: flex;
            flex-direction: row;
            align-items: center;
            justify-content: left;
            .menu-items{
                margin-right: 10px;
            }
        }
        .user-info-panel{
            width: 10px;
            height: 100%;
           
            flex-grow: 1;
            display: flex;
            
            flex-direction: row;
            justify-content: center;
            align-items: center;
            flex-wrap: nowrap;
            
        }
    }
    }
    
    
    
</style>