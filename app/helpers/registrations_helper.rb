module RegistrationsHelper
	def add_person_link(name)
		link_to_function name do |page|
			page.insert_html :bottom, :newregistrations, :partial => 'registration', :object => Registration.new
		end
	end
end
