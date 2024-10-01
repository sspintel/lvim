--[[Fp8FusedSD
lvim is the global options object

Linters should be
filled in as strings with either
a global executable or a path to
an executable
]]
-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT

-- general
lvim.log.level = "warn"
lvim.format_on_save.enabled = false
lvim.colorscheme = "lunar"
-- to disable icons and use a minimalist setup, uncomment the following
-- lvim.use_icons = false

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
-- lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
-- lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"
-- unmap a default keymapping
-- vim.keymap.del("n", "<C-Up>")
-- override a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>" -- or vim.keymap.set("n", "<C-q>", ":q<cr>" )

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
-- local _, actions = pcall(require, "telescope.actions")
-- lvim.builtin.telescope.defaults.mappings = {
--   -- for input mode
--   i = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--     ["<C-n>"] = actions.cycle_history_next,
--     ["<C-p>"] = actions.cycle_history_prev,
--   },
--   -- for normal mode
--   n = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--   },
-- }

-- Change theme settings
-- lvim.builtin.theme.options.dim_inactive = true
-- lvim.builtin.theme.options.style = "storm"

lvim.builtin.which_key.mappings["S"] = {
  name = "+Session",
  s = { "<cmd>mksession! ~/.config/lvim/session/mysession.vim<CR>", "Save Session" },
  l = { "<cmd>source ~/.config/lvim/session/mysession.vim<CR>", "Load Session" },
}
-- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
-- lvim.builtin.which_key.mappings["t"] = {
--   name = "+Trouble",
--   r = { "<cmd>Trouble lsp_references<cr>", "References" },
--   f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
--   d = { "<cmd>Trouble document_diagnostics<cr>", "Diagnostics" },
--   q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
--   l = { "<cmd>Trouble loclist<cr>", "LocationList" },
--   w = { "<cmd>Trouble workspace_diagnostics<cr>", "Workspace Diagnostics" },
-- }

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "javascript",
  "json",
  "lua",
  "python",
  "typescript",
  "tsx",
  "css",
  "rust",
  "java",
  "yaml",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enable = true

-- generic LSP settings

-- -- make sure server will always be installed even if the server is in skipped_servers list
-- lvim.lsp.installer.setup.ensure_installed = {
--     "sumneko_lua",
--     "jsonls",
-- }
-- -- change UI setting of `LspInstallInfo`
-- -- see <https://github.com/williamboman/nvim-lsp-installer#default-configuration>
-- lvim.lsp.installer.setup.ui.check_outdated_servers_on_open = false
-- lvim.lsp.installer.setup.ui.border = "rounded"
-- lvim.lsp.installer.setup.ui.keymaps = {
--     uninstall_server = "d",
--     toggle_server_expand = "o",
-- }

-- ---@usage disable automatic installation of servers
-- lvim.lsp.installer.setup.automatic_installation = false

-- ---configure a server manually. !!Requires `:LvimCacheReset` to take effect!!
-- ---see the full default list `:lua print(vim.inspect(lvim.lsp.automatic_configuration.skipped_servers))`
-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pyright", opts)

-- ---remove a server from the skipped list, e.g. eslint, or emmet_ls. !!Requires `:LvimCacheReset` to take effect!!
-- ---`:LvimInfo` lists which server(s) are skipped for the current filetype
-- lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
--   return server ~= "emmet_ls"
-- end, lvim.lsp.automatic_configuration.skipped_servers)

-- -- you can set a custom on_attach function that will be used for all the language servers
-- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

-- -- set a formatter, this will override the language server formatting capabilities (if it exists)
-- local formatters = require "lvim.lsp.null-ls.formatters"
-- formatters.setup {
--   { command = "black", filetypes = { "python" } },
--   { command = "isort", filetypes = { "python" } },
--   {
--     -- each formatter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
--     command = "prettier",
--     ---@usage arguments to pass to the formatter
--     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
--     extra_args = { "--print-with", "100" },
--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
--     filetypes = { "typescript", "typescriptreact" },
--   },
-- }

-- -- set additional linters
-- local linters = require "lvim.lsp.null-ls.linters"
-- linters.setup {
--   { command = "flake8", filetypes = { "python" } },
--   {
--     -- each linter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
--     command = "shellcheck",
--     ---@usage arguments to pass to the formatter
--     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
--     extra_args = { "--severity", "warning" },
--   },
--   {
--     command = "codespell",
--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
--     filetypes = { "javascript", "python" },
--   },
-- }


-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- vim.api.nvim_create_autocmd("BufEnter", {
--   pattern = { "*.json", "*.jsonc" },
--   -- enable wrap mode for json files only
--   command = "setlocal wrap",
-- })
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "zsh",
--   callback = function()
--     -- let treesitter use bash highlight for zsh files as well
--     require("nvim-treesitter.highlight").attach(0, "bash")
--   end,
-- })
--
vim.opt.relativenumber = true
vim.opt.clipboard = "unnamedplus"
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.ignorecase = true
vim.opt.updatetime = 300

require("telescope").setup {
  pickers = {
    buffers = {
      show_all_buffers = true,
      sort_lastused = true,
      theme = "dropdown",
      previewer = false,
      mappings = {
        i = {
          ["<c-d>"] = "delete_buffer",
        }
      }
    }
  }
}

lvim.builtin.telescope.defaults.layout_strategy = 'horizontal'
lvim.builtin.telescope.pickers = {
  find_files = {
    layout_config = {
      width = 0.95,
      height = 0.80,
    },
  },
  live_grep = {
    layout_config = {
      width = 0.95,
      height = 0.80,
    },
  },
  git_files = {
    layout_config = {
      width = 0.95,
      height = 0.80,
    },
  },
  grep_string = {
    layout_config = {
      width = 0.95,
      height = 0.80,
    },
  },
}

lvim.keys.normal_mode["<C-o>"] = ":SymbolsOutline<CR>"
lvim.keys.normal_mode["<Space>lh"] = ":ClangdSwitchSourceHeader<CR>"

-- install cppdbg with :MasonInstall codelldb
-- configure nvim-dap (cppdbg)
lvim.builtin.dap.on_config_done = function(dap)
  dap.adapters.cppdbg = {
    id = 'cppdbg',
    type = 'executable',
    command = vim.fn.stdpath('data') .. '/mason/bin/OpenDebugAD7',
  }
  dap.configurations.cpp = {
      {
        name = "Debug Python C++ Program",
        type = "cppdbg",
        request = "launch",
        MIMode = "gdb",
        program = "/home/sshanmugam/venv/bin/python",
        cwd = "${workspaceFolder}",
        args = {"-m", "pytest", "/home/sshanmugam/qnpu/pt/src/pytorch-integration/tests/pytest_working/any_mode/fused_ops/test_sgd.py", "-svk", "test_sgd[0]", "--mode", "eager", "--dut", "gaudi2"},
        env = {
          PT_HPU_LAZY_MODE = "0",
          LOG_LEVEL_ALL_PT = "1",
          ENABLE_CONSOLE = "1",
          LOG_LEVEL_ALL = "0",
        },
        stopOnEntry = false,
        MIDebuggerPath = "gdb",
        justMyCode = false,
        setupCommands= {
          {
            description= "Enable pretty-printing for gdb",
            text= "-enable-pretty-printing",
            ignoreFailures= true,
          }
        },
      },
    -- {
    --   name = "Debug C++ Program",
    --   type = "cppdbg",
    --   request = "launch",
    --   MIMode = "gdb",
    --   program =
    --   "/home/ubuntu/SSP/onnxruntime.worktrees/master.worktrees/adrianl/openvino-remove-qdq/build_debug/Debug/onnxruntime_perf_test",
    --   "/home/sshanmugam/venv/bin/python"
    --   -- program = "/home/ubuntu/SSP/onnxruntime/build_cpu/Debug/onnxruntime_test_all",
    --   -- program = "/home/ubuntu/openvino_cpp_samples_build/intel64/Debug/benchmark_app",
    --   -- program = "/home/ubuntu/SSP/onnxruntime/build/Linux/Debug/onnxruntime_perf_test",
    --   cwd = "${workspaceFolder}",
    --   -- args = {"-e", "openvino", "-I", "-i", "device_type|CPU_FP32 ", "/home/ubuntu/SSP/onnxruntime.worktrees/master/OpenVINOExecutionProvider_OpenVINO-EP-subgraph_1_0-ov_blob.onnx", "-r", "1"},
    --   args = { "-e", "openvino", "-I", "-r", "1", "-i", "device_type|CPU enable_qdq_optimizer|True disable_dynamic_shapes|True ", "-v", "/home/ubuntu/SSP/models/mobilenetv2-12-qdq/mobilenetv2-12-qdq.onnx" },
    --   -- args = {"-m", "/home/ubuntu/SSP/whisper/whisper-tiny.en/decoder_model.onnx", "-hint", "latency", "-niter", "1", "-d", "CPU", "-infer_precision", "f16"},
    --   -- args = {"--gtest_filter=Scatter.InvalidIndex"},
    --   -- env = {"LD_LIBRARY_PATH"="/home/suryap/onnxruntime/build_debug/Debug/"},
    --   stopOnEntry = false,
    --   justMyCode = false,
    --   MIDebuggerPath = "gdb",
    --   setupCommands = {
    --     {
    --       description = "Enable pretty-printing for gdb",
    --       text = "-enable-pretty-printing",
    --       ignoreFailures = true,
    --     }
    --   },
    -- },
  }
  dap.configurations.c = dap.configurations.cpp
end

-- require('dap-python').setup('/home/ubuntu/SSP/venv-llama/bin/python')
-- table.insert(require('dap').configurations.python, {
--     name = "Debug Python Program",
--     type = "python",
--     request = "launch",
--     cwd = "${workspaceFolder}",
--     program = "/home/ubuntu/SSP/chatglm.py",
--     stopOnEntry = false,
--     justMyCode = false,
-- })

-- TODO: debugpy installed by default
-- Setup dap for python
-- lvim.builtin.dap.active = true
-- local mason_path = vim.fn.glob(vim.fn.stdpath "data" .. "/mason/")
-- pcall(function() require("dap-python").setup(mason_path .. "packages/debugpy/venv/bin/python") end)
-- require("dap-python").setup(mason_path .. "packages/debugpy/venv/bin/python")

-- Supported test frameworks are unittest, pytest and django. By default it
-- tries to detect the runner by probing for pytest.ini and manage.py, if
-- neither are present it defaults to unittest.
-- pcall(function() require("dap-python").test_runner = "pytest" end)

-- vim.diagnostic.config({ virtual_text = false })
-- vim.diagnostic.config({ underline = false })

-- vim.api.nvim_set_keymap('n', '<leader>tt', ':call v:lua.toggle_diagnostics()<CR>',  {noremap = true, silent = true})


-- Additional Plugins
lvim.plugins = {
  -- {
  --   "folke/trouble.nvim",
  --   cmd = "TroubleToggle",
  -- },
  {
    "f-person/git-blame.nvim",
    event = "BufRead",
    config = function()
      vim.cmd "highlight default link gitblame SpecialComment"
      vim.g.gitblame_enabled = 1
      require("gitblame").setup { enabled = true }
    end,
  },
  {
    "sindrets/diffview.nvim",
    event = "BufRead",
  },
  {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
		event = "BufRead",
		config = function()
			require("zen-mode").setup({
				window = {
          width = 0.60,
      }
    })
    end
  },
  "mxsdev/nvim-dap-vscode-js",
  {
    "folke/trouble.nvim",
    dependencies = "nvim-tree/nvim-web-devicons"
  },
  {
    "simrat39/symbols-outline.nvim",
    config = function()
      require("symbols-outline").setup()
    end
  },
  "mfussenegger/nvim-dap-python",
  {
    "princejoogie/dir-telescope.nvim",
    -- telescope.nvim is a required dependency
    dependencies = { "nvim-telescope/telescope.nvim" },
    config = function()
      require("dir-telescope").setup({

        -- these are the default options set
        hidden = true,
        no_ignore = false,
        show_preview = true,
      })
    end,
  },
  {
      "zbirenbaum/copilot.lua",
      cmd = "Copilot",
      event = "InsertEnter",
      config = function()
          require("copilot").setup({
            suggestion = { enabled = false },
            panel = { enabled = false }
    })
      end,
  },
  {
      "zbirenbaum/copilot-cmp",
      config = function()
          require("copilot_cmp").setup({})
      end
  },
  -- Or with configuration
  {
    'projekt0n/github-nvim-theme',
    name = 'github-theme',
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      require('github-theme').setup({
        -- ...
      })

      vim.cmd('colorscheme github_dark')
    end,
  }
}

-- Below config is required to prevent copilot overriding Tab with a suggestion
-- when you're just trying to indent!
local has_words_before = function()
    if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then return false end
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_text(0, line-1, 0, line-1, col, {})[1]:match("^%s*$") == nil
end
local on_tab = vim.schedule_wrap(function(fallback)
    local cmp = require("cmp")
    if cmp.visible() and has_words_before() then
        cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
    else
        fallback()
    end
end)
lvim.builtin.cmp.mapping["<Tab>"] = on_tab

---jump to the window of specified dapui element
---@param element string filetype of the element or 'code_win' for the code window
local jump_to_element = function(element)
  local visible_wins = vim.api.nvim_tabpage_list_wins(0)
  local dap_configurations = require('dap').configurations
  for _, win in ipairs(visible_wins) do
    local buf = vim.api.nvim_win_get_buf(win)
    if vim.bo[buf].filetype == element
	  -- As we do not know the filetype of the code window, we have to check if
	  -- we can find a window with a file type that is also in the dap.configurations
	  -- We simply assume, that this is the code window
	  or element == "code_win" and dap_configurations[vim.bo[buf].filetype] ~= nil
    then
      vim.api.nvim_set_current_win(win)
      return
    end
  end
  vim.notify(("element '%s' not found"):format(element), vim.log.levels.WARN)
end

local switch_dap_window_keymap = function(mapping, type_name)
    vim.keymap.set(
      "n",
      mapping,
      function()
          jump_to_element(type_name)
      end
        )
end

switch_dap_window_keymap("<leader>dV", "dapui_scopes")
switch_dap_window_keymap("<leader>dW", "dapui_watches")
switch_dap_window_keymap("<leader>dB", "dapui_breakpoints")
switch_dap_window_keymap("<leader>dS", "dapui_stacks")
switch_dap_window_keymap("<leader>dL", "dapui_console")
switch_dap_window_keymap("<leader>dE", "code_win")

lvim.builtin.which_key.mappings["z"] = { "<cmd>ZenMode<CR>", "Zen Mode" }

-- https://github.com/LunarVim/LunarVimCommunity/issues/2
