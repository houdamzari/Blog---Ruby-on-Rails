// app/javascript/application.js
import "@hotwired/turbo-rails";
import "controllers";
import * as Rails from "rails-ujs";
import { Turbo } from "@hotwired/turbo-rails";

Rails.start();
window.Turbo = Turbo;
