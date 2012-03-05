# 51-53- Building sucks/rocks:

- Started with cucumber spec that was simple
  - Suggests bad idea to start with whole Rails stack
  - Instead have a simple object behind the scenes we test, e.g. RockScore
  - Come back to rails full stack test when built
- Jumped into RockScore spec
  - Started with general term, as don't know what it really does to begin with.
  - Insight- we can imbed our tests with more knowledge later on. Don't have to be perfect from the get go.
- Wrote 4 specific specs, knowing what the behaviour should be.
  - Admitted can be bad to write bunch of specs to begin with, yet argued knew behaviour of that class already, since had already built and had it working.
- Fleshed out first spec, using stubs for the bits didn't need.
  - Possibly stubbed too early, as wrote behaviour before generalized case needed it
  - Return hard coded answer to get spec passing
- Next couple of specs, copying format of first spec
  - Expected floating result implicitly in spec, not explicitly
  - Suggest implicit is better as float number is not a specific desire (e.g. its implicit desired behaviour)
- For the result where cannot divide by zero, didn't throw an error or return nil
  - Used special value, which was simply Class.new, so got nice error message
  - Avoided nil as want explicit error
  - Avoid exception, probably as not really exceptional (e.g. expected case)
- Moved onto getting cucumber spec passing
   - Didn't want to stub, as do want to spec the search api
   - Want to use a specific search term, but count is very fragile
   - Hence decided to come up with a relative constant that hoped would stay constant
- Added the search api gem
  - Played with it in console, to get a feeling for it
  - Made sure credentials were not displayed when recording screencast
- Setup VCR to avoid hitting network for running specs 
  - Wrapped spec in VCR.use_cassette
  - Created vcr helper for the rails spec, not in the spec_helper to avoid loading rails
  - Setup VCR config, making sure to hide credentials 
- Once VCR setup + spec passing for SearchEngine, moved up to cucumber spec 
  - Needed to add VCR to spec
  - Created cucumber-specific vcr helper, requiring the existing vcr helper + adding cucumber tagging
- Ran cucumber specs
  - Ran all good, vcr recording.
  - Noticed Then is pending.
  - Fleshed out Then part, without generalizing it
    - Felt no need to generalize as unlikely to use the Then more than once
- Unhappy as had never actually seen it fail
  - Played with Then to see failing spec. Spec failed, but 'bug' as numbers were too close.
  - Unhappy with numbers being close, so wrote note to self in form of pending Scenario
    
# 54- Sucks/Rocks caching:

- Step back and think about what problem trying to solve with caching + dependencies
  - Realize that RockScore is already nice working thing as is
  - Could put cache inside RockScore or wrap RockScore with cache
  - Decide to wrap it, so don't have to touch RockScore
  - This means Cucumber test would have to change, but RockScore does not
- Reflect on what score caching does
  - Same as standard cache so 3 specs to reflect 3 things
  - Want explicitly with scores (put in spec names)
- Building spec
  - Don't mind loading rock_score since doesn't depend on Rails
  - Realize need a store, assume active record store
  - Stub out active record store 
- CachedScore dummy class
  - Dummy class to avoid loading active::record
  - Easy to stub out
- When writing hard-coded stuff, replace high-entropy parts with low-entropy where obvious  


