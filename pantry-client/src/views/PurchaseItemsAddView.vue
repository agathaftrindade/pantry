<script setup>

import PurchaseItemsAdd from '../components/PurchaseItemsAdd.vue'

const props = defineProps(['purchaseId'])

</script>

<template>
    <PurchaseItemsAdd :purchase-id="props.purchaseId" />
</template>
