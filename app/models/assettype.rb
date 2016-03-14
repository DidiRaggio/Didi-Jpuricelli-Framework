class Assettype < ActiveRecord::Base
	:name
	has_many :assets
end
