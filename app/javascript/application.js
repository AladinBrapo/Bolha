// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import Rails from "rails-ujs"
Rails.start()

function toggleMenu() {
    document.querySelector(".nav-links").classList.toggle("active");
    document.querySelector(".nav-right").classList.toggle("active");
  }
  
