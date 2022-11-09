ln -s /Volumes/Borg/backup_Zorg/.dots/.zshrc  ~/.zshrc 
ln -s /Volumes/Borg/backup_Zorg/.dots/.zsh_aliases ~/.zsh_aliases
ln -s /Volumes/Borg/backup_Zorg/.dots/.zsh_functions ~/.zsh_functions
ln -s /Volumes/Borg/backup_Zorg/.dots/.zsh_plugins ~/.zsh_plugins

# what about ... ???
rsync -avzP /Volumes/Borg/backup_Zorg/.dots ~/
