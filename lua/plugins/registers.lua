return {
  {
    "tversteeg/registers.nvim",
    cmd = "Registers",
    config = true,
    keys = {
      { '"', mode = { "n", "v" }, desc = "Open registers window" },
      { "<C-R>", mode = "i", desc = "Insert register content" },
    },
  },
  {
    "gbprod/yanky.nvim",
    opts = {
      highlight = {
        on_put = true,
        on_yank = true,
        timer = 150,
      },
      ring = {
        history_length = 50,
        storage = "shada",
        sync_with_numbered_registers = true,
      },
      system_clipboard = {
        sync_with_ring = true, -- enables your desired behavior
      },
    },
    keys = {
      { "p", "<Plug>(YankyPutAfter)", mode = { "n", "x" }, desc = "Put after (Yanky)" },
      { "P", "<Plug>(YankyPutBefore)", mode = { "n", "x" }, desc = "Put before (Yanky)" },
      { "gp", "<Plug>(YankyGPutAfter)", mode = { "n", "x" }, desc = "GPut after" },
      { "gP", "<Plug>(YankyGPutBefore)", mode = { "n", "x" }, desc = "GPut before" },
      { "<c-n>", "<Plug>(YankyCycleForward)", desc = "Cycle forward" },
      { "<c-p>", "<Plug>(YankyCycleBackward)", desc = "Cycle backward" },
      { "]p", "<Plug>(YankyPutAfterFilter)", desc = "Put after filtered" },
      { "[p", "<Plug>(YankyPutBeforeFilter)", desc = "Put before filtered" },
    },
  },
}
