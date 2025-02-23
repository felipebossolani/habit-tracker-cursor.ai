<template>
  <form @submit.prevent="handleSubmit" class="bg-white dark:bg-gray-800 p-6 rounded-lg shadow-md animate-fade-in">
    <div class="space-y-4">
      <div class="flex gap-2">
        <div class="w-20">
          <label class="block text-sm font-medium text-gray-700 dark:text-gray-300 mb-1">
            Emoji
          </label>
          <select
            v-model="selectedEmoji"
            class="input w-full text-center"
            required
          >
            <option value="🚶‍♂️">🚶‍♂️</option>
            <option value="📖">📖</option>
            <option value="💧">💧</option>
            <option value="🏃">🏃</option>
            <option value="🧘">🧘</option>
            <option value="💪">💪</option>
            <option value="🎨">🎨</option>
            <option value="✍️">✍️</option>
            <option value="🎵">🎵</option>
            <option value="🍎">🍎</option>
          </select>
        </div>
        
        <div class="flex-1">
          <label class="block text-sm font-medium text-gray-700 dark:text-gray-300 mb-1">
            Hábito e Meta
          </label>
          <input
            v-model="habitName"
            type="text"
            class="input w-full"
            placeholder="Ex: Caminhar 30 minutos"
            required
          >
        </div>
      </div>

      <button type="submit" class="btn-primary w-full">
        Adicionar Hábito
      </button>
    </div>
  </form>
</template>

<script setup>
import { ref } from 'vue'

const emit = defineEmits(['add-habit'])
const habitName = ref('')
const selectedEmoji = ref('🚶‍♂️')

const handleSubmit = () => {
  emit('add-habit', {
    name: `${selectedEmoji.value} ${habitName.value}`,
  })
  habitName.value = ''
  selectedEmoji.value = '🚶‍♂️'
}
</script> 