# Demonstrates penalty for cache misses

cache root_object, :expires_in => 0
attribute :id, :name, :age, :profile

child :subordinates => :subordinates do
	extends "employees/with_child_extends_3"
end
