<script setup>
import {ref, reactive, computed} from 'vue'

import EanScanner from './util/EanScanner.vue'
import BrandsService from '../services/BrandsService.js'
import ProductsService from '../services/ProductsService.js'

const formData = reactive({
    brandQuery: '',
    brandQueryResults: [],

    productQuery: '',
    productQueryResults: [],

    gtin: null,
    brandId: null,
    productId: null,
    quantity: null,
    weighted: false
})

const scanInfo = reactive({
    active: false,
    scannedCode: null
})

function toggleScan() {
    scanInfo.active = !scanInfo.active
}

function handleScan(code) {
    scanInfo.active = false
    scanInfo.scannedCode = code
}

async function searchBrands(ev){
    formData.brandId = null
    formData.brandQueryResults = await BrandsService.searchBrandsByName(formData.brandQuery)
}


function setBrand({id, name}, preserveProduct) {
    formData.brandId = id
    formData.brandQuery = name
    formData.brandQueryResults = []

    if(!preserveProduct) {
        setProduct({})
    }
}

async function searchProducts(ev){
    formData.productId = null
    formData.productQueryResults = await ProductsService.searchProductsByName(formData.productQuery)
}

function clearProduct(){
    formData.productId = null
    formData.productQuery = ''
    formData.productQueryResults = []
}

async function setProduct({id, name, brand}){
    formData.productId = id
    formData.productQuery = name
    formData.productQueryResults = []
    if(brand)
        setBrand(brand, true)
}

function setWeighted(v){
    formData.weighted = v
}

const brandSearchPopupVisible = computed(() => formData.brandQuery && !formData.brandId)

const productSearchPopupVisible = computed(() => formData.productQuery && !formData.productId)

</script>

<template>
    <main class="page">

        <header class="border-bottom p-2">
            <h1 class="text-center">Cadastrar Item</h1>

            <div class="d-flex">
                <button class="btn btn-light me-auto">Voltar</button>
                <button class="btn btn-primary">Salvar</button>
            </div>
        </header>

        <div class="content pt-3">
            <EanScanner @scan="handleScan" v-if="scanInfo.active" />

            <form class="row g-3">

                <div class="col-12 input-group">
                    <div class="form-floating">
                        <input type="text" class="form-control" placeholder="000000000000" v-model="formData.gtin">
                        <label for="floatingInput">Código de Barras</label>
                    </div>
                    <button class="btn btn-outline-secondary" @click.prevent="">
                        <i class="bi bi-upc-scan"></i>
                    </button>
                </div>

                <div class="col-md-6">
                    <div class="input-group">
                        <div class="form-floating">
                            <input type="text" class="form-control" placeholder="Marca" v-model="formData.brandQuery" @input="searchBrands">
                            <label for="floatingInput">Marca</label>
                        </div>
                        <span class="input-group-text">
                            <i class="bi bi-search"></i>
                        </span>
                        <ul class="dropdown-menu show w-100 top-100" v-show="brandSearchPopupVisible">
                            <li><button type="button" class="dropdown-item">Cadastrar Nova</button></li>
                            <div class="dropdown-divider"></div>
                            <li v-for="brand in formData.brandQueryResults" :key="brand.id">
                                <button type="button" class="dropdown-item" @click="setBrand(brand, false)">{{brand.name}}</button>
                            </li>
                        </ul>
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="input-group">
                        <div class="form-floating">
                            <input type="text" class="form-control" placeholder="Produto" v-model="formData.productQuery" @input="searchProducts">
                            <label for="floatingInput">Produto</label>
                        </div>
                        <span class="input-group-text">
                            <i class="bi bi-search"></i>
                        </span>
                        <ul class="dropdown-menu show w-100 top-100" v-show="productSearchPopupVisible">
                            <li><button type="button" class="dropdown-item">Cadastrar Nova</button></li>
                            <div class="dropdown-divider"></div>
                            <li v-for="product in formData.productQueryResults" :key="product.id">
                                <button type="button" class="dropdown-item" @click="setProduct(product)">{{product.name}}</button>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="col-md-6 input-group">
                    <button class="btn btn-outline-secondary" type="button" :class="{active: !formData.weighted }" @click="setWeighted(false)">Unidade</button>
                    <button class="btn btn-outline-secondary" type="button" :class="{active: formData.weighted }"  @click="setWeighted(true)">Peso</button>
                    <div class="form-floating">
                        <input type="text" class="form-control" placeholder="Quantidade" v-model="formData.quantity">
                        <label for="floatingInput">Quantidade</label>
                    </div>
                    <span class="input-group-text">{{formData.weighted ? 'Gramas' : 'Un.'}}</span>
                </div>
            </form>
        </div>
    </main>

</template>
