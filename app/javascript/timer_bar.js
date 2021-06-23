import { TimerBar } from './utilities/TimerBar.js'

document.addEventListener('turbolinks:load', function () {
  const timerBar = document.getElementById('timer_bar')

  if (timerBar) new TimerBar('timer_bar')
})
