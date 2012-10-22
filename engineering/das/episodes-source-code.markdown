# Source code tips

## 4 Source code history integrity

- Mecurial vs Git
  - Mecurial don't like to change history
  - Git go nuts on history e.g. to make it look good
- Why care about keeping code history integrity
  - Changing history means external feedbacks likes tests or preformance tests might become broken 
- Although git is geared towards changing history, it is possible to wind back large changes
  - Reflog is your friend
  - e.g `git reflog show master`
  - Then use `git rebase` to back back to a previous state
  - e.g. `git rebase --hard master@{1}`
- Other things to note
  - Git won't update remote refs without a warning (e.g. asking you to force push)
  - Changing history is good idea since devs make mistakes when committing things and changing history can make it more informative
  
  
    
