Some benchmarks to test out Rabl template caching.

```
$ bundle install
$ rspec spec
```

```
Rabl Cache Benchmarks
Rabl VERSION:        0.8.1
num_trials:          10
num_depth:           5 
rebuild_from_caches: true

Creating employees... 618 created!


Benchmarking 'employees/with_child_extends_1'...
#1: 0.9138s
#2: 0.5746s
#3: 0.5727s
#4: 0.5782s
#5: 0.5792s
#6: 0.5835s
#7: 0.579s
#8: 0.5774s
#9: 0.5787s
#10: 0.5789s
Total: 6.1159s
AVG:   0.6116s
  child extends - no caching

Benchmarking 'employees/with_child_extends_2'...
#1: 0.8344s
#2: 0.7559s
#3: 0.7442s
#4: 0.7609s
#5: 0.7587s
#6: 0.8003s
#7: 0.7813s
#8: 0.7815s
#9: 0.7803s
#10: 0.7843s
Total: 7.7819s
AVG:   0.7782s
  child extends - cache miss penalty

Benchmarking 'employees/with_child_extends_3'...
#1: 0.7864s
#2: 0.7805s
#3: 0.7893s
#4: 0.7863s
#5: 0.7829s
#6: 0.7847s
#7: 0.7796s
#8: 0.743s
#9: 0.7789s
#10: 0.7816s
Total: 7.7932s
AVG:   0.7793s
  child extends - caching enabled

Benchmarking 'employees/with_child_extends_4'...
#1: 0.7018s
#2: 0.1742s
#3: 0.1658s
#4: 0.1991s
#5: 0.1556s
#6: 0.1953s
#7: 0.1468s
#8: 0.1884s
#9: 0.144s
#10: 0.1864s
Total: 2.2573s
AVG:   0.2257s
  child extends - cache before extend (strange)

Benchmarking 'employees/with_node_partial_1'...
#1: 0.2178s
#2: 0.2673s
#3: 0.2923s
#4: 0.2715s
#5: 0.2775s
#6: 0.2605s
#7: 0.2815s
#8: 0.2724s
#9: 0.2761s
#10: 0.2785s
Total: 2.6954s
AVG:   0.2695s
  node partial - no caching

Benchmarking 'employees/with_node_partial_2'...
#1: 0.4497s
#2: 0.4629s
#3: 0.4263s
#4: 0.434s
#5: 0.4044s
#6: 0.4544s
#7: 0.4209s
#8: 0.4211s
#9: 0.4366s
#10: 0.4396s
Total: 4.35s
AVG:   0.435s
  node partial - caching enabled

Finished in 56.7 seconds
6 examples, 0 failures
```
