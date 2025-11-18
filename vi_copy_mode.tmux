#!/usr/bin/env bash

set -e

#
# It is not yet possible to properly mimic vi visual line selection due to a lack of a
# `#{line_toggle}` variable and `line-toggle` command.
#
# See: https://github.com/tmux/tmux/issues/2840
#

# Perform proper vi visual (block) selection in Tmux copy mode.
if_rectangle="if -F '#{rectangle_toggle}'                   'send -X clear-selection'  'send -X rectangle-on'"
if_selection="if -F '#{selection_active}' \"$if_rectangle\" 'send -X rectangle-on  ; send -X begin-selection'"
vi_block_sel=$(echo "$if_selection" | tr -s ' ')

# Perform proper vi visual (plain) selection in Tmux copy mode.
if_rectangle="if -F '#{rectangle_toggle}'                   'send -X rectangle-off' 'send -X clear-selection'"
if_selection="if -F '#{selection_active}' \"$if_rectangle\" 'send -X rectangle-off ; send -X begin-selection'"
vi_plain_sel=$(echo "$if_selection" | tr -s ' ')

# Create Tmux key bindings.
tmux bind -T copy-mode-vi C-v "$vi_block_sel"
tmux bind -T copy-mode-vi v   "$vi_plain_sel"
tmux bind -T copy-mode-vi y   'send -X copy-selection'
tmux bind -T copy-mode-vi i   'send -X cancel'
