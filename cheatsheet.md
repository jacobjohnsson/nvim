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
| `lh`         | Treesitter  | @assignment.inner |
| `rh`         | Treesitter  | @assignment.rhs   |

## Swap

| Swap         | Plugin      | Description                |
| ------------ | ----------- | -------------------------- |
| `<Leader>wp` | Treesitter  | @parameter.inner forwards  |
| `<Leader>wf` | Treesitter  | @function.outer  forwards  |
| `<Leader>wP` | Treesitter  | @parameter.inner backwards |
| `<Leader>wF` | Treesitter  | @function.outer  backwards |

## Move

| Move         | Plugin      | Description               |
| ------------ | ----------- | ------------------------- |
| `<Leader>mf` | Treesitter  | @function.outer forwards  |
| `<Leader>mF` | Treesitter  | @function.outer backwards |

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
