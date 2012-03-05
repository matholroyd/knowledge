# 5- extracting domain objects:

- Problems
  - Shoe-horning implicit domain concepts leads to complex controllers + tests
  - Models + Controllers bloat with implicit domain logic, making it hard to test + maintain + refactor later on
- Solutions
  - Identify the implicit abstractions early on
  - Pull abstractions out into non-Rails classes if possible, e.g. into a library class
  - Name concepts, even as simple structs, as it will help understanding + reading of errors later on
  - Write own specs for the library + revisit the specs for the original classes.
  - Removed unnecessary specs
- Insight
  - Tests can be greatly simplified as less logic to test
  - Removing tests + controller/model logic and starting from scratch is good way to get past 'legacy bias'

