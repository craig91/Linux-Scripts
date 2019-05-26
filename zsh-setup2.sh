# This part of the script gets the powerline plugin setup in conjunction with your zsh


sudo apt install powerline fonts-powerline
sudo apt install zsh-theme-powerlevel9k
echo "source /usr/share/powerlevel9k/powerlevel9k.zsh-theme" >> ~/.zshrc
sudo apt-get install zsh-syntax-highlighting
echo "source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ~/.zshrc
echo "restart your terminal"
