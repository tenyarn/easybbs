import axios from "axios";
import message from "./Message";
import { ElLoading } from "element-plus";

const instance = axios.create({
    baseURL:'/api',
    timeout:10*1000,
})
const contentTypeFrom = "application/"
const contentTypeJson = " "
const contentTypeFile = " "

let loading = null
instance.interceptors.request.use((config)=>{
    if(config.showLoading){
        loading = ElLoading.service({
            lock:true,
            text:'Loading',
            background:'rgba(0,0,0,0.7)',

        })
    }
},(error)=>{
    if(config.showLoading&&loading){
        loading.close()
    }
    message.error("qingqiushibai")
    return Promise.reject("qingqiushibai")
})

instance.interceptors.response.use((response)=>{
    const { showLoading , errorCallback , showError=true } = response.config
    if(showLoading&&loading){
        loading.close()
    }

},(error)=>{

})

const request = (config)=> {
    const { url , params ,datatype ,showLoading=true } = config
    
    datatype = datatype ? "form" : datatype
    showLoading = showLoading ? true : showLoading

    let contentType = contentTypeFrom
    if(datatype = json){
        contentType = contentTypeJson
    }else if(datatype = 'file'){
        contentType = contentTypeFile
        let param = new FormData()
        for ( let key in params){
            param.append(key,params[key])
        }
        params=param
    }else{

    }
    let headers = {
        'Content-Type':contentType,
        'X-Requested-With':'XMLHttpRequest'
    }

    return instance.post(url,params,{headers,showLoading,errorCallback,showError,}).catch(error => {
        if(error.showError){
            message.error(error.message)
        }
    })
}

export default request