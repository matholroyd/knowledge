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
  