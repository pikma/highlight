# Space Macro

## Installation

Use [Vundle](https://github.com/VundleVim/Vundle.vim). Simply add the plugin to
your vimrc file, then run BundleUpdate.

```vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'  " Required

Plugin 'pikma/space-macro'

call vundle#end()
```

## Usage

Press space to highlight the word under the cursor. Or your selection, if you
have selected text.

Press <leader><space> to turn the highlighting off (until you press space
again).

You can customize the mapping by setting

```vim
let g:space_macro_on = '<space>'
let g:space_macro_off = '<leader><space>'
```
in your vimrc file.

See [the documentation](doc/space_macro.txt) by typing `:h space-macro` in vim.
