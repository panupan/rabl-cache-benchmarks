Some benchmarks to test out Rabl template caching.

```
$ bundle install
$ rspec spec
```

Actual
======

```
Rabl Cache Benchmarks
=====================
num_trials:          10
num_depth:           5 (618 employees)
rebuild_from_cache:  true
version:             0.8.1


Benchmarking 'employees/with_child_extends_1'...
run #1: 0.9232s
run #2: 0.5833s
run #3: 0.5837s
run #4: 0.6537s
run #5: 0.6555s
run #6: 0.5919s
run #7: 0.5886s
run #8: 0.5806s
run #9: 0.5833s
run #10: 0.593s
AVG:   0.6337s
  child extends - caching off

Benchmarking 'employees/with_child_extends_2'...
run #1: 0.8438s
run #2: 0.744s
run #3: 0.7423s
run #4: 0.7669s
run #5: 0.7608s
run #6: 0.7765s
run #7: 0.776s
run #8: 0.7715s
run #9: 0.7753s
run #10: 0.7715s
AVG:   0.7729s
  child extends - caching on

Benchmarking 'employees/with_child_extends_3'...
run #1: 0.7824s
run #2: 0.7851s
run #3: 0.7756s
run #4: 0.7765s
run #5: 0.7744s
run #6: 0.7735s
run #7: 0.7752s
run #8: 0.7837s
run #9: 0.7392s
run #10: 0.7852s
AVG:   0.7751s
  child extends - caching on but 100% misses

Benchmarking 'employees/with_node_partial_1'...
run #1: 0.214s
run #2: 0.2758s
run #3: 0.3096s
run #4: 0.2685s
run #5: 0.2909s
run #6: 0.261s
run #7: 0.2783s
run #8: 0.2852s
run #9: 0.28s
run #10: 0.2832s
AVG:   0.2747s
  node partial - caching off

Benchmarking 'employees/with_node_partial_2'...
run #1: 0.447s
run #2: 0.4722s
run #3: 0.4242s
run #4: 0.4454s
run #5: 0.4049s
run #6: 0.4464s
run #7: 0.4353s
run #8: 0.4413s
run #9: 0.4388s
run #10: 0.4439s
AVG:   0.44s
  node partial - caching on

Finished in 56.9 seconds
6 examples, 0 failures
```

Expected
========

```
Rabl Cache Benchmarks
=====================
num_trials:          10
num_depth:           5 (618 employees)
rebuild_from_cache:  false
version:             0.8.1


Benchmarking 'employees/with_child_extends_1'...
run #1: 0.9586s
run #2: 0.5957s
run #3: 0.5921s
run #4: 0.5929s
run #5: 0.6001s
run #6: 0.6177s
run #7: 0.6056s
run #8: 0.5918s
run #9: 0.5793s
run #10: 0.6538s
AVG:   0.6388s
  child extends - caching off

Benchmarking 'employees/with_child_extends_2'...
run #1: 0.8936s
run #2: 0.0168s
run #3: 0.0425s
run #4: 0.0156s
run #5: 0.0135s
run #6: 0.0169s
run #7: 0.0477s
run #8: 0.0062s
run #9: 0.006s
run #10: 0.0059s
AVG:   0.1065s
  child extends - caching on

Benchmarking 'employees/with_child_extends_3'...
run #1: 0.8397s
run #2: 0.7579s
run #3: 0.7646s
run #4: 0.7726s
run #5: 0.7822s
run #6: 0.7835s
run #7: 0.7784s
run #8: 0.8043s
run #9: 0.7845s
run #10: 0.7864s
AVG:   0.7854s
  child extends - caching on but 100% misses

Benchmarking 'employees/with_node_partial_1'...
run #1: 0.3455s
run #2: 0.2288s
run #3: 0.2736s
run #4: 0.2902s
run #5: 0.2864s
run #6: 0.2916s
run #7: 0.2667s
run #8: 0.2951s
run #9: 0.282s
run #10: 0.285s
AVG:   0.2845s
  node partial - caching off

Benchmarking 'employees/with_node_partial_2'...
run #1: 0.5393s
run #2: 0.0143s
run #3: 0.0139s
run #4: 0.0148s
run #5: 0.0139s
run #6: 0.0154s
run #7: 0.014s
run #8: 0.0155s
run #9: 0.0141s
run #10: 0.042s
AVG:   0.0697s
  node partial - caching on

Finished in 45.26 seconds
6 examples, 0 failures
```
