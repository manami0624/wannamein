document.querySelectorAll('.category-title').forEach(function(element) {

  element.addEventListener('mouseover', function() {
    const jpText = this.getAttribute('data-jp');
    const krText = this.getAttribute('data-kr');
    this.textContent = krText; // 韓国語にテキストを変更
    this.setAttribute('data-kr', jpText); // 韓国語のデータ属性に日本語のテキストを設定
  });

  element.addEventListener('mouseout', function() {
    const jpText = this.getAttribute('data-jp');
    const krText = this.getAttribute('data-kr');
    this.textContent = jpText; // 日本語にテキストを変更
    this.setAttribute('data-kr', krText); // 日本語のデータ属性に韓国語のテキストを設定
  });
});