<!--
File              : README.md
Author            : Anton Riedel <anton.riedel@tum.de>
Date              : 25.03.2020
Last Modified Date: 20.07.2022
Last Modified By  : Anton Riedel <anton.riedel@tum.de>
-->

# Dotfiles

My personal Dotfiles which I use across different machines. I run Arch Linux as my main operating system with a custom build of dwm as window manager.
You can find configuration files for

- alacritty (terminal emulator)
- zsh (shell)
- bash (shell)
- neovim (editor)
- tmux (terminal multiplexer)
- sxhkd (hotkey daemon)
- qutebrowser (minimal vim-like web browser)
- zathura (minimal vim-like pdf viewer)
- ...

These Dotfiles are meant to be deployed with [Ansible](https://www.ansible.com/). Once have it installed you can simply run

```
ansible-playbook bootstrap.yml
```

Under `old` you can find configuration files for programs I used to use such as:

- awesome (->dwm)
- qtile (->dwm)
- bspwm (-> dwm)
- i3 (->dwm)
- i3bar (->custom script)
- termite (->alacritty)
- urxvt (->alacritty)
- xterm (->alacritty)
- ranger
- vifm
- nnn
- lf
- compton
- ...
