export PATH=$PATH:$HOME/bin

# Execute ZSH source files
for file in $HOME/source_zsh/*
do
  . "$file"
done

# Execute generic source files
for file in $HOME/source/*
do
  . "$file"
done
