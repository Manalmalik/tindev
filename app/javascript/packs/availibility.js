

const availibility = () => {
  const action = document.querySelector('.availibity');
  action.addEventListener('click', () => {
    const dot = document.querySelector('.status');
    if(dot.style.backgroundColor == '#299a0b') {
      dot.style.backgroundColor = '#ff3019';
    } else {
      dot.style.backgroundColor = '#299a0b';
    }
  });
};

export{ availibility }
