<script setup>
import PurchaseDetails from '../components/PurchaseDetails.vue'

const props = defineProps(['purchaseId'])
</script>

<template>
    <main>
        <Suspense>
            <PurchaseDetails :purchase-id="props.purchaseId" />
        </Suspense>
    </main>
</template>
