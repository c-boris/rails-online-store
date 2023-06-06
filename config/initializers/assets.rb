# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = "1.0"

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
Rails.application.config.assets.paths << Rails.root.join("node_modules/bootstrap-icons/font")

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
# Rails.application.config.assets.precompile += %w( admin.js admin.css )

Rails.application.config.assets.paths << Rails.root.join("lib", "assets", "stylesheets")
Rails.application.config.assets.paths << Rails.root.join("lib", "assets", "javascript")
vendor_path = Rails.root.join("vendor")
Dir.glob(vendor_path.join("**/*")).each do |dir|
  Rails.application.config.assets.paths << dir if File.directory?(dir)
end

Rails.application.config.assets.precompile += %w( bootstrap.min.css style.css animate.css slick.css slick-theme.css jquery/dist/jquery.min.js bootstrap/js/bootstrap.min.js bootstrap-touchspin/dist/jquery.bootstrap-touchspin.min.js instafeed/instafeed.min.js ekko-lightbox/dist/ekko-lightbox.min.js syo-timer/build/jquery.syotimer.min.js slick/slick.min.js slick/slick-animation.min.js google-map/gmap.js )
