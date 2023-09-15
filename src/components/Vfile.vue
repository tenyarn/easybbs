<script setup>
import { nextTick } from 'vue';

const getFile = function(a){
    console.log(a,a.srcElement.files)
    uploadfiles.push(a.srcElement.files)
}
const dragenter = (e)=>{
    e.preventDefault();
    
}
const dragover = (e)=>{
    e.preventDefault();

}
const filefilter = function (entry) {
    console.log('entry', entry)
        if(entry.length===0){
            return
        }else{
            if(entry.isDirectory){
            const reader = entry.createReader()
            reader.readEntries((ens)=>{
                console.log('ens', ens)
               for(const en of ens){
                if(en.isDirectory){
                    filefilter(en)
                }else{
                    en.file((f)=>{
                    console.log('f1', f)
                    uploadfiles.push(f)
                })
                }
                
               }
            })
        }else{
         
            entry.file((f)=>{
                console.log('f2', f)
                uploadfiles.push(f)
            })
        }
        }
        
       
    
}
const drop = (e)=>{
    e.preventDefault();

    for(const item of e.dataTransfer.items){
        const entry = item.webkitGetAsEntry()
        console.log('out', entry)
        filefilter(entry)
    }  
}
const uploadfiles = []
const uploadfile = function(){
  const formData = new FormData();
  for (const extendFile of fileMap.value.values()) {
    formData.append(extendFile.file.name, extendFile.file)
  }
  axios.post("your server address", formData)


    var timestamp = (new Date()).valueOf();
    var url = "http://localhost/file";
    var xhr = new XMLHttpRequest();
    xhr.open("POST", url, true);
    xhr.setRequestHeader("Content-Type", "application/octet-stream");
    for(const file of uploadfiles){
        const fileurl = URL.createObjectURL(file)
        xhr.send(fileurl);
    }
    
    xhr.onreadystatechange = function() {
        if (xhr.readyState == 4) {
            if ((xhr.status >= 200 && xhr.status < 300) || xhr.status == 304) {
                /*
                var data = $.parseJSON(xhr.responseText);
                key.push(data.key); ++isSuc;
                if (isSuc < baseArr.length) {
                    putb64(dataArr);
                } else if (isSuc == baseArr.length) {
                    submitDone();
                }*/

            } else {

                
                stopLoading();
                toast('图片上传失败');
            }
        }
    }
}
/*
nextTick(()=>{
    const ene = document.getElementById('filediv')
ene.ondrop=function(e){console.log('e.dataTransfer.items', e.dataTransfer.items)}

})*/

</script>

<template>
    <div style="background-color: aqua;width: 100%;height: 100px;" @dragenter="dragenter" @dragover="dragover" @drop="drop" id="filediv">

    </div>
    <input type="file" multiple v-on:change="getFile">
     <input type="file" webkitdirectory mozdirectory odirectory v-on:change="getFile" >
     <button @click="uploadfile">
        shangchuan
     </button>
</template>