// document.getElementById('showContentButton').addEventListener('click', function() {
//     document.querySelector('.nav-item').style.display = 'block'
//     document.querySelector('.user').style.display = 'block'
//     document.querySelector('nav .container').style.flexDirection = 'column'
    
// });

// document.getElementById('showContentButton').addEventListener('click', function() {
//     const navItem = document.querySelector('.nav-item');
//     const user = document.querySelector('.user');
//     const navContainer = document.querySelector('nav .container');

//     const isContentVisible = navItem.style.display === 'block';

//     navItem.style.display = isContentVisible ? 'none' : 'block';
//     user.style.display = isContentVisible ? 'none' : 'block';
//     navContainer.style.flexDirection = isContentVisible ? 'row' : 'column';
// });


// Function to toggle the display and flex direction
function toggleContent() {
    const navItem = document.querySelector('.nav-item');
    const user = document.querySelector('.user');
    const navContainer = document.querySelector('nav .container');

    const isContentVisible = navItem.style.display === 'block';
    document.querySelector('nav').style.height = isContentVisible ? '15%' : '100%';
    navItem.style.display = isContentVisible ? 'none' : 'block';
    user.style.display = isContentVisible ? 'none' : 'block';
    navContainer.style.flexDirection = isContentVisible ? 'row' : 'column';
}

// Function to set layout based on window width
function setLayout() {
    const navItem = document.querySelector('.nav-item');
    const user = document.querySelector('.user');
    const navContainer = document.querySelector('nav .container-nav');

    if (window.innerWidth > 720) {
        navItem.style.display = 'block';
        user.style.display = 'block';
        navContainer.style.flexDirection = 'row';
    } else {
        navItem.style.display = 'none';
        user.style.display = 'none';
        navContainer.style.flexDirection = 'row';
    }
}

// Add event listener for the button click
document.getElementById('showContentButton').addEventListener('click', toggleContent);

// Add event listener for window resize
window.addEventListener('resize', setLayout);

// Initial layout setup
setLayout();










$(document).ready(function(){
    $(".owl-carousel").owlCarousel();
  });



  var tl = gsap.timeline()

  tl.from(".content-side", {
      x: -1000,
      duration: 0.7,
      delay: 2,
  })
  
  tl.from(".image-side", {
    x: 1000,
    duration: 1.0,
    delay: 0,
  })













  