import { createApp } from 'vue'
import App from './App.vue'
import axios from 'axios'
import { createWebHistory, createRouter } from 'vue-router'


import Home from './components/Home.vue'
import ArticleList from './components/AusleiheByArticle/ArticleList.vue'
import ArticleManagment  from './components/AtricleManagement/ArticleManagment.vue'
import ArticleListByStudent from './components/AusleiheByStudent/ArticleListByStudent.vue'
import StudentManagment from './components/StudentManagement/StudentManagment.vue' 


const routes = [
    {
        path: '/',
        component: Home
    },
    {
        path: '/Article',
        component: ArticleList
    },
    {
        path: '/ArticleByStudent',
        component: ArticleListByStudent
    },
    {
        path: '/ArticleManagement',
        component: ArticleManagment
    },
    {
        path: '/StudentManagment',
        component: StudentManagment
    }    
];

const router = new createRouter({
    history: createWebHistory(),
    routes
});


const lendApp = createApp(App);
lendApp.config.globalProperties.$axios = axios;
lendApp.use(router);
lendApp.mount('#app');
