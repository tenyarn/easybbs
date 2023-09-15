import {computed} from 'vue'
export function useComputed(fn){

    const cache = new Map()
    function compare(args1,args2){
        return args1.length===args2.length && args1.every((item,index)=>{
            Object.is(item,args2[index])
        })
    }
    function getCache(args){
        const keys = [...cache.keys()]
        const key = keys.find((item)=>{
            compare(item,args)
        })
        if(key){
            return cache.get(key)
        }
    }
    return function (...args){
        const cacheR = getCache(args)
        if(cacheR){
            return cacheR.value
        }
            const result = computed(()=>fn(...args)) 
            cache.set(args,result)
            return result.value
        
        
    }
}