<template>
  <div class="space-y-4">
    <div
      v-for="habit in habits"
      :key="habit.id"
      class="bg-white dark:bg-gray-800 p-4 rounded-lg shadow-md flex items-center justify-between animate-slide-in"
    >
      <div class="flex-1">
        <h3 class="text-lg font-medium text-gray-800 dark:text-white text-left">
          {{ habit.name }}
        </h3>
      </div>
      
      <button
        @click="$emit('toggle-habit', habit.id)"
        :class="[
          'btn',
          habit.completed[0]
            ? 'bg-green-500 hover:bg-green-600 text-white'
            : 'bg-gray-200 hover:bg-gray-300 dark:bg-gray-700 dark:hover:bg-gray-600'
        ]"
      >
        {{ habit.completed[0] ? '✓' : '○' }}
      </button>
    </div>
  </div>
</template>

<script setup>
defineProps({
  habits: {
    type: Array,
    required: true
  }
})
</script> 