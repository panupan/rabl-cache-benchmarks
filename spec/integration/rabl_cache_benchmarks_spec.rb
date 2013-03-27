require 'spec_helper'

describe "Rabl Cache Benchmarks" do  
  let(:num_trials)          { 10    }
  let(:num_depth)           { 5     }
  let(:rebuild_from_caches) { true }

  before :all do
    @expectated = nil
    puts "Rabl VERSION:        #{Rabl::VERSION}"
    puts "num_trials:          #{num_trials}"
    puts "num_depth:           #{num_depth} "
    puts "rebuild_from_caches: #{rebuild_from_caches}"
    puts ""
    print "Creating employees..."
    @ceo = FactoryGirl.create(:employee)
    create_employees(@ceo, num_depth)
    puts " #{Employee.all.count} created!"
    puts ""
  end

  def create_employees(employee, num_depth, current_depth=1)
    return if current_depth >= num_depth
    
    for i in 1..current_depth**2
      subordinate = FactoryGirl.create(:employee, :manager => employee)
      create_employees(subordinate, num_depth, current_depth+1)
    end
  end

  def benchmark(source="")
    puts "Benchmarking '#{source}'..."

    # Start with fresh cache
    Rails.cache.clear
    
    # Rendering...
    total_time = 0
    for i in 1..num_trials do
      time = Benchmark.realtime {
          renderer = Rabl::Renderer.new(source, @ceo, :format => 'json', :view_path => "app/views")
          json = renderer.render # outputs a string
          @expectated = json if @expectated.nil?
          json.should eql @expectated
          #puts json
      }
      puts "##{i}: #{time.round(4)}s"
      total_time += time
      
      if rebuild_from_caches
        # Simulates changed data
        Rails.cache.delete(ActiveSupport::Cache.expand_cache_key([@ceo, nil, 'json'], 'rabl'))      
        Rails.cache.delete(ActiveSupport::Cache.expand_cache_key([@ceo.subordinates.last, nil, 'json'], 'rabl'))
      end
    end

    puts "Total: #{total_time.round(4)}s"
    puts "AVG:   #{(total_time/num_trials).round(4)}s"
  end

  it "child extends - no caching" do
    self.benchmark "employees/with_child_extends_1"
  end

  it "child extends - cache miss penalty" do
    self.benchmark "employees/with_child_extends_2"
  end

  it "child extends - caching enabled" do
    self.benchmark "employees/with_child_extends_3"
  end

  it "child extends - cache before extend (strange)" do
    self.benchmark "employees/with_child_extends_4"
  end

  it "node partial - no caching" do
    self.benchmark "employees/with_node_partial_1"
  end

  it "node partial - caching enabled" do
    self.benchmark "employees/with_node_partial_2"
  end    
end
