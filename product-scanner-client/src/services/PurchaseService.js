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

    fetchPurchaseProducts() {
        return Promise.resolve([
            {
                id: 1,
                product: {
                    id: 1,
                    name: 'Limpador Veja Multiuso',
                    gtin: '7891200329382',
                    brand: {
                        id: 1,
                        name: 'Veja'
                    }
                },
                price: 25.0,
                quantity: 1.0,
                quantity_type: 'UNIT',
                expires_at: '2023-02-18T00:00:00'
            },
            {
                id: 2,
                product: {
                    id: 1,
                    name: 'Azeite de Oliva Extra Virgem',
                    gtin: '789183012383',
                    brand: {
                        id: 2,
                        name: 'Andorinha'
                    }
                },
                price: 12.0,
                quantity: 2.0,
                quantity_type: 'UNIT',
                expires_at: '2023-10-25T00:00:00'
            }
        ])
    }
}
