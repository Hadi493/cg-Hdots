return {
  {
    "github/copilot.vim",
    event = "InsertEnter",
    config = function()
      -- optional: remap Tab so it doesn't conflict with cmp
      vim.g.copilot_no_tab_map = true
      vim.api.nvim_set_keymap("i", "<C-l>", 'copilot#Accept("<CR>")',
        { silent = true, expr = true })
    end,
  },
}
