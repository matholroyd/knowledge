# General principles from Destroy All Software

## Mocking/stubbing in specs

- Works really well with integration testing prompting little additions to lower down unit tests
- Makes dependencies explicit
- Explicit dependencies guide you towards less coupling and clear delineation of class responsibilities

## Nils as a source of woe

1. Procedural languages tempt developers with using state to dictate actions
1. Using state opens the door for passing implicit assumptions all over the shop
1. These implicit assumptions manifest themselves in cases like "WTF is this nil doing here?"
1. Can fix by:
  1. Design By Contract helps make implicit assumptions explicit
  1. Refactoring to a more functional style avoids these implicit assumptions in the first place

