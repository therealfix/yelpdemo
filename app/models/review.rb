class Review < ActiveRecord::Base

	belongs_to :user
	belongs_to :restaurants

end
# placeholder to save with git msg