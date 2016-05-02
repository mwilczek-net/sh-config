HISTFILESIZE=50000
export PATH=$PATH:$HOME/bin


# Execute source files
for file in $HOME/source/*
do
  . "$file"
done

