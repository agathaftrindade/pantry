const API_URL = 'http://192.168.0.15:3000'

export default {
    fetchPurchases() {
        return fetch(API_URL + '/purchases')
            .then((response) => response.json())
    },

    fetchPurchaseDetails() {
        return Promise.resolve({
            id: 1,
            location: 'Carrefour Osasco',
            comment: 'Compras do mês',
            event_datetime: '2022-02-10T13:12:34'
        })
        // return fetch(API_URL + '/purchases')
        //     .then((response) => response.json())
    },

    fetchPurchaseProducts(purchaseId) {
        const url = new URL(`/purchases/${purchaseId}/items/`, API_URL)
        return fetch(url)
            .then((response) => response.json())
    },

    createPurchaseItem(purchaseId, item) {

        const url = new URL(`/purchases/${purchaseId}/items/`, API_URL)
        return fetch(url, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify(item)
        })
            .then((response) => response.json())
    },
}
