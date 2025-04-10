document.addEventListener('turbolinks:load', () => {
  const timerObject = document.querySelector('.timer')

  if (timerObject) { updateTimer(timerObject) }
})

function updateTimer(object) {
  const minutes = object.dataset.testTimer

  const rootUrl = object.dataset.rootUrl

  let seconds = minutes * 60

  setInterval(function() {
    object.textContent = `Осталось ${seconds} секунд`

    seconds -= 1

    if (seconds == 0) {
      window.location.href = rootUrl
    }
  }, 1000)
}

