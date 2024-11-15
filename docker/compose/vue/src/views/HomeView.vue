<script setup lang="ts">
import { onMounted } from 'vue'
import { FrontendApi, Configuration } from '@ory/client'

const basePath = 'http://localhost:4000'
const ory = new FrontendApi(
  new Configuration({
    basePath: 'http://localhost:4455',
  }),
)

const apiUrl = import.meta.env.VITE_API_URL

onMounted(() => {
  ory.toSession().then(({ data }) => {
    console.log(data)
  })
})
</script>

<template>
  <div class=""></div>
</template>
