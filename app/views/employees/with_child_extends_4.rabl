cache root_object 
attribute :id, :name, :age, :profile 

child :subordinates => :subordinates do	
	# Why does calling cache here make any difference?
	cache root_object
	extends "employees/with_child_extends_4"
end

