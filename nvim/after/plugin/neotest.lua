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

local function get_nearest_function_name()
  local ts_utils = require("nvim-treesitter.ts_utils")
  local node = ts_utils.get_node_at_cursor()

  while node do
    if node:type() == "function_declaration" then
      return ts_utils.get_node_text(node:child(1))[1]
    end
    node = node:parent()
  end
end

vim.keymap.set("n", "<leader>ta", neotest.run.attach)
vim.keymap.set("n", "<leader>ts", neotest.run.stop)
vim.keymap.set("n", "<leader>to", neotest.output.open)
vim.keymap.set("n", "<leader>tf", function() neotest.run.run(vim.fn.expand("%")) end)
vim.keymap.set("n", "<leader>tp", function() neotest.jump.prev({ status = "failed" }) end)
vim.keymap.set("n", "<leader>tn", function() neotest.jump.next({ status = "failed" }) end)

-- vim.keymap.set("n", "<leader>tt", neotest.run.run)
vim.keymap.set("n", "<leader>tt",
  function()
    local name = get_nearest_function_name()
    if not name then
      return
    end

    neotest.run.run({
      extra_args = { "-run", name },
    })
  end
)
