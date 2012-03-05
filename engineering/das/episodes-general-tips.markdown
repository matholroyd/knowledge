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


