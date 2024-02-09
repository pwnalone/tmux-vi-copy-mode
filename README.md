# Tmux Vi Copy Mode

This is a plugin that modifies the default key bindings for Tmux's `copy-mode-vi` key table to more
closely mimic the behavior of vi visual selection.

It makes the following modifications to the default key table.

| Key Binding | Default Behavior        | Improved Behavior                             |
| :---------: | :---------------------: | :-------------------------------------------: |
| `Escape`    | Clear selection         | Clear selection and turn off rectangle mode   |
| `C-v`       | Toggle rectangle mode   | Exactly mimic vi's `C-v` key binding          |
| `v`         | Begin selection         | Exactly mimic vi's `v` key binding            |
| `y`         | _N/A_                   | Copy selection (stay in copy mode)            |
| `i`         | _N/A_                   | Exit copy mode                                |

> **NOTE**
>
> In the future, I hope to update this plugin to mimic vi visual line selection (`V`), but this is
> currently not possible in Tmux until [this feature](https://github.com/tmux/tmux/issues/2840) is
> implemented.

## Install

### Installation with [Tmux Plugin Manager](https://github.com/tmux-plugins/tpm).

Add the following line to your `.tmux.conf`.

```tmux
set -g @plugin 'pwnalone/tmux-vi-copy-mode'
```

### Manual Installation

Clone the repo.

```sh
git clone https://github.com/pwnalone/tmux-vi-copy-mode ~/.tmux/plugins/tmux-vi-copy-mode
```

Add the following line to your `.tmux.conf`.

```tmux
run ~/.tmux/plugins/tmux-vi-copy-mode/vi_copy_mode.tmux
```

## Usage / Configure

That's it! You can now select text in Tmux copy mode the same as you would in vi/Vim/Neovim
(almost).
