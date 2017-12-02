# Capurro's vimfiles

I have spent a fair amount of time customizing my editor, and I think these are pretty sane defaults for other people to use

## Installation:
There are a few prerrequisites:
* Neovim
* Python (including `neovim` package)
* Ruby (including `neovim` gem, and the gem's bin directory must be in `$PATH`)
* Git

Regarding python and ruby, neovim's `:CheckHealth` is your friend. YCM won't work without python support and CommandT needs ruby.
Installation of these varies between distros, and you'll have to add a few directories to your `$PATH`, but `:CheckHealth` can guide you through it better than I do.
First of all, clone this repo, or add it as a submodule of your [main dotfiles repo](https://developer.atlassian.com/blog/2016/02/best-way-to-store-dotfiles-git-bare-repo/) if you're into that sort of thing.
```
git clone https://github.com/juanpcapurro/vimfiles.git ~/.config/nvim
```
Then, open `nvim` (the first time it'll curl for Plug)and run `:PlugInstall`.
Most of the plugins are hassle-free, but YCM and Command-T have a compiled component.
Compilation of those might fail if you lack a dependency

## Mappings and commands worth mentioning
* `J` and `K` change tabs
* `;t` opens CommandT and lets you search for files in the current proyect.
* `;m` opens CommandT, but searchs accross recently opened files.
Other mappings are `;l` (searchs for matches in lines of the current buffer, barely used since I find `/` more comfortable) and `;j`, which lets you search accross the files present in vim's _jumplist_. I'll soon explain what the jumplist is and how to use it.
## Settings worth mentioning
* Navigation is visual, and soft wrapping is enabled.
## Featured plugins

#### [CommandT](https://github.com/wincent/command-t)
Really nice tool for fuzzy file searching. Use `leader-t` to open it in normal mode, to search for files in the current directory or git repo, `leader-m` to open it in MRU mode, to search for recently used files, and `leader-l` to search for lines in the current buffer.
#### [auto-pairs](https://github.com/jiangmiao/auto-pairs)
Adds and removes matching parenthesis, brackets and such as you'd expect from any modern editor.
#### [tabular](https://github.com/godlygeek/tabular)
I use it mainly to align C assignments, or markdown and LaTex tables. For example, `:Tabularize /=` aligns all the `=` characters, making several contiguous assignments easier to read.
#### [gruvbox](https://github.com/morhetz/gruvbox)
Colorscheme with dark and light variants.
#### [vim-airline](https://github.com/vim-airline/vim-airline)
Makes the bottom line nicer to the eye, and it displays some useful info, such as word count, the character used for indentation, etc.
#### [vim-surround](https://github.com/tpope/vim-surround)
* Surround selected text with parenthesis with `S)`
* Want to give _emphasis_ to a word after typing it? In normal mode: `ysiw_`
* And much, much more!
#### [vim-gutentags](https://github.com/ludovicchabant/vim-gutentags)
Generates tags automatically for the current proyect, so you can, for example, use `ctrl-]` to go to the definition of a function.
#### [vim-polyglot](https://github.com/sheerun/vim-polyglot)
Syntax highlight for several languages
#### [vim-instant-markdown](https://github.com/suan/vim-instant-markdownvim-instant-markdown)
Opens a new chrome tab which displays the current markdown file, updating it in real time. It requires `instant-markdown-d` npm package installed globally.
Use `:InstantMarkdownPreview` to launch it.
#### [vim-auto-save](https://github.com/vim-scripts/vim-auto-save)
Automatically saves files

## TODO
* Spell checking for markdown files
* Filetype-specific mappings, specially for LaTeX.
* Improve autocomplete, so it suggests struct members when applicable, and lists the parameters that a function recieves when typing them.

