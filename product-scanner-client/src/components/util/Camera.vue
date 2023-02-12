<script setup>
// import Camera from "simple-vue-camera"
import {ref, computed} from 'vue'

import Quagga from 'quagga'; // ES6

const started = ref(false)

function start() {
    if(started.value)
        return

    started.value = true

    console.log('a')
    Quagga.init({
        inputStream : {
            name : "Live",
            type : "LiveStream",
            target: document.querySelector('#camera-obj'),
            constraints: {
                
                deviceId: '48092dac974350291dab264a74df34f4b681c4112843d4a9098ca72dd52122c3'
            }
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
    Quagga.onDetected((data) => {
        window.alert(JSON.stringify(data))
    })
}

</script>

<template>
    <button class="a" @click="start"> {{started ? 'Desligar' : 'Ligar'}} </button>
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
