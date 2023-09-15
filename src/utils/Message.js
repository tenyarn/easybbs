import { ElMessage } from "element-plus"


const sendMessage = (message,callback,type)=> {
    ElMessage({
        type,
        message,
        duration:2000,
        onClose:()=>{
            if(callback){
                callback()
            }
        }
    })
}
const message={
    error:(message,callback)=>{sendMessage(message,callback,error)},
    success:(message,callback)=>{sendMessage(message,callback,success)},
    warning:(message,callback)=>{sendMessage(message,callback,warning)}
}

export default message