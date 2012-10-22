# Command line bash scripting tips

## 19 Composing unix command line

- Core operators
  - `|` `<` `>` `()` `while` `for` `if`  

Examples:

    find app lib -name '*.rb'
    xargs grep -h '^[[:space:]]*class\|module\b'
    sed 's/^[[:space:]]*//'
    cut -d ' ' -f 2
    while read class; do echo `grep -rl "\b$class\b" app lib --include="*.rb" | wc -l` $class; done
    sort -n 
    
    
 