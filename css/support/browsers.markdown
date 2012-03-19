# CSS 2.1

## Missing/problematic IE support

- `cursor` only supports `.cur` files 
- Animation, Transitions
- `text-shadow`

## Missing/problematic IE 9 support

- `columns`
- `grids`

## Missing/problematic IE 8 support

- Pseudo class is selectors
  - `E:root`, `E:first-child`
  - `E:active` bit flaky
- Box model
  - `border-radius`
  - `box-shadow`
- Coloring
  - `opacity`, but can use `filter`. Note ordering should be
- Background
  - Whole bunch of stuff can't do
  - `background-clip`
  - `background-origin`
  - `background-size`
  
For IE filter, should add in the following order

    .opaque {
    	-ms-filter:"progid:DXImageTransform.Microsoft.Alpha(Opacity=50)"; // first!
    	filter: alpha(opacity=50);					// second!
    }
  
  
## Missing/problematic IE 7 support

- Pseudo class is selectors
  - `E:active`
  - `E:focus`
  - `E:before`
  - `E:after`
- Box model
  - Margin is flaky
  - `display` missing `inline-block`, `table`
  - `box-sizing`
  - `position` bug - if use `absolute` then `relative`, most content does not show
- Tables
  - `border-collapse` problems
  - `border-spacing` missing
- Forms
  - `:enabled`, `:disabled`, `:checked`




