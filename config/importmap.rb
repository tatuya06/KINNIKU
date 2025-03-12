# Pin npm packages by running ./bin/importmap

pin "application"
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin_all_from "app/javascript/controllers", under: "controllers"

# config/importmap.rb
pin "stimulus", to: "@hotwired/stimulus.js"
pin "@hotwired/stimulus-importmap-autoloader", to: "@hotwired/stimulus-importmap-autoloader.js"
pin "chartkick", to: "chartkick.js"
pin "chart.js", to: "chart.js"

