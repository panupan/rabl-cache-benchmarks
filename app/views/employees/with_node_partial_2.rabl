cache root_object 
attribute :id, :name, :age, :profile 

node :subordinates do |employee|          
  employee.subordinates.map do |subordinate| 
	{ :subordinate => partial("employees/with_node_partial_2", :object => subordinate) }
  end
end 
