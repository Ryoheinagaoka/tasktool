import Vue from 'vue/dist/vue.esm'
import router from './index.js'
import App from '../app.vue'
// apollo
import { ApolloClient } from 'apollo-client'
import { HttpLink } from 'apollo-link-http'
import { InMemoryCache } from 'apollo-cache-inmemory'
import VueApollo from 'vue-apollo'



const httpLink = new HttpLink({
  // You should use an absolute URL here
  uri: 'http://localhost:3000/graphql',
})

const apolloClient = new ApolloClient({
  link: httpLink,
  cache: new InMemoryCache(),
  connectToDevTools: true,
})

const apolloProvider = new VueApollo({
  defaultClient: apolloClient,
})

// vue pluginのインストール
Vue.use(VueApollo)

// document.addEventListener('DOMContentLoaded', () => {
new Vue({
    el: '#hello',
    provide: apolloProvider.provide(),
    components: { hello,},
    router,
    render: h => h(App)
})
