// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import * as Rails from "@rails/ujs";
import { toggleMenu } from "menu_toggle";
window.toggleMenu = toggleMenu;
Rails.default.start();

