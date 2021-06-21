import { ProgressBar } from './utilities/ProgressBar.js'

document.addEventListener('turbolinks:load', function () {
  const progressBar = document.getElementById('progress_bar')

  if (progressBar) new ProgressBar('progress_bar')
})
