import { createApp } from 'vue'
import './style.css'
import App from './App.vue'
import router from './routes'
import ElementPlus from 'element-plus'
import  VueCookies   from 'vue-cookies'
import 'element-plus/dist/index.css'
import Dialog from './components/Dialog.vue'
import verifyrules from './utils/verify'




const app = createApp(App)

app.use(router)
app.use(ElementPlus)
app.config.globalProperties.VueCookies = VueCookies
app.config.globalProperties.verifyrules = verifyrules
app.component("Dialog",Dialog)
app.mount('#app')
