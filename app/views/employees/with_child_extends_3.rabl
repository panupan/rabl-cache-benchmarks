cache root_object 
attribute :id, :name, :age, :profile 

child :subordinates => :subordinates do
	extends "employees/with_child_extends_2"
end
