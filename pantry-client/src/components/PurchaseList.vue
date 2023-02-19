<script setup>

import {ref, computed} from 'vue'
import PurchaseService from '../services/PurchaseService.js'

import {DateTime} from 'luxon'

const purchases = ref([])

function formatDate (s) {
    return DateTime.fromISO(s)
                   .setLocale('pt-br')
                   .toFormat('dd LLL yyyy')
}

purchases.value = await PurchaseService.fetchPurchases()

</script>

<template>
    <div class="list-group">
        <a class="list-group-item" v-for="purchase in purchases" :href="`/purchases/${purchase.id}`">
            <div class="">
                <strong>{{purchase.location}}</strong>
                <p>{{formatDate(purchase.event_datetime)}}</p>
            </div>
        </a>
    </div>
</template>
