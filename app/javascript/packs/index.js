import Vue from 'vue/dist/vue.esm'
import VueRouter from 'vue-router'
// ルート用のコンポーネントとして読み込む
import Task from './task.vue'
import Test from './test.vue'

Vue.use(VueRouter)

const router = new VueRouter({
  mode: 'hash',
  routes: [
    { path: '/', component: Task },
    { path: '/test', component: Test },
  ],
})

export default router;

router.afterEach((to,from) =>{
  console.log('ページが変わったよ！');
})
