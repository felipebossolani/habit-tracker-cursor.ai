<template>
  <div class="bg-white dark:bg-gray-800 p-6 rounded-lg shadow-md">
    <h2 class="text-xl font-bold text-gray-800 dark:text-white mb-4">
      Histórico dos Últimos 7 Dias
    </h2>
    
    <div class="overflow-x-auto">
      <table class="w-full">
        <thead>
          <tr>
            <th class="text-left text-gray-600 dark:text-gray-400 px-4">Hábito</th>
            <th
              v-for="day in days"
              :key="day"
              class="text-center text-gray-600 dark:text-gray-400 px-4"
            >
              {{ day }}
            </th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="habit in habits" :key="habit.id" class="border-t dark:border-gray-700">
            <td class="py-3 text-gray-800 dark:text-white px-4 text-left">{{ habit.name }}</td>
            <td
              v-for="(completed, index) in habit.completed"
              :key="index"
              class="text-center px-4"
            >
              <span :class="completed ? 'text-green-500' : 'text-gray-400'">
                {{ completed ? '✓' : '○' }}
              </span>
            </td>
          </tr>
        </tbody>
      </table>
    </div>
  </div>
</template>

<script setup>
import { computed } from 'vue'

defineProps({
  habits: {
    type: Array,
    required: true
  }
})

const days = computed(() => {
  const today = new Date()
  return Array(7)
    .fill()
    .map((_, i) => {
      const date = new Date(today)
      date.setDate(date.getDate() - i)
      return date.toLocaleDateString('pt-BR', { weekday: 'short' })
    })
    .reverse()
})
</script> 