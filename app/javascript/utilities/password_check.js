import { PasswordConfirmation } from './PasswordConfirmation.js'

document.addEventListener('turbolinks:load', function () {
  const reg_form = document.querySelector('.new_user')
  if (reg_form.elements.confirm_password) new PasswordConfirmation(reg_form)
})