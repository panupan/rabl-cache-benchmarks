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
#1: 0.9073s
#2: 0.5593s
#3: 0.5613s
#4: 0.5664s
#5: 0.5703s
#6: 0.5801s
#7: 0.5682s
#8: 0.5743s
#9: 0.5734s
#10: 0.572s
Total: 6.0325s
AVG:   0.6032s
  child extends - no caching
Benchmarking 'employees/with_child_extends_2'...
#1: 0.8113s
#2: 0.7388s
#3: 0.742s
#4: 0.7558s
#5: 0.7525s
#6: 0.7776s
#7: 0.7756s
#8: 0.7627s
#9: 0.7718s
#10: 0.7778s
Total: 7.666s
AVG:   0.7666s
  child extends - cache miss penalty
Benchmarking 'employees/with_child_extends_3'...
#1: 0.7848s
#2: 0.7653s
#3: 0.7694s
#4: 0.7651s
#5: 0.7608s
#6: 0.7655s
#7: 0.7648s
#8: 0.7749s
#9: 0.7182s
#10: 0.7874s
Total: 7.6563s
AVG:   0.7656s
  child extends - caching enabled
Benchmarking 'employees/with_child_extends_4'...
#1: 0.7588s
#2: 0.1853s
#3: 0.1488s
#4: 0.1943s
#5: 0.1477s
#6: 0.1911s
#7: 0.1407s
#8: 0.1902s
#9: 0.149s
#10: 0.1923s
Total: 2.2982s
AVG:   0.2298s
  child extends - cache before extend (strange)
Benchmarking 'employees/with_node_partial_1'...
#1: 0.213s
#2: 0.2843s
#3: 0.2917s
#4: 0.2917s
#5: 0.2964s
#6: 0.2636s
#7: 0.2884s
#8: 0.2736s
#9: 0.2771s
#10: 0.2754s
Total: 2.7552s
AVG:   0.2755s
  node partial - no caching
Benchmarking 'employees/with_node_partial_2'...
#1: 0.4497s
#2: 0.477s
#3: 0.4327s
#4: 0.437s
#5: 0.4111s
#6: 0.4442s
#7: 0.4557s
#8: 0.4341s
#9: 0.4431s
#10: 0.4416s
Total: 4.4261s
AVG:   0.4426s
  node partial - caching enabled

Finished in 56 seconds
6 examples, 0 failures
```
