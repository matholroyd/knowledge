# 2 - avoid nils:

- Problems
  - Source of nil can be missing from stack trace, e.g. through assignment

- Solutions
  - Use libraries better (favour exploding calls versus nil returns)
  - Manually change returner to throw exception
  - Switch around object relationship so previously-nillable object instead has a reference back  
  - Extend/refactor domain objects/relationships

- Insight
  - nils could be masking a domain inconsistency

# 6- Conflicting principles:

- Problems
  - "Best practices" can often conflict
  - E.g. "tell don't ask" can conflict with trying to separate responsibilities when design User model in Rails.
- Solution
  - Favour laws that are more important
  - Cohesive + simple classes/responsibilities more important than "Tell don't ask" 
- Insight
  - Using classes instead of modules to handle separate responsibilities simple way to avoid coupling

# 15- Performance testing in Ruby

File `example_benchmark.rb`:

    require 'spec_helper
    require 'benchmark'
    
    describe OrdersController, type: :controller do
      it "is fast" do
        # do setup stuff
        benchmark do
          get :show
        end
      end
    end
    
    def benchmark(&block)
      block.call # prime caches
      time = Benchmark.realtime { block.call }
      puts "RUNTIME: #{time}"
    end

File `perf_stats.sh`:

    #!/bin/bash
    set -e
    
    if [ -e stats.csv ]; then
      rm stats.csv
    fi
    
    run-command-on-git-revisions $1 $2 "sh perf_stats_on_this_rev.sh >> stats.csv"
    
File `perf_stats_on_this_rev.sh`:

    #!/bin/bash
    set -e
    
    rev=`git log -1  --pretty='format%h' HEAD`
    time=`rspec perf/example_benchmark.rb | 
      grep '^RUNTIME: ' |
      awk '{print $2}'`

    echo $rev,$time
    
# 21 - Coupling and abstraction

- Problem
  - There is a temptation/philosophy to wait for duplication to occur before doing refactoring. 
  - The problem is that the duplication can be difficult to notice, in that it may require scanning entire chunks of the source code to find it for each line of new code.
  - Example of this is duplicating `where` clauses in different Rails controllers.
- Solution
  - Suggested solution is to build the system in such way as to minimize coupling at every stage. 
  - This means making abstractions explicit whenever they come up, rather then a quick hack to capture that abstraction. 
  - In the case of Rails `where` clauses, placing the clause behind an explicitly named scope, even if its used in only one place, encourages reuse.
- Insight
  - Test-Driven-Design encourages the aforementioned good behaviour, as the coupling because dead obvious when writing the test.
  - Hence one trick is to capture that inevitable feeling of disgust and redesign the system via the stubbed tests even before writing the subject of the tests itself.
