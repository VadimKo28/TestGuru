document.addEventListener('turbolinks:load', () => {
  const passwordInput = document.getElementById('user_password')
  const passwordConfirmationInput = document.getElementById('user_password_confirmation')
  const errorMessage = document.getElementById('error_message')
  const successMessage = document.getElementById('success_message');

  function checkPasswordConfirmation() {
    if(passwordConfirmationInput.value === ''){
      return
    } else if (passwordInput.value === passwordConfirmationInput.value) {
      errorMessage.style.display = 'none'
      successMessage.style.display = 'inline'
    } else {
      successMessage.style.display = 'none'
      errorMessage.style.display = 'inline'
    }
  }

  if (passwordInput) {passwordInput.addEventListener('input', checkPasswordConfirmation)}
  if (passwordConfirmationInput) {passwordConfirmationInput.addEventListener('input', checkPasswordConfirmation)}
})


