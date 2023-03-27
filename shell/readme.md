0. Clone hunterbaxter/shell

```sh
 git clone --recurse-submodules -j8 https://gitlab.com/hunterbaxter/shell.git
```

1. Set Zsh to default

```sh
chsh -s $(which zsh)
```

2. In "/etc/zshenv" or "/etc/zsh/zshenv", need to add

```zsh
export HOME="/home/h"
export ZDOTDIR="$HOME/workstation/shell"
```

3. Make the following symbolic links

```zsh
ln -s $ZDOTDIR/zshenv.zsh $ZDOTDIR/.zshenv
ln -s $ZDOTDIR/zshrc.zsh $ZDOTDIR/.zshrc
```
