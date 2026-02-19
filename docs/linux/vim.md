# Vim

## Replace text

```
:s/current_text/new_text/     # replace first occurence on current line
:s/current_text/new_text/s    # replace all occurences on current line
:%s/current_text/new_text/s   # replace all occurences on all lines
```

## Movement

- `a`: edit
- `0`: move to begining of line
- `$`: move to end of line
- `e`: move to end of word
- `w`: move to begining of word
- `b`: move back to begining of the word
- `o`: new line
- `q+keybind`: macro rec
- `5+@+keybind`: macro run 5x

## Modifiers

- `:set number`: line numbers

## Copy / Paste

- `v `: visual
- `V `: visual line
- `yy`: copy (yank)
- `dd`: cut
- `D `: cut right
- `p `: paste below
- `P `: paste above
- `10,20y`: copy lines 10-20

## Time Machine

- `u`: undo
- `Ctrl+R` redo

## Search (Ignore Case)

1. `:set ignorecase`

2. `/pattern`
