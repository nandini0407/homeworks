document.addEventListener("DOMContentLoaded", () => {
  // toggling restaurants

  const toggleLi = (e) => {
    const li = e.target;
    if (li.className === "visited") {
      li.className = "";
    } else {
      li.className = "visited";
    }
  };

  document.querySelectorAll("#restaurants li").forEach((li) => {
    li.addEventListener("click", toggleLi);
  });



  // adding SF places as list items

  // --- your code here!
const handleFavoriteSubmit = (e) => {
  e.preventDefault();
  const favoriteInput = document.querySelector('.favorite-input');
  const favorite = favoriteInput.value;
  favoriteInput.value = "";

  const ul = document.getElementById("sf-places");
  const li = document.createElement("li");
  li.textContent = favorite;

  ul.appendChild(li);
};

const listSubmitButton = document.querySelector('.favorite-submit');
listSubmitButton.addEventListener("click", handleFavoriteSubmit);

  // adding new photos

  // --- your code here!
const showPhotoForm = (e) => {
  e.preventDefault();
  const photoForm = document.querySelector('.photo-form-container');
  const photoShowButton = document.querySelector('.photo-show-button');
  
};


});
