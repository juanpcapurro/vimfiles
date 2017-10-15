# Capurro's vimfiles

I have spent a fair amount of time customizing my editor, and I think these are pretty sane defaults for other people to use

## What's my workflow like
So far, i don't use n

## Installation:
There are a few prerrequisites:
* Neovim
* Python
* Ruby

Regarding python and ruby, neovim's `:CheckHealth` is your friend. YCM won't work without python support and CommandT needs ruby.
Installation of these varies between distros, and you'll have to add a few directories to your `$PATH`, but `:CheckHealth` can guide you through it better than I do.
First of all, clone this repo, or add it as a submodule of your [main dotfiles repo](https://developer.atlassian.com/blog/2016/02/best-way-to-store-dotfiles-git-bare-repo/) if you're into that sort of thing.
```
git clone https://github.com/juanpcapurro/vimfiles.git ~/.config/nvim
cd ~/.config/nvim
git submoudle update --init --recursive
```
Then, two plugins, YCM and CommandT, have a compiled component. 
#### Command-T
```
cd ~/.config/nvim/bundle/command-t/ruby/command-t/ext/command-t
ruby extconf.rb
make
```
#### YCM
Install with support for C-family languages only:
```
cd ~/.config/nvim/bundle/YouCompleteMe
./install.py --clang-completer
```
YCM supports other languages as well, and as an example, I use `--js-completer` to add javascript semantic support.
This is of course very well documented in the official repo.
A word of caution for Arch users: I had to add the `--system-libclang` parameter to make it work.
Also, a pip module called `certifi` was needed. I have no idea what it does.

## Featured plugins

#### [YCM](https://github.com/Valloric/YouCompleteMe)
Fancier autocomplete than vim's default, usage is simple: when typing a word, possible matches are shown in a list.
If you press tab, you select the first element of that list, and YCM completes it for you.
Otherwise, it leaves you alone.
Oh, and with the provided `ycm_extra_conf.py`, it provides IDE-like syntax checking for C-family languages.
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
#### [vim-easygrep](https://github.com/dkprice/vim-easygrep)
Find and replace with regular expressions, 
#### [vim-surround](https://github.com/tpope/vim-surround)
* Surround selected text with parenthesis with `S)`
* Want to give _emphasis_ to a word after typing it? In normal mode: `ysiw_`
* And much, much more!
#### [vim-gutentags](https://github.com/ludovicchabant/vim-gutentags)
Generates tags automatically for the current proyect, so you can, for example, use `ctrl-]` to go to the definition of a function.
#### [vim-polyglot](https://github.com/sheerun/vim-polyglot)
Syntax highlight for several languages

## TODO
* Spell checking for markdown files
* Filetype-specific mappings, specially for LaTeX.
* Improve autocomplete, so it suggests struct members when applicable, and lists the parameters that a function recieves when typing them.


