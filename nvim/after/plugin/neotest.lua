local neotest = require("neotest")

neotest.setup({
  adapters = {
    require("neotest-go")({
      experimental = {
        test_table = true,
      },
      args = { "-count=1", "-timeout=60s" }
    })
  }
})

vim.keymap.set("n", "<leader>tt", neotest.run.run)
vim.keymap.set("n", "<leader>ta", neotest.run.attach)
vim.keymap.set("n", "<leader>ts", neotest.run.stop)
vim.keymap.set("n", "<leader>to", neotest.output.open)
