
const routes = [
    {path:'/',component:()=>import('../components/Layout.vue'),children:[
        {path:'/vlist',component:()=>import('../components/Vlist.vue')},
        {path:'/vfile',component:()=>import('../components/Vfile.vue')},
        {path:'/vavater',component:()=>import('../components/Vavater.vue')},
    ]}
]

export { routes }