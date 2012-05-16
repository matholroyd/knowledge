# 39 Stubs vs Stash

- Problem
  - Outside-in with TDD - to stub or not to stub?
- Solutions
  - Can use stubbing heavily, stubbing out anything that is not being directly tested  
- Insight
  - Heavy stubbing approach can lead to better design as you're motivation for writing lower-down, less abstract class is always clear.
  - Conversely, with a non-stubbing approach, you often find you need to run off and build lower level classes before can fully build/spec the more abstract concepts. Hence downside of this is you may have trouble understanding why you need which methods on the lower level objects, as there is no higher level construct that depends on them.
- Final thoughts
  - Suggested controller specs are a reasonable place to do less stubbing, as pain in butt to maintain all the stubs.

# 24 Notes on stubbing

- Idea #1
  - rspec's `<object>.as_null_object` is useful to stub out items that incidental to what you are testing (vs essential)
- Insight
  - If end up using lots of `<object>#as_null_object` calls in series of specs, might be an indication that breaking up the class into two classes will lead to more cohesive design. E.g. if 5 specs don't care what `user` is, where one spec does, might be worth separating out the parts that don't care what `user` is.
- Idea #2
  - If unsure about whether a bunch of implementation should go into an existing object or not, putting in a module that spec separately can be useful way.
- Insight
  - Can easily spec a module in Ruby by creating a stub then `#extend` it with the module