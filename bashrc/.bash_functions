# Utility functions for bash
# To use this file, make sure this block is present on .bashrc:
#   if [ -f ~/.bash_functions ]; then
#       . ~/.bash_functions
#   fi

# Make directory and change working directory to it
function mcd {
    if [ $# -ne 1 ]; then
      echo "Usage: mcd <directory-name>"
      return
    fi

    mkdir $1
    cd $1
}

# Change working directory and immediatly lists it
function cdls {
    if [ $# -ne 1 ]; then
      echo "Usage: cdls <directory>"
      return
    fi

    cd $1
    ls -lha $1
}

# Always use correct program to extract files
function extract {
 if [ -z "$1" ]; then
    # display usage if no parameters given
    echo "Usage: extract <path/to/file_name>.<zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|xz|ex|tar.bz2|tar.gz|tar.xz>"
 else
    if [ -f $1 ] ; then
        # NAME=${1%.*}
        # mkdir $NAME && cd $NAME
        case $1 in
          *.tar.bz2)   tar xvjf ./$1    ;;
          *.tar.gz)    tar xvzf ./$1    ;;
          *.tar.xz)    tar xvJf ./$1    ;;
          *.lzma)      unlzma ./$1      ;;
          *.bz2)       bunzip2 ./$1     ;;
          *.rar)       unrar x -ad ./$1 ;;
          *.gz)        gunzip ./$1      ;;
          *.tar)       tar xvf ./$1     ;;
          *.tbz2)      tar xvjf ./$1    ;;
          *.tgz)       tar xvzf ./$1    ;;
          *.zip)       unzip ./$1       ;;
          *.Z)         uncompress ./$1  ;;
          *.7z)        7z x ./$1        ;;
          *.xz)        unxz ./$1        ;;
          *.exe)       cabextract ./$1  ;;
          *)           echo "extract: '$1' - unknown archive method" ;;
        esac
    else
        echo "$1 - file does not exist"
    fi
fi
}