export function toggleMenu() {
    console.log("Menu toggled!");
    document.querySelector(".nav-left .nav-links").classList.toggle("active");
    document.querySelector(".nav-right").classList.toggle("active");
    document.querySelector(".nav-middle").classList.toggle("active");
}