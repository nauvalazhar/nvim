local M = {
  "ibhagwan/fzf-lua",
}

function M.config()
  local wk = require "which-key"
  wk.register {
    ["<C-p>"] = { "<cmd>FzfLua files<cr>", "Find" },
    ["<TAB>"] = { "<cmd>FzfLua buffers<cr>", "Find" },
  }

  local actions = require "fzf-lua.actions"
  require("fzf-lua").setup {
    winopts = {
      height = 0.5,
      width = 0.5,
      row = 0,
      backdrop = 100,
      preview = {
        hidden = "hidden",
      },
    },
    actions = {
      files = {
        ["default"] = actions.file_switch_or_edit,
      },
    },
    fzf_opts = {
      ["--color"] = "bg+:#1a1b26,pointer:#4649FF",
      -- ["--pointer"] = "👉",
      -- idk why is this doesn't works
      -- ["--bind"] = "tab:down,shift-tab:up",
      -- place the following variable instead on ur shell:
      -- export FZF_DEFAULT_OPTS='--bind=tab:down,shift-tab:up'
    },
  }
end

return M
