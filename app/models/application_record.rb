class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  Rails.application.config.assets.paths << Rails.root.join("vendor", "original_assets", "images")

end
