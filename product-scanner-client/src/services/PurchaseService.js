const API_URL = 'http://localhost:3000'

export default {
    fetchPurchases() {
        return fetch(API_URL + '/purchases')
            .then((response) => response.json())
    }
}
