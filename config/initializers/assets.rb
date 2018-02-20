# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.
Rails.application.config.assets.paths << Rails.root.join('node_modules')

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
Rails.application.config.assets.precompile +=
%w(
  home.js home.css
  shelters.js shelters.css
  pets.js pets.css
  users.js users.css
  pages.js pages.css
  admin/home.js admin/home.css
  admin/settings.js admin/settings.css
  admin/users.js admin/users.css
  admin/shelters.js admin/shelters.css
  admin/pets.js admin/pets.css
)
