local M = {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "AndreM222/copilot-lualine",
  },
}

function M.config()
  -- stylua: ignore
  local colors = {
    blue   = '#80a0ff',
    cyan   = '#79dac8',
    black  = '#1a1b26',
    white  = '#ffffff',
    red    = '#ff5189',
    violet = '#d183e8',
    grey   = '#24283b',
    insert = '#00FFAB',
    visual = '#FFCA03',
    replace = '#FF008E',
    normal = '#4649FF',
    light = '#888da4'
  }

  local bubbles_theme = {
    normal = {
      a = { fg = colors.white, bg = colors.normal },
      b = { fg = colors.white, bg = colors.grey },
      c = { fg = colors.light, bg = nil },
    },

    insert = { a = { fg = colors.black, bg = colors.insert } },
    visual = { a = { fg = colors.black, bg = colors.visual } },
    replace = { a = { fg = colors.whive, bg = colors.replace } },

    inactive = {
      a = { fg = colors.white, bg = colors.black },
      b = { fg = colors.white, bg = colors.black },
      c = { fg = colors.black, bg = colors.black },
    },
  }

  local my_filename = require("lualine.components.filename"):extend()
  my_filename.apply_icon = require("lualine.components.filetype").apply_icon

  local sections = {
    lualine_a = {
      { "mode", separator = { left = "", right = "" }, right_padding = 0 },
    },
    lualine_b = {
      {
        "filename",
        file_status = true,
        separator = { left = "", right = "" },
        path = 0,
        symbols = {
          modified = " ●", -- Text to show when the buffer is modified
          alternate_file = "#", -- Text to show to identify the alternate file
          directory = "", -- Text to show when the buffer is a directory
        },
      },
    },
    lualine_c = {
      "branch",
      {
        "diagnostics",

        -- Table of diagnostic sources, available sources are:
        --   'nvim_lsp', 'nvim_diagnostic', 'nvim_workspace_diagnostic', 'coc', 'ale', 'vim_lsp'.
        -- or a function that returns a table as such:
        --   { error=error_cnt, warn=warn_cnt, info=info_cnt, hint=hint_cnt }
        sources = { "nvim_lsp" },

        -- Displays diagnostics for the defined severity types
        sections = { "error", "warn" },

        diagnostics_color = {
          -- Same values as the general color option can be used here.
          error = "DiagnosticError", -- Changes diagnostics' error color.
          warn = "DiagnosticWarn", -- Changes diagnostics' warn color.
          info = "DiagnosticInfo", -- Changes diagnostics' info color.
          hint = "DiagnosticHint", -- Changes diagnostics' hint color.
        },
        symbols = { error = " ", warn = " ", info = " ", hint = " " },
        colored = true, -- Displays diagnostics status in color if set to true.
        update_in_insert = false, -- Update diagnostics in insert mode.
        always_visible = true, -- Show diagnostics even if there are none.
      },
    },
    lualine_x = {
      "copilot",
      "fileformat",
      "location",
      { "filetype", separator = { left = "", right = "" } },
    },
    lualine_y = {},
    lualine_z = {},
  }

  require("lualine").setup {
    options = {
      theme = bubbles_theme,
      component_separators = { left = "", right = "" },
      section_separators = { left = "", right = "" },
      disabled_filetypes = {
        "NvimTree",
        "Trouble",
        "ToggleTerm",
        "alpha",
      },
    },
    sections = sections,
    inactive_sections = sections,
    tabline = {},
    winbar = {
      lualine_b = {},
      lualine_c = {
        -- { "filename", path = 1 },
      },
      lualine_x = {},
    },
    extensions = {},
  }
end

return M
