export function toggleMenu() {
    console.log("Menu toggled!");
    const navLeft = document.querySelector(".nav-left .nav-links");
    const navMiddle = document.querySelector(".nav-middle");
    const navRight = document.querySelector(".nav-right");
  
    // Toggle 'active' class on the nav-left, nav-middle, and nav-right
    navLeft.classList.toggle("active");
    navMiddle.classList.toggle("active");
    navRight.classList.toggle("active");
  }
  