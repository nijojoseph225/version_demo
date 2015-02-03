# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
module BSON
  class ObjectId
    def as_json(*args)
      to_s
    end
  end
end

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
