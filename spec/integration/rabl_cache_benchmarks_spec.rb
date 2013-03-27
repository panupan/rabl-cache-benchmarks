require 'spec_helper'

describe "Rabl Cache Benchmarks" do  
  let(:num_trials)          { 10    }
  let(:num_depth)           { 5     }
  let(:rebuild_from_cache)  { true  }

  before :all do
    @expectated = nil
    puts "====================="
    puts "num_trials:          #{num_trials}"
    print "num_depth:           #{num_depth}"    
    
    @ceo = FactoryGirl.create(:employee)
    create_employees(@ceo, num_depth)
    
    puts " (#{Employee.all.count} employees)"
    puts "rebuild_from_cache:  #{rebuild_from_cache}"    
    puts "version:             #{Rabl::VERSION}"
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
    puts ""
    puts "Benchmarking '#{source}'..."

    # Start with a fresh cache.
    Rails.cache.clear
    
    # Rendering...
    total_time = 0
    for i in 1..num_trials do
      time = Benchmark.realtime {
          renderer = Rabl::Renderer.new(source, @ceo, :format => 'json', :view_path => "app/views")
          json = renderer.render

          @expectated = @expected || json # set once
          json.should eql @expectated     # all responses should be the exact same
      }
      puts "run ##{i}: #{time.round(4)}s"
      total_time += time
      
      if rebuild_from_cache
        Rails.cache.delete(ActiveSupport::Cache.expand_cache_key([@ceo, nil, 'json'], 'rabl'))      
      end
    end

    #puts "TOTAL: #{total_time.round(4)}s"
    puts "AVG:   #{(total_time/num_trials).round(4)}s"
  end

  it "child extends - caching off" do
    self.benchmark "employees/with_child_extends_1"
  end

  it "child extends - caching on" do
    self.benchmark "employees/with_child_extends_2"
  end

  it "child extends - caching on but 100% misses" do
    self.benchmark "employees/with_child_extends_3"
  end

  it "node partial - caching off" do
    self.benchmark "employees/with_node_partial_1"
  end

  it "node partial - caching on" do
    self.benchmark "employees/with_node_partial_2"
  end    
end
