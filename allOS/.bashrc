HISTFILESIZE=500000
export PATH=$PATH:$HOME/bin

# Execute BASH source files
for file in $HOME/source_bash/*
do
  . "$file"
done

# Execute generic source files
for file in $HOME/source/*
do
  . "$file"
done

