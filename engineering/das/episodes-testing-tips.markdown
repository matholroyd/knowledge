# 7 Growing a test suite

- Be aware of the way you grow a test suite
  - Appending to or amending existing tests can lead you to different design choices
- Suggested amending existing tests leads to better tests + better design
  - Forces you to reevaluate existing tests
  - Easier to see insights about what the subject 'wants' to be
- Insight
 - Existing tests can become irrelevant as you amend/add features to the thing being tested
 - Appending can lead to lots of brittle and coupled tests 
- Additional comments
  - Much happier with working with value objects versus entities
    - Value objects don't need to be 'managed', e.g. destroyed
    - Value objects have less state then entities, hence less concern if make an object dependent on a value object


# 35 Which tests to write

- Cucumber tests 
  - Represent broad stroke features
    - The system does X
  - Not necessarily fully tested- reserve that for further down
    - In fact directly suggested don't bother testing e.g both sides of true/false case 
  - Act a smoke screen to catch silly integration specs
- Controller tests
  - Should not be testing dependencies, e.g. models/views/service layer
- View tests
  - Don't bother normally, but do so for control logic
- Models/service layer tests
  - Fine grained testing of cases
  - Still does stubbing for external dependencies
  
