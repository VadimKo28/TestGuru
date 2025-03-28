document.addEventListener('turbolinks:load', () => {
  const progressBarInner = document.querySelector('.progress-bar-inner')

 if (progressBarInner) { progressTestLine(progressBarInner) }
})

function progressTestLine(line) {
  const testPassage = document.querySelector('.test_passage')

  const questionCount = testPassage.dataset.questionCount

  const numberQuestion = testPassage.dataset.numberCurrentQuestion

  line.style.width = `${calculateProgressStep(questionCount) * (numberQuestion - 1)}%`
}

function calculateProgressStep(count) {
  return 100 / count
}
