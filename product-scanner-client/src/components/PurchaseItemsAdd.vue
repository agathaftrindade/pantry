<script setup>
import {ref, computed} from 'vue'

import Camera from './util/Camera.vue'

const cameraOn = ref(false)
</script>

<template>
    <main class="page">

        <header class="border-bottom p-2">
            <h1 class="text-center">Cadastrar Item</h1>

            <div class="d-flex">
                <button class="btn btn-light me-auto">Voltar</button>
                <button class="btn btn-info me-2" @click="cameraOn=!cameraOn">Escanear</button>
                <button class="btn btn-primary">Salvar</button>
            </div>
        </header>

        <div class="content">
            <Camera />
        </div>
    </main>

</template>
