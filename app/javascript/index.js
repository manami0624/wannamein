console.log("読み込み完了");

function updateJumpButtonVisibility() {
  var jumpBtn = document.getElementById('jump');
  var scrollTop = document.documentElement.scrollTop || document.body.scrollTop;

  if (scrollTop === 0) {
    jumpBtn.style.display = 'none';
  } else {
    jumpBtn.style.display = 'block';
  }
}

window.addEventListener('scroll', updateJumpButtonVisibility);

var jumpBtn = document.getElementById('jump');
jumpBtn.addEventListener('click', function() {
  window.scrollTo(0, 0);
});

window.addEventListener('DOMContentLoaded', function() {
  updateJumpButtonVisibility();
});