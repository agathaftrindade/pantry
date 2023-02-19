<script setup>
// import Camera from "simple-vue-camera"
import {ref, computed, defineEmits, onMounted, onBeforeUnmount} from 'vue'

import Quagga from 'quagga'; // ES6

const started = ref(false)
const timeouted = ref(false)

const emit = defineEmits(['scan'])

onMounted(() => {
    Quagga.init({
        inputStream : {
            name : "Live",
            type : "LiveStream",
            target: document.querySelector('#camera-obj'),
            constraints: {
                width: 1280,
                // deviceId: 'fdf84561694b31da5bfeb0e8ce131a113158d6fbd24188d3f27e84a837378bde'
            },
        },
        locate: true,
        locator: {
            halfSample: true
        },
        decoder : {
            readers : ["ean_reader"]
        },

    }, function(err) {
        if (err) {
            console.log(err);
            return
        }
        console.log("Initialization finished. Ready to start");
        Quagga.start();
    })
    const onDetected = Quagga.onDetected((data) => {
        emit('scan', data.codeResult.code)
        Quagga.offDetected(onDetected)
    })
})

onBeforeUnmount(() => {
    console.log('unmounted')
    Quagga.stop()

})

</script>

<template>
    <div id="camera-obj">
    </div>

</template>

<style>

.a {
    width: 100%;
}

#camera-obj {
    width: 100%;
    height: 100%;
}
</style>
