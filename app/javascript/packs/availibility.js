

const availibility = () => {
  const action = document.querySelector('.availibity');
  action.addEventListener('click', () => {
    const dot = document.querySelector('.status');
    if(dot.style.backgroundColor == 'rgb(41, 154, 11)') {
      dot.style.backgroundColor = '#ff3019';
    } else {
      dot.style.backgroundColor = 'rgb(41, 154, 11)';
    }
  });
};

export{ availibility }
