return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    require("toggleterm").setup({
      size = 15,
      open_mapping = [[<C-t>]],
      hide_numbers = true,
      start_in_insert = true,
      insert_mappings = true,
      persist_mode = false,
      persist_size = true,
      close_on_exit = true,
      clear_env = false,
    })
  end
}
