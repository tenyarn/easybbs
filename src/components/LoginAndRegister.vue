<script setup>
import { nextTick } from 'vue';
import { reactive, ref } from 'vue'
import  verifyrules  from '../utils/verify';
//0zhuce 1 denglu 2 zhaohuimima 
const showPanel = (type) => {

  opType.value = type
  resetForm()

}
const opType = ref(2)
const api = {
  checkCode: 'http://127.0.0.1:7070/api/checkCode'
}
const checkCodeUrl = ref(api.checkCode)
const changeCheckCode = (type)=> {
  checkCodeUrl.value = api.checkCode+'?type='+type+'&time='+new Date().getTime()

}
defineExpose({ showPanel })
const formSize = ref('default')
const FormData = reactive({
  nickname: 'Hello',
  email: "",
  pwd: '',
  checkCode: '',
  remmberme:false,
  emailCode:'',
  confirmpwd:"",

})
const emailcheck = ref(false)

const checkConfirmPwd = (rule,value,callback)=> {
  if(value!==FormData.pwd){
    callback(new Error(rule.message))
  }else{
    callback()
  }
}

const rules = reactive({
  name: [
    { required: true, message: 'Please input Activity name', trigger: 'blur' },
    { min: 3, max: 5, message: 'Length should be 3 to 5', trigger: 'blur' },
  ],
  email:[
    {required:true},
    {max:150,message:'too long'},
    {validator:verifyrules.email,message:'wrong email address'}
  ],
  pwd:[
    {required:true},
    {validator:verifyrules.password,message:'sss'}
  ],
  confirmpwd:[
    {required:true},
    {validator:checkConfirmPwd,message:'sssss'}
  ]

})


const submitForm = async (formEld) => {
  if (!formEl) return
  await formEl.validate((valid, fields) => {
    if (valid) {
      console.log('submit!')
    } else {
      console.log('error submit!', fields)
    }
  })
}

const resetForm = () => {
  FormData.nickname=''
  FormData.email=''
  FormData.emailCode=''
  FormData.pwd=''
  FormData.checkCode=''
  FormData.confirmpwd=''
  nextTick(()=>{
    changeCheckCode(0)
  
  })
}
const FormDataRef = ref()

</script>

<template>
  <Dialog :show="opType==1" :showCancel="false" @close="{opType=3;}">
    <el-form ref="FormDataRef" :model="FormData" :rules="rules" label-width="120px" class="demo-ruleForm" :size="formSize"
      status-icon>
      <el-form-item label="请输入账号" prop="nickname">
        <el-input v-model="FormData.nickname" />
      </el-form-item>
      <el-form-item label="请输入邮箱" prop="email">
        <el-input v-model="FormData.email" />
      </el-form-item>
      <el-form-item label="请输入密码" prop="pwd">
        <el-input v-model="FormData.pwd" />
      </el-form-item>
      <el-form-item label="请输入验证码" prop="checkCode">
        <div class="check-code-panel">
          <el-input v-model="FormData.checkCode" />
          <img :src="checkCodeUrl" alt="" class="check-code" @click="changeCheckCode(0)">
        </div>

      </el-form-item>
      <el-form-item>
        <el-checkbox v-model="FormData.remmberme">
          记住我
        </el-checkbox>
      </el-form-item>
      <el-form-item>
        <div class="no-account">
          <a href="javascript:void(0)" class="a-link">
            忘记密码?
          </a>
          <a href="javascript:void(0)" class="a-link">
            没有账号?
          </a>
          
          
        </div>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" style="width: 70%;">
          登录
        </el-button>
      </el-form-item>
    </el-form>
  </Dialog>

  <Dialog :show="opType==0" :showCancel="false" @close="{opType=3;}">
    <el-form ref="FormDataRef" :model="FormData" :rules="rules" label-width="120px" class="demo-ruleForm" :size="formSize"
      status-icon>
      <el-form-item label="请输入账号" prop="nickname">
        <el-input v-model="FormData.nickname" />
      </el-form-item>
      <el-form-item label="请输入邮箱" prop="email">
        <el-input v-model="FormData.email" />
      </el-form-item>
      <el-form-item label="邮箱验证码" prop="emailCode">
        
          <el-input v-model="FormData.emailCode" />
          <el-button type="primary" @click="emailcheck=true">
          发送验证码
          </el-button>
        
        
        <el-popover placement="left" :width="500" trigger="click">
          <p>1</p>
          <p>2</p>
          <p>3</p>
          <p>4</p>
          <p>5</p>
          <p>6</p>
        <template #reference>
          <span class="a-link" style="font-size: 13px;">
                未收到邮箱验证码
          </span>
          
        </template>
      </el-popover>
      </el-form-item>
      
      <el-form-item label="请输入密码" prop="pwd">
        <el-input v-model="FormData.pwd" />
      </el-form-item>
      <el-form-item label="请再次输入密码" prop="confirmpwd">
        <el-input v-model="FormData.confirmpwd" />
      </el-form-item>
      <el-form-item label="请输入验证码" prop="checkCode">
        <div class="check-code-panel">
          <el-input v-model="FormData.checkCode" />
          <img :src="checkCodeUrl" alt="" class="check-code" @click="changeCheckCode(0)">
        </div>

      </el-form-item>
      <el-form-item>
        <el-checkbox v-model="FormData.remmberme">
          记住我
        </el-checkbox>
      </el-form-item>
      <el-form-item>
        <div class="no-account">
          <a href="javascript:void(0)" class="a-link">
            忘记密码?
          </a>
          <a href="javascript:void(0)" class="a-link">
            没有账号?
          </a>
          
          
        </div>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" style="width: 70%;">
          登录
        </el-button>
      </el-form-item>
    </el-form>
  </Dialog>
  <Dialog :show="emailcheck" @close="emailcheck=false" :showCancel="false">
    <el-form>
      <el-form-item label="请输入邮箱" prop="email">
        <el-input v-model="FormData.email" />
      </el-form-item>
      <el-form-item label="邮箱验证码" prop="emailCode">
        <div style="display: flex;">
          <el-input v-model="FormData.emailCode" />
          <img :src="checkCodeUrl" alt="" class="check-code" @click="changeCheckCode(0)" style="margin-left: 10px;">
        </div>
          
          <el-button type="primary" @click="emailcheck=true" style="margin-left: 10px;">
          发送验证码
          </el-button>
      </el-form-item>
    </el-form>
  </Dialog>
</template>
<style lang="scss" scoped>
  .check-code-panel{
    display: flex;
    
    .check-code{
      flex:1;
      margin-left: 5px;
      cursor: pointer;
    }
  }
  .no-account{
    display: flex;
    width: 80%;
    justify-content: space-between;
    margin-left: -50px;
  }

</style>