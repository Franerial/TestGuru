export class TimerBar {
  constructor(timerBarId) {
    this.timerBar = document.getElementById(timerBarId)
    this.timerBarValue = this.timerBar.querySelector('.timer-bar-value')
    this.testPassageId = this.timerBarValue.dataset.testPassageId
    this.endTime = this.timerBarValue.dataset.endTime

    this.CreateBar()
  }

  CreateBar() {
    this.timerBarValue.classList.remove('hide')

    const countDownDate = new Date(this.endTime).getTime()

    this.interval = setInterval(() => this.updateBarValue(countDownDate), 1000)
  }

  updateBarValue(countDownDate) {
    var now = new Date().getTime()

    var distance = countDownDate - now

    var days = Math.floor(distance / (1000 * 60 * 60 * 24))
    var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60))
    var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60))
    var seconds = Math.floor((distance % (1000 * 60)) / 1000)

    this.timerBarValue.innerHTML = days + "d " + hours + "h "
      + minutes + "m " + seconds + "s "

    if (distance < 0) {
      clearInterval(this.interval)
      window.location = this.testPassageId + "/result"
    }
  }
}
