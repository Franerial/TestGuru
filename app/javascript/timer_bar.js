import { TimerBar } from './utilities/TimerBar.js'

document.addEventListener('turbolinks:load', function () {
  const timerBarId = 'timer_bar'
  const timerBar = document.getElementById(timerBarId)

  let timerBarValue = 0
  let endTime = 0
  let testPassageId = 0

  if (timerBar) {
    timerBarValue = timerBar.querySelector('.timer-bar-value')
    endTime = timerBarValue.dataset.endTime
    testPassageId = timerBarValue.dataset.testPassageId
  }

  if ((timerBar) && (endTime)) new TimerBar(timerBarId)
})
