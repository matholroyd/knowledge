# 16 Refactoring story

- Problem
  - Big long complex controller.
  - Manual exception handling in controller.
  - Tacking on errors to model that was present (hence no longer idempotent).
- Solution
  - Rather then shoehorn in error handling to a class that was incidentally there, created a model with ActiveModel that was explicitly represented the concept being manipulated.
  - Able to replace all exception handling + tacked on error messages with standard rails @object.valid? controller pattern.
- Insight
  - Tend to run into trouble whenever controller does not have an object that explicitly represents the concept being manipulated. 
  - Shy away from using incidental objects.
   