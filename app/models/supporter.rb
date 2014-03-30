class Supporter < ActiveRecord::Base
	
	validates :name, :email, presence: :true

	default_scope order("status DESC")


	def self.search_by(search_term)
		where(["LOWER(name) 			LIKE :search_term OR 
						LOWER(email) 			LIKE :search_term OR 
						LOWER(message) 		LIKE :search_term OR
						LOWER(department) LIKE :search_term", 
						{search_term: "%#{search_term.downcase}%"}]
			   )
	end

end
