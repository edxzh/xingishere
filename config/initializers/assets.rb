# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
Rails.application.config.assets.precompile += %w( kindeditor.js application.js account.js blogs.js comments.js users.js bootstrap.js home.js home.css link_category.js links.js messages.js pages.js sessions.js tips.js admin/blogs.js admin/comments.js admin/link_category.js admin/links.js admin/messages.js admin/tips.js admin/user.js admin/blog_categories.js admin/subscribes.js admin/common.css )
