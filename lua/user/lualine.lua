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
      c = { fg = colors.light, bg = colors.black },
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

  local sections = {
    lualine_a = {
      { "mode", separator = { left = "" }, right_padding = 0 },
    },
    lualine_b = {
      {
        "filename",
        path = 1,
        symbols = {
          modified = " ●", -- Text to show when the buffer is modified
          alternate_file = "#", -- Text to show to identify the alternate file
          directory = "", -- Text to show when the buffer is a directory
        },
      },
    },
    lualine_c = {},
    lualine_x = { "fileformat", "copilot" },
    lualine_y = { {
      "filetype",
      separator = { left = "" },
      left_padding = 2,
    } },
    lualine_z = { { "branch", separator = { right = "" } } },
  }

  require("lualine").setup {
    options = {
      theme = bubbles_theme,
      component_separators = { left = "", right = "" },
      section_separators = { left = "", right = "" },
      disabled_filetypes = {
        "NvimTree",
        "Trouble",
      },
    },
    sections = sections,
    inactive_sections = sections,
    tabline = {},
    extensions = {},
  }
end

return M
