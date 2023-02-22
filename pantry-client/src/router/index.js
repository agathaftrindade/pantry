import { createRouter, createWebHistory } from 'vue-router'

import HomeView from '../views/HomeView.vue'
import PurchaseIndexView from '../views/PurchaseIndexView.vue'
import PurchaseDetailsView from '../views/PurchaseDetailsView.vue'
import PurchaseItemsAddView from '../views/PurchaseItemsAddView.vue'

const router = createRouter({
    history: createWebHistory(import.meta.env.BASE_URL),
    routes: [
        {
            path: '/',
            name: 'home',
            component: HomeView
        },
        {
            path: '/purchases',
            name: 'purchases',
            component: PurchaseIndexView
        },
        {
            path: '/purchases/:purchaseId',
            name: 'purchase_details',
            component: PurchaseDetailsView,
            props: true
        },
        {
            path: '/purchases/:purchaseId/add-item',
            name: 'purchase-items-add',
            component: PurchaseItemsAddView,
            props: true
        },
        {
            path: '/about',
            name: 'about',
            // route level code-splitting
            // this generates a separate chunk (About.[hash].js) for this route
            // which is lazy-loaded when the route is visited.
            component: () => import('../views/AboutView.vue')
        }
    ]
})

export default router
