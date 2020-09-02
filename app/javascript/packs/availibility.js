

const availibility = () => {
  const action = document.querySelector('.availibity');
  action.addEventListener('click', () => {
    const dot = document.querySelector('.status');
    if(dot.style.backgroundColor == 'green') {
      dot.style.backgroundColor = '';
    } else {
      dot.style.backgroundColor = 'green';
    }
  });
};

export{ availibility }
