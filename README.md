<!--
File              : README.md
Author            : Anton Riedel <anton.riedel@tum.de>
Date              : 25.03.2020
Last Modified Date: 17.09.2020
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
- htop (system monitor)
- qutebrowser (minimal vim-like web browser)
- zathura (minimal vim-like pdf viewer)

as well as some custom scripts under `scripts`.

These Dotfiles are meant to be deployed with [GNU Stow](https://www.gnu.org/software/stow/).
There is a corresponding script for deployment under `install`.

Under `old` you can find configuration files for programs I used to use such as:

- awesome (->dwm)
- qtile (->dwm)
- bspwm (-> dwm)
- i3 (->dwm)
- i3bar (->custom script)
- termite (->alacritty)
- urxvt (->alacritty)
- xterm (->alacritty)
- lxterminal (->alacritty)
- ranger
- vifm
- nnn
- lf
- compton
- dunst
