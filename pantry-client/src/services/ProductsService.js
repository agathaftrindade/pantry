const API_URL = 'http://192.168.0.15:3000'

export default {
    searchProductsByName(query) {
        const url = new URL('/products', API_URL)
        url.searchParams.set('name_like', query);

        return fetch(url.toString())
            .then((response) => response.json())
    },
}
