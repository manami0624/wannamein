function updateJumpButtonVisibility() {
  const jumpBtn = document.getElementById('jump');
  const scrollTop = document.documentElement.scrollTop || document.body.scrollTop;

  if (scrollTop === 0) {
    jumpBtn.style.display = 'none';
  } else {
    jumpBtn.style.display = 'block';
  }
}

window.addEventListener('scroll', updateJumpButtonVisibility);

const jumpBtn = document.getElementById('jump');
jumpBtn.addEventListener('click', function() {
  window.scrollTo({
    top: 0,
    behavior: 'smooth'
  });
});

window.addEventListener('DOMContentLoaded', function() {
  updateJumpButtonVisibility();

  // 画面が一番上までスクロールされたときにマークを非表示にする
  window.addEventListener('scroll', function() {
    if (window.scrollY === 0) {
      jumpBtn.style.display = 'none';
    }
  });
});
