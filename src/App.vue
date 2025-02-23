<script setup>
import { ref, onMounted } from 'vue'
import HabitForm from './components/HabitForm.vue'
import HabitList from './components/HabitList.vue'
import HabitHistory from './components/HabitHistory.vue'

// Adicionar estado para o modo escuro
const isDarkMode = ref(false)

// Adicionar os hábitos iniciais
const habits = ref([
  {
    id: 1,
    name: '🚶‍♂️ Caminhar 30 minutos',
    completed: Array(7).fill(false),
  },
  {
    id: 2,
    name: '📖 Ler 10 páginas',
    completed: Array(7).fill(false),
  },
  {
    id: 3,
    name: '💧 Beber 2 litros de água',
    completed: Array(7).fill(false),
  },
])

// Função para alternar o modo escuro
const toggleDarkMode = () => {
  isDarkMode.value = !isDarkMode.value
  document.documentElement.classList.toggle('dark')
}

// Função para adicionar hábito
const addHabit = (habit) => {
  habits.value.push({
    id: Date.now(),
    name: habit.name,
    completed: Array(7).fill(false),
  })
}

// Função para marcar hábito como concluído
const toggleHabit = (habitId) => {
  const habit = habits.value.find(h => h.id === habitId)
  if (habit) {
    habit.completed[0] = !habit.completed[0]
    if (habit.completed[0]) {
      showMotivationalMessage()
    }
  }
}

// Função para mostrar mensagem motivacional
const showMotivationalMessage = () => {
  const messages = [
    "Ótimo trabalho! 🎉",
    "Continue assim! 💪",
    "Você está arrasando! ⭐",
    "Mais um passo em direção ao seu objetivo! 🎯"
  ]
  alert(messages[Math.floor(Math.random() * messages.length)])
}

// Verificar preferência de modo escuro do sistema ao carregar
onMounted(() => {
  if (window.matchMedia('(prefers-color-scheme: dark)').matches) {
    isDarkMode.value = true
    document.documentElement.classList.add('dark')
  }
})
</script>

<template>
  <div class="min-h-screen bg-gray-50 dark:bg-gray-900 transition-colors duration-200">
    <div class="container mx-auto px-4 py-8">
      <header class="flex justify-between items-center mb-8">
        <h1 class="text-3xl font-bold text-gray-800 dark:text-white">Habit Tracker</h1>
        <button
          @click="toggleDarkMode"
          class="p-2 rounded-lg bg-gray-200 dark:bg-gray-700"
        >
          {{ isDarkMode ? '🌞' : '🌙' }}
        </button>
      </header>

      <HabitForm @add-habit="addHabit" />
      
      <div class="mt-8">
        <HabitList 
          :habits="habits"
          @toggle-habit="toggleHabit"
        />
      </div>

      <HabitHistory :habits="habits" class="mt-8" />
    </div>
  </div>
</template>

<style scoped>
.logo {
  height: 6em;
  padding: 1.5em;
  will-change: filter;
  transition: filter 300ms;
}
.logo:hover {
  filter: drop-shadow(0 0 2em #646cffaa);
}
.logo.vue:hover {
  filter: drop-shadow(0 0 2em #42b883aa);
}
</style>
