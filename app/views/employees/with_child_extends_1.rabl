attribute :id, :name, :age, :profile 

child :subordinates => :subordinates do
	extends "employees/with_child_extends_1"
end
