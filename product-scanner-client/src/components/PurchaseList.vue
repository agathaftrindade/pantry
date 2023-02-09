<script setup>

import {ref, computed} from 'vue'
import PurchaseService from '../services/PurchaseService.js'

import {DateTime} from 'luxon'

const purchases = ref([])

PurchaseService.fetchPurchases()
    .then((items) => purchases.value = items)

function formatDate (s) {
    return DateTime.fromISO(s)
            .setLocale('pt-br')
            .toFormat('dd LLL yyyy')
}

</script>

<template>
    <ul class="list-group">
        <li class="list-group-item" v-for="purchase in purchases">
            <div class="">
                <strong>{{purchase.location}}</strong>
                <p>{{formatDate(purchase.event_datetime)}}</p>
            </div>
        </li>
    </ul>
</template>
