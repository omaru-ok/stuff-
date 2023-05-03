  -- https://github.com/phaazon/mind.nvim -- even tho its not wkrign anymoe
  -- some tools i think are great to use
  --https://github.com/ray-x/web-tools.nvim -- we devlopement , html , javascript , curl
  -- https://github.com/mong8se/actually.nvim -- on UNIX , get operation u may forgot
  -- note taking
  --https://github.com/epwalsh/obsidian.nvim
-- Install package manager
--    https://github.com/folke/lazy.nvim
--    `:help lazy.nvim.txt` for more info
vim.g.sqlite_clib_path = "C:\\Users\\O_0\\.local\\sqlite\\sqlite3.dll" -- set up sqlite path

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
vim.fn.system {
	'git',
	'clone',
	'--filter=blob:none',
	'https://github.com/folke/lazy.nvim.git',
	'--branch=stable', -- latest stable release
	lazypath, } end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({

 -- Theme
 { 'rebelot/kanagawa.nvim', -- inspired of gruv+dracula
 'shaunsingh/moonlight.nvim',
 { 'catppuccin/nvim', name = "catppuccin",},
 },

 { -- Default theme if no applied
 'kyazdani42/blue-moon',
 version = false,
 lazy = false,
 priority = 1000, -- make sure to load this before all the other start plugins
 config = function()
 	require("blue-moon").setup()
 end, },


  -- Apearance

  -- Start ify
  { 'mhinz/vim-startify',
      config = function ()
        require("Misc.Startify")
               end },

  -- Ui
  { -- Colored Sperator windows
  "nvim-zh/colorful-winsep.nvim",
    event = { "WinNew" },
      config = function()
  require("colorful-winsep").setup({
    interval = 20, -- timer refresh rate
    -- This plugin will not be activated for filetype in the following table.
    no_exec_files = { "Lazy", "TelescopePrompt", "mason", "CompetiTest", "NvimTree" },
    -- Symbols for separator lines, the order: horizontal, vertical, top left, top right, bottom left, bottom right.
    -- symbols = { "━", "┃", "┏", "┓", "┗", "┛" },
  }) end,},


  { -- Wild menu at cmd
  'gelguy/wilder.nvim',
     keys = {':', '/', '?' },
     config = function()
      require('Misc.Wild')
     end
      },

    { -- Mini map
      'echasnovski/mini.map',
      -- event = "BufReadPre",
      -- config = function()
      --   require('mini.map').setup()
      -- end
    },

  { -- Floating messages
  'AckslD/messages.nvim',
  cmd = { "Messages",},
  config = true },

  {-- Dynamic relative, Numbers
  'sitiom/nvim-numbertoggle',
  event = "BufReadPost", },

    { -- Floating buffer Names
      'ldelossa/buffertag',
      event = "WinNew",
      config = function () require('buffertag').setup({
      border = "rounded", limit_width = true, modified_symbol = "[●]",})
    end },

  { -- Cursor line
  'yamatsum/nvim-cursorline',
  event = "BufReadPre", config = function()
  	require('nvim-cursorline').setup {
  		cursorline = { enable = true, timeout = 500, number = false, },
  		cursorword = { enable = false, min_length = 3, hl = { underline = false }, }
  	} end },


  { -- Tmux 's panes
  'mrjones2014/smart-splits.nvim',  -- super powerfull resizer,swaper, panes
    event = "WinNew",
    dependencies =  { 'anuvyklack/windows.nvim',
    dependencies = {
      'anuvyklack/middleclass', -- OOP library for Lua
      'anuvyklack/animation.nvim', }, -- animation at window move
      config = function()
      require("Tmux")
    if vim.g.neovide then
    require("windows").setup({ animation = { enable = false, } })
    end
      end, }, },

  -- Utility 's

  {-- Cheats
   'RishabhRD/nvim-cheat.sh', -- cheat.sh for everythign
   dependencies = 'RishabhRD/popfix', -- used by cheat.sh
    cmd ={  "Cheat", "CheatWithoutComments", "CheatList", "CheatListWithoutComments",}, },

  { -- Url
   'xiyaowong/link-visitor.nvim', -- Open links
  cmd = { "VisitLinkUnderCursor" },
    config = function()
  require("link-visitor").setup()
    end },

  { -- Codebins 0x0
     'rktjmp/paperplanes.nvim',
  cmd = "PP" },

  {  -- Translate
    'potamides/pantran.nvim',
    cmd = "Pantran"},

  { -- Last Location
 'ethanholz/nvim-lastplace',  },


  { -- Marks, colorscheme ,buffer
   'toppair/reach.nvim',
  cmd = "ReachOpen", },
    { -- intract with Register "
      'gennaro-tedesco/nvim-peekup',
      -- event = "BufReadPre",
      keys = '""',
      config = function ()
        require('nvim-peekup.config').on_keystroke["delay"] = ''
        require('nvim-peekup.config').geometry["height"] = 0.5
        require('nvim-peekup.config').geometry["wrap"] = true
               end },

	-- { -- File
 --   "nvim-tree/nvim-tree.lua",
	-- cmd = { "NvimTreeOpen", "NvimTreeClose", "NvimTreeToggle",
	-- "NvimTreeFindFile", "NvimTreeFindFileToggle", },
	-- dependencies = { "nvim-tree/nvim-web-devicons", },
	-- config = function()
	-- 	require("File_manager")
	-- end },

-- { -- File
--   "nvim-neo-tree/neo-tree.nvim",
--     branch = "v2.x",
--     dependencies = {
--       "nvim-lua/plenary.nvim",
--       "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
--       "MunifTanjim/nui.nvim",
--     },
--     config = function()
--  vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])
-- end
--   },

{ -- Simple file manager
  'dinhhuy258/sfm.nvim',
dependencies = { "dinhhuy258/sfm-fs.nvim" },
  config = function()
		require("File_manager")
  end
},


{ -- Oil
  'stevearc/oil.nvim',
      config = function ()
        require("oil").setup()
end,
  dependencies = { "nvim-tree/nvim-web-devicons" },
},

  -- Markdown
   -- 'frabjous/knap', -- use it one linux
    { -- Previewr
    {"ellisonleao/glow.nvim", config = true, cmd = "Glow"},
    { "iamcco/markdown-preview.nvim", ft = "markdown",
    lazy = true, build = "cd app && npm install && git reset --hard", }, },
  { 'renerocksai/calendar-vim', -- some calender for wiki
    cmd = { "Calendar", "CalendarH", "CalendarT", "CalendarVR", "CalendarSearch", }, },
    -- Markdown Tool s'
   { 'gaoDean/autolist.nvim', -- 🔥 powerfull autolist,checkbox toggle, full Markdown Weapon
      ft = { "markdown", "text", "tex", "plaintex", },
     dependencies = 'mzlogin/vim-markdown-toc', -- Markdown Toc
     config = function()
      local autolist = require("autolist")
      autolist.setup()
      autolist.create_mapping_hook("i", "<CR>", autolist.new)
      autolist.create_mapping_hook("i", "<Tab>", autolist.indent)
      autolist.create_mapping_hook("i", "<S-Tab>", autolist.indent, "<C-D>")
      autolist.create_mapping_hook("n", "o", autolist.new)
      autolist.create_mapping_hook("n", "O", autolist.new_before)
      autolist.create_mapping_hook("n", ">>", autolist.indent)
      autolist.create_mapping_hook("n", "<<", autolist.indent)
      autolist.create_mapping_hook("n", "<C-r>", autolist.force_recalculate)
      autolist.create_mapping_hook("n", "<leader>x", autolist.invert_entry, "")
    end, },

    { -- Markdown Keys                     Only wors in Visual mode
        'antonk52/markdowny.nvim', -- <c-e> = code block , <c-k> = link , <c-i> = italic , <c-b> = bold ,
      ft = {"markdown", "txt", },
        config = function() require('markdowny').setup() end
    },

  -- { -- Notes Google keep
  --   'stevearc/gkeep.nvim',
  -- cmd = { "GkeepLogin", "GkeepOpen",
  -- "GkeepEnter", "GkeepClose",
  -- "GkeepToggle", "GkeepBrowse",
  -- "GkeepPopup", "GkeepPopup", },
 -- },

	-- Keymaps
	{ -- Key Sheet
	'folke/which-key.nvim',
	event = "VeryLazy",
	lazy = true,
	config = function()
		require("Key_s")
	end, },


	-- Code manipulation
	{ 'numToStr/Comment.nvim',
	event = "BufReadPre",
	dependencies =
	{ "gbprod/stay-in-place.nvim", },
	opts = {} },  -- >,< do not change position

	{ -- Beautify comments
    "LudoPinelli/comment-box.nvim", cmd = {
		'CBllbox', 'CBlcbox', 'CBlrbox',
		'CBclbox', 'CBccbox', 'CBcrbox',
		'CBrlbox', 'CBrcbox', 'CBrrbox',
		'CBalbox', 'CBacbox', 'CBarbox',
	}, },

	{ -- Around Add/change/delete
	'kylechui/nvim-surround',
	version = "*", -- Use for stability; omit to use `main` branch for the latest features
	event = "InsertEnter",
	config = function()
		require("nvim-surround").setup() end },

  {-- Navigation
'booperlv/nvim-gomove',
  event = "BufReadPost",
 config = function()
  require("gomove").setup()
    end },

  { -- Align text
  'Vonr/align.nvim',
   event ="BufReadPre",},

{ -- indent
 "shellRaining/hlchunk.nvim",
   event = { "UIEnter" },
    config = function()
  require('Misc.Hl_chunk')
    end
  },

    { -- Brackts, Parent, quotes, Completion
    'altermo/npairs-integrate-upair', -- integrate both nvim-autopairs + ultimate-autopair
    event = "InsertEnter",
    dependencies = {
    'windwp/nvim-autopairs',
    'altermo/ultimate-autopair.nvim', } },

   { -- Esc
   "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
     require("better_escape").setup()
     end, },

    { -- Contidion switcher
    'nguyenvukhang/nvim-toggler',
     event = "BufReadPre",
     config = function()
      require('nvim-toggler').setup()
      vim.keymap.set({ 'n', 'v' }, '<leader>i', require('nvim-toggler').toggle)
		  end },

    { -- Trim on save
    "cappyzawa/trim.nvim",
    event = "InsertEnter",
    cmd = {"TrimToggle" , "Trim"},
    opts = {}},

  -- Fuzzy Finder (files, lsp, etc)
    {'nvim-telescope/telescope.nvim', version = '*',
    cmd = "Telescope",
    dependencies = { 'nvim-lua/plenary.nvim',
  'nvim-telescope/telescope-symbols.nvim', -- some emojie,katmoji,gitmoji for telescope
    } },


    { -- EMOJI   pick icon & emoji
    'ziontee113/icon-picker.nvim',
    cmd = "IconPickerInsert",
    dependencies = 'stevearc/dressing.nvim',
    config = function()
      require('icon-picker').setup({ disable_legacy_commands = true })
     end },
   { -- another emoji picker
  "WilsonOh/emoji_picker-nvim",
  config = function()
    require("emoji_picker").setup()
    vim.keymap.set("i", "<M-e>", "<cmd>EmojiPicker<cr>")
  end,
    },

   { -- UX
   'NvChad/nvim-colorizer.lua',
    ft = {"css","scss", "markdown" , "html", "config",},
    config = function()
	  require("colorizer").setup {
	  filetypes = { "*" },
	  buftypes = {}, }
    end,
    dependencies = {'ziontee113/color-picker.nvim',
     config = function()
        vim.keymap.set("i", "<C-S-C>", "<cmd>PickColorInsert<cr>",opts)
        require("color-picker")
     end, }, },

		{ -- Treesitter
			"nvim-treesitter/nvim-treesitter",
			event = "BufReadPre",
			config = function()
				require("Code_s")
			end,
			dependencies = {
				"mrjones2014/nvim-ts-rainbow",
				"JoosepAlviste/nvim-ts-context-commentstring",
			}, },

		{ -- LSP Base
			"neovim/nvim-lspconfig",
			event = "BufReadPre",
			dependencies = { "williamboman/mason-lspconfig.nvim", },
			servers = nil,
		},
		{ "williamboman/mason.nvim",
		cmd = "Mason",
		keys = {
			{  "<cmd>Mason<cr>", desc = "Mason" },
		},
	},

  { -- Ui Lsp
    "https://git.sr.ht/~whynothugo/lsp_lines.nvim", -- lines of Lsp
  			event = "BufReadPre",
    config = function()
      require("lsp_lines").setup()
  vim.diagnostic.config({ virtual_lines = { only_current_line = true } })
    end,
  },

  { -- Completion
   "ms-jpq/coq_nvim",
   cmd = "COQnow",
   branch = "coq",
   init = function() vim.g.coq_settings = { auto_start = true } end,
   dependencies = {
   { "ms-jpq/coq.artifacts", branch = "artifacts" },
   { "neovim/nvim-lspconfig" }, },
   config = function() require("Coq_0") end,
   lazy = false, },

	-- { --  Completion
	-- 	"hrsh7th/nvim-cmp",
	-- 	event = "InsertEnter",
	-- 	config = function()
	-- 		require("Cmp_o")
	-- 	end,
	-- 	dependencies = {
	-- 		"hrsh7th/cmp-buffer",
	-- 		"hrsh7th/cmp-nvim-lsp",
	-- 		"hrsh7th/cmp-path",
 --      'f3fora/cmp-spell',
	-- 		"saadparwaiz1/cmp_luasnip",
	-- 		{ "L3MON4D3/LuaSnip", dependencies = "rafamadriz/friendly-snippets" },
	-- 	}, },

   -- Cool
  { -- Art   Draw Ascii
  'jbyuki/venn.nvim',
  keys = "<Leader>ve",
  cmd = "VBox", },

    -- True ZEN :)
  { 'folke/zen-mode.nvim',
   cmd = { "ZenMode", },
   dependencies =
  {'folke/twilight.nvim',
    cmd = { "Twilight", }, }, },
  {'Pocco81/true-zen.nvim', cmd = { 'TZAtaraxis', 'TZMinimalist', 'TZNarrow', 'TZFocus',}, },
   {  'junegunn/goyo.vim',
     cmd = "Goyo",},

   -- Game
    { 'ThePrimeagen/vim-be-good', -- learn VimBeGood
       cmd = "VimBeGood" },

   { -- KillKillKIll
        'seandewar/killersheep.nvim',
	cmd = "KillKillKIll", },

   { -- Destroy   make_it_rain /  game_of_life
    'Eandrju/cellular-automaton.nvim',
     cmd = "CellularAutomaton", },

 { -- Ultra fast Hop 🦘
  'ggandor/leap.nvim',
  dependencies = {'tpope/vim-repeat'},
  keys = "s",
	config = function()
require('leap').add_default_mappings()
		end, },

  --   { -- Leap on current line 🦘
  --     'ggandor/flit.nvim',
  --      dependencies = "ggandor/leap.nvim",
  --       config = function()
  -- require('flit').setup {
  --   keys = { f = 'f', F = 'F', t = 't', T = 'T' },
  --   labeled_modes = "v",
  --   multiline = true,
  --   opts = {},}
  --       end, },


{ -- Fix CamelCaseWord move's
	"chrisgrieser/nvim-spider",
	keys = { "w", "e", "b", "ge" },
	config = function()
		vim.keymap.set({ "n", "o", "x" }, "W", "w", { desc = "Normal w" })
		vim.keymap.set({ "n", "o", "x" }, "w", "<cmd>lua require('spider').motion('w')<CR>", { desc = "Spider-w" })
		vim.keymap.set({ "n", "o", "x" }, "e", "<cmd>lua require('spider').motion('e')<CR>", { desc = "Spider-e" })
		vim.keymap.set({ "n", "o", "x" }, "b", "<cmd>lua require('spider').motion('b')<CR>", { desc = "Spider-b" })
    vim.keymap.set({ "n", "o", "x" }, "ge","<cmd>lua require('spider').motion('ge')<CR>",{ desc = "Spider-ge"})
	end,
},


{ -- Undotree
  "jiaoshijie/undotree",
    keys = "<leader>u",
  config = function()
 vim.keymap.set('n', '<leader>u',require('undotree').toggle, { noremap = true, silent = true })
    require('undotree').setup({
  float_diff = false,  -- using float window previews diff, set this `true` will disable layout option
  layout = "left_bottom", -- "left_bottom", "left_left_bottom"
  window = { winblend = 28, width = 25 }, }) end,
  dependencies = { "nvim-lua/plenary.nvim", }, },


{ 'nagy135/typebreak.nvim',
    dependencies = 'nvim-lua/plenary.nvim',
      config = function()
vim.keymap.set('n', '<leader><leader>tb', function() require('typebreak').start(true) end, { desc = "Typebreak (local dictionary)" })
      end
},

}, {})
