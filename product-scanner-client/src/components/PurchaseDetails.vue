<script setup>
import {ref, computed} from 'vue'
import PurchaseService from '../services/PurchaseService.js'

import {DateTime} from 'luxon'
// 
// const state = ref({
//     purchase: {},
//     products: []
// })
// 

function formatDate (s) {
    return DateTime.fromISO(s)
                   .setLocale('pt-br')
                   .toFormat('dd/MM/yyyy')
}

function formatDatetime (s) {
    return DateTime.fromISO(s)
                   .setLocale('pt-br')
                   .toFormat('dd/MM/yyyy HH:mm')
}

const numberFormatter = new Intl.NumberFormat('pt-BR', { style: 'currency', currency: 'BRL' })

function formatPrice(p) {
    return numberFormatter.format(p)
}

const purchase = ref({})
const purchaseItems = ref([])

purchase.value = await PurchaseService.fetchPurchaseDetails()
purchaseItems.value = new Array(20).fill(await PurchaseService.fetchPurchaseProducts()).flat() 

const purchaseTotal = computed(() => {
    return formatPrice(
            purchaseItems.value
                         .map(i => i.price * i.quantity)
                         .reduce((a, b) => a + b, 0.0)
    )
})

</script>

<template>
    <main class="page">

        <header class="border-bottom p-2">
            <h1 class="text-center">{{purchase.location}} </h1>
            <div>
                <p class="text-center h4">{{formatDatetime(purchase.event_datetime)}}</p>
                <p class="text-center">{{purchase.comment}}</p>
            </div>
            <div class="d-flex">
                <p class="text-start align-self-center m-0">Total: {{purchaseTotal}}</p>
                <div class="ms-auto ">
                    <button class="btn btn-primary">Inserir Novo</button>
                </div>
            </div>
        </header>

        <div class="content">
            <div class="list-group">
                <button class="list-group-item list-group-item-action p-0 text-start" v-for="item in purchaseItems">
                    <div class="d-flex item-row">
                        <div class="p-2 flex-fill product-col">
                            <strong class="product-name">{{item.product.name}}</strong>
                            <span class="product-brand">{{item.product.brand.name}}</span>
                        </div>
                        <div class="p-2 align-self-center price-col">
                            <p>{{formatPrice(item.price * item.quantity)}}</p>
                        </div>
                        <div class="p-2 ms-auto quantity-col">
                            <div class="input-group">
                                <span class="input-group-btn">
                                    <button type="button" class="btn btn-default btn-number">
                                        -
                                    </button>
                                </span>
                                <input type="number" class="input-number text-center quantity-input" value="1" min="1" max="10">
                                <span class="input-group-btn">
                                    <button type="button" class="btn btn-default btn-number">
                                        +
                                    </button>
                                </span>
                            </div>
                            <span class="text-center product-expiry">Val: {{formatDate(item.expires_at)}}</span>
                        </div>
                    </div>
                </button>
            </div>
        </div>
    </main>
</template>

<style>

main {
    display: flex; /* displays flex-items (children) inline */
    flex-direction: column; /* stacks them vertically */
    height: 100%; /* needs to take the parents height, alternative: body {display: flex} */

}

main > header {
}

main .content {
    flex: 1; /* takes the remaining height of the "container" div */
    overflow: auto; /* to scroll just the "main" div */

}

.item-row {
    display: inline;
}

.item-row .product-col {
    /* max-width:55%; */
    /* flex-shrink: 0; */
}

.item-row .product-name {
    display: block;
}

.item-row .product-brand {
    display: block;
}

.quantity-col .input-group {
    flex-wrap: nowrap;
}

.item-row .price-col {
    /* justify-content: center;
       align-items: center; */
}

.item-row .quantity-input {
    /* width: 3em; */
    border-width: 0;
    text-align: center;
    -webkit-appearance: none;
    margin: 0;
}

.item-row .product-expiry {
    display: block;
    text-align: center;
}

.float-right {
    float: right;
}

.quantity-selector p {
    display: inline-block;
    float: left;
}
</style>
