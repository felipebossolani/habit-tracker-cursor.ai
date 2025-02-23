import { defineConfig } from 'vite'
import vue from '@vitejs/plugin-vue'

// https://vite.dev/config/
export default defineConfig({
  base: '/habit-tracker-cursor.ai/',
  plugins: [vue()],
})
