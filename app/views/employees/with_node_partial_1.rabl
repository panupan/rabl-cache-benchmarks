attribute :id, :name, :age, :profile 

node :subordinates do |employee|          
  employee.subordinates.map do |subordinate| 
	{ :subordinate => partial("employees/with_node_partial_1", :object => subordinate) }
  end
end 
