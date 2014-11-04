# User admin

    useradd [options] {username}
    useradd bob
    
    passwd {username} 
    passwd bob
    
    ssh-keygen -t dsa
    
    tar cvzf the_archive.tgz the_dir
    tar cvzf the_archive.tgz <source> [--exclude <dir>]

## Find linux version

No specific command across linux versions, but general they'll be some files under `/etc` 
that will give you an idea.
    
    cat /etc/*-release
    
    