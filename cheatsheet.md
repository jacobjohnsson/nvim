# NeoVim Configuration Cheat Sheet

## Basic Movements

| Key Bind           | Plugin | Description                                   |
| ------------------ | ------ | --------------------------------------------- |
| `s<char><char>`    | Leap   | Initiate a search forwards.                   |
| `S<char><char>`    | Leap   | Same, but search backwards                    |
| `gs<c><c><action>` | Leap   | Remote operation (Spooky actions at a         |
|                    |        | distance) Example: `gs{leap}yw` copies the    |
|                    |        | word at the location and then return the      |
|                    |        | marker to its former position.                |

## Text Objects

| Text Object  | Plugin      | Description       |
| ------------ | ----------- | ----------------- |
| `af`         | Treesitter  | @function.outer   |
| `if`         | Treesitter  | @function.inner   |
| `ac`         | Treesitter  | @class.outer      |
| `ic`         | Treesitter  | @class.inner      |

## Swap

| Swap         | Plugin      | Description                |
| ------------ | ----------- | -------------------------- |
| `<Leader>wp` | Treesitter  | @parameter.inner forwards  |
| `<Leader>wP` | Treesitter  | @parameter.inner backwards |

## Fuzzy Find

| Key Bind     | Plugin      | Description                               |
| ------------ | ----------- | ----------------------------------------- |
| `<C-f>`      | fzf         | __:Files__ Fuzzy find files               |
| `<C-g>`      | fzf         | __:Lines__ Fuzzy find in all buffers      |
| `<C-h>`      | fzf         | __:Changes__ Fuzzy find changes to file   |
| `<C-c>`      | fzf         | __:Commits__ Fuzzy find in commit history |

## Git (gud)

Prepend all with `:G`.

| Command      | Plugin      | Description                                    |
| ------------ | ----------- | ---------------------------------------------- |
| `Blame`      | fugitive    | Open a temporary buffer with git history.      |
|              |             | Press <Enter> on a line to view the commit. In |
|              |             | this view, '-' reblames and 'p' previews the   |
|              |             | commit.                                        |
| `]c`         | gitgutter   | Jump to next hunk                              |
| `[c`         | gitgutter   | Jump to previous hunk                          |
| `<Leader>hs` | gitgutter   | Stage hunk. Use visual mode to stage part of a |
|              |             | hunk                                           |
| `<Leader>hp` | gitgutter   | Preview hunk                                   |
| `<Leader>hu` | gitgutter   | Undo hunk                                      |

All other `:G` commands works pretty much as expected.

## Telescope

| Command      | Plugin      | Description                                    |
| ------------ | ----------- | ---------------------------------------------- |
| `<Leader>ff` | telescope   | Find files                                     |
| `<Leader>fg` | telescope   | Live grep                                      |
| `<Leader>fh` | telescope   | Find in help tags                              |
| `<Leader>ft` | telescope   | Find in treesitter                             |
| `<Leader>fp` | telescope   | Find planets                                   |
| `<Leader>fm` | telescope   | Find in man pagez                              |
| `<Leader>gb` | telescope   | checkout branch                                |
| `<Leader>gc` | telescope   | checkout commit                                |
| `<Leader>gh` | telescope   | git status                                     |
| `<C q>`      | telescope   | Populate quickfix list                         |

## Refactoring

| Command      | Plugin      | Description                                    |
| ------------ | ----------- | ---------------------------------------------- |
| `:Refactor`  | refactoring | Can be used to extract/inline functions,       |
|              |             | blocks and variables                           |

## LSP

In order to have the clangd language server recognize dependencies put a
'.clangd' in the project root that specifies what to include.

For example:

> CompileFlags:
>   Add: ["-I/usr/include/glib-2.0",
>         "-I/usr/lib/x86_64-linux-gnu/glib-2.0/include"]

| Command   | Mode     | Description                                    |
| --------- | -------- | ---------------------------------------------- |
| `gra`     | normal   | Code action                                    |
| `gri`     | normal   | Implementation                                 |
| `grn`     | normal   | Rename                                         |
| `grr`     | nroaml   | References                                     |
| `grt`     | nroaml   | Type definition                                |
| `grO`     | normal   | Document symbol                                |
| `<ctrl>s` | insert   | Signature help                                 |
| `an`      | visual   | outer incremental selection                    |
| `in`      | visual   | inner incremental selection                    |

## Haunt
Hear the ghosts tell you where you were and why you were there. Annotate your
codebase with ghost text. Seart through the history that you choose.


| Command      | Plugin      | Description                        |
| ------------ | ----------- | ---------------------------------- |
| `<Leader>ha` | haunt       | Create annotation                  |
| `<Leader>ht` | haunt       | Toggle annotation                  |
| `<Leader>hT` | haunt       | Toggle all annotations             |
| `<Leader>hd` | haunt       | Delete annotation                  |
| `<Leader>hD` | haunt       | Delete all annotations             |
| `<Leader>hp` | haunt       | Go to Previous annotation          |
| `<Leader>hn` | haunt       | Go to Next annotation              |

## Native Vim
To diff two files in separate files (such as machine features.):
Load both files in different buffers and run :windo diffthis.
