class Supporter < ActiveRecord::Base
	
	validates :name, :email, presence: :true

	default_scope order("status DESC")

end
