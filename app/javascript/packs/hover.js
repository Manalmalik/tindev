
const hoverHandle = () => {
  const cards = document.querySelectorAll('.card-category');
  if (cards) {
    cards.forEach(card => {
      card.addEventListener("mouseenter", function(event){
        const colour = card.dataset.colour
        // card.style.boxShadow = `-2px 2px 5px 0px ${colour}`;
        // card.style.webkitBoxShadow = `-2px 2px 5px 0px ${colour}`;
        // card.style.mozBoxShadow = `-2px 2px 5px 0px ${colour}`;
        card.style.border = `1px solid ${colour}`;
      })
    });

    document.querySelectorAll('.card-category').forEach(card => {
      card.addEventListener("mouseleave", function(event){
        card.style.boxShadow = 'none';
        card.style.border = '1px solid #2e2e2e'
      })
    });
  }
};
export { hoverHandle };

