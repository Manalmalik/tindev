

const availibility = () => {
  const action = document.querySelector('.availibity');
  action.addEventListener('click', () => {
    const dot = document.querySelector('.status');
    const status = document.querySelector('.availibity');
    if(dot.style.backgroundColor == 'rgb(41, 154, 11)') {
      dot.style.backgroundColor = '#ff3019';
      status.innerHTML ='Offline';
      status.style.color = '#ff3019';

    } else {
      dot.style.backgroundColor = 'rgb(41, 154, 11)';
      status.innerHTML ='Online';
      status.style.color = 'rgb(41, 154, 11)';
    }
  });
};

export{ availibility }
