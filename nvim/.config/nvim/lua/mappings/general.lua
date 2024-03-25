local opt = vim.opt

opt.expandtab = true      -- Use spaces instead of tabs
opt.hidden = true         -- Enable background buffers
opt.ignorecase = true     -- Ignore case
opt.joinspaces = false    -- No double spaces with join
opt.list = true           -- Show some invisible characters

opt.number = true         -- Show line numbers
opt.relativenumber = true -- Relative line numbers
opt.scrolloff = 4         -- Lines of context

opt.shiftround = true     -- Round indent
opt.shiftwidth = 4        -- Size of an indent
opt.sidescrolloff = 8     -- Columns of context
opt.smartcase = true      -- Do not ignore case with capitals
opt.smartindent = true    -- Insert indents automatically
opt.splitbelow = true     -- Put new windows below current
opt.splitright = true     -- Put new windows right of current
opt.tabstop = 4           -- Number of spaces tabs count for


opt.backup = false
opt.swapfile = false
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true

opt.mouse = 'a'
opt.clipboard = 'unnamedplus'

opt.hlsearch = false
opt.incsearch = true

opt.numberwidth = 4
opt.cursorline = true

-- Select All in the Current File
vim.api.nvim_set_keymap('n', '<C-a>', 'gg<S-v>G', { noremap = true })

-- Save and Quit Neovim
vim.api.nvim_set_keymap('n', '<C-W>', ':write<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-q>', ':q<CR>', { noremap = true })

-- Buffers
vim.api.nvim_set_keymap('n', '<C-x>', ':bdelete<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>nb', ':bNext<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>pb', ':bprevious<CR>', { noremap = true })

-- Better window navigation
vim.api.nvim_set_keymap('n', '<Left>', '<C-w>h', { noremap = true })
vim.api.nvim_set_keymap('n', '<Down>', '<C-w>j', { noremap = true })
vim.api.nvim_set_keymap('n', '<Up>', '<C-w>k', { noremap = true })
vim.api.nvim_set_keymap('n', '<Right>', '<C-w>l', { noremap = true })

-- Splitting windows
vim.api.nvim_set_keymap('n', '<leader>vs', ':vsplit<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>sh', ':split<CR>', { noremap = true })

vim.api.nvim_set_keymap('n', '<C-right>', ':vertical resize +5<CR>',
    { noremap = true })
vim.api.nvim_set_keymap('n', '<C-left>', ':vertical resize -5<CR>',
    { noremap = true })
vim.api.nvim_set_keymap('n', '<C-up>', ':resize +5<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-down>', ':resize -5<CR>', { noremap = true })

-- Prime
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set({ "n", "v" }, "<leader>y", ":!xclip -f -selection clipboard<CR>")
vim.keymap.set("n", "<leader>Y", ":!xclip -selection -f clipboard<CR>")

vim.keymap.set("n", "J", "mzJ`z")

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "nzzzv")

vim.keymap.set("x", "<leader>p", "\"_dP")

vim.keymap.set("n", "ns", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

vim.keymap.set("n", "<leader>e", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("n", "<C-d>;", "<C-d>zz");
vim.keymap.set("n", "<C-u>", "<C-u>zz");

vim.keymap.set("n", "<leader>ee", ":vsplit .env<CR>");
