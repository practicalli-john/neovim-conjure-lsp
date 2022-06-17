(module config.init
  {autoload {core aniseed.core
             nvim aniseed.nvim
             util config.util
             str aniseed.string}})

;; generic mapping leaders configuration

(nvim.set_keymap :n :<space> :<nop> {:noremap true})
(set nvim.g.mapleader " ")
(set nvim.g.maplocalleader ",")

;; Spacemacs style leader mappings.

;; Managing Tabs
(nvim.set_keymap :n :<leader>tn ":tabnext<cr>" {:noremap true})
(nvim.set_keymap :n :<leader>tp ":tabprevious<cr>" {:noremap true})
(nvim.set_keymap :n :<leader>to ":tabonly<cr>" {:noremap true})

;; Managing windows
(nvim.set_keymap :n :<leader>wm ":tab sp<cr>" {:noremap true})

;; managing buffers
(nvim.set_keymap :n :<leader>bn ":bnext<cr>" {:noremap true})
(nvim.set_keymap :n :<leader>bp ":bprevious<cr>" {:noremap true})

;; managing files
(nvim.set_keymap :n :<leader>fs ":write<cr>" {:noremap true})
(nvim.set_keymap :n :<leader>fa ":saveas<cr>" {:noremap true})

;; Insert mode: fd as Escape short cut
(nvim.set_keymap :i :fd "<ESC>" {:noremap true})

;don't wrap lines
(nvim.ex.set :nowrap)

;sets a nvim global options
(let [options
      {;settings needed for compe autocompletion
       :completeopt "menuone,noselect"
       ;case insensitive search
       :ignorecase true
       ;smart search case
       :smartcase true
       ;shared clipboard with linux
       :clipboard "unnamedplus"}]
  (each [option value (pairs options)]
    (core.assoc nvim.o option value)))

;import plugin.fnl
(require :config.plugin)
