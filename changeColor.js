function showColorPicker() {
    const html = document.getElementById('html');
    const body = document.getElementById('body');
    const h1s = document.getElementsByTagName('h1');
    const colorPicker = document.createElement('input');
    colorPicker.type = 'color';
    body.insertAdjacentElement("afterbegin", colorPicker);
    

    colorPicker.addEventListener('change', function() {
      document.documentElement.style.backgroundColor = colorPicker.value;
      for (let i = 0; i < h1s.length; i++) {
        h1s[i].style.color = colorPicker.value;
      }
    });
  }

  showColorPicker();