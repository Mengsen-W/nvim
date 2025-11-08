return {
  "CRAG666/code_runner.nvim",
  -- event = { "BufReadPost", "BufNewFile", "BufWritePre", "VeryLazy" },
  opts = {
    filetype = {
      cpp = {
        "cd $dir && clang++ -g -Wall -fsanitize=address -fno-omit-frame-pointer -std=c++20 $fileName -o $fileNameWithoutExt.out && $dir/$fileNameWithoutExt.out",
      },
      go = {
        "cd $dir && go run $fileName",
      },
      rust = {
        "cd $dir && rustfmt $fileName && rustc $fileName -o $fileNameWithoutExt.out && $dir/$fileNameWithoutExt.out",
      },
    },
    -- 可选：设置运行结果输出的终端类型，浮动窗口比较美观
    mode = "float",
  },
  keys = {
    -- { "<leader>cr", ":RunCode<CR>", desc = "RunCode" },
    { "<leader>drf", "<cmd>RunFile<cr>", desc = "RunFile" },
    -- vim.keymap.set('n', '<leader>rft', ':RunFile tab<CR>', { noremap = true, silent = false })
    -- vim.keymap.set('n', '<leader>rp', ':RunProject<CR>', { noremap = true, silent = false })
    -- vim.keymap.set('n', '<leader>rc', ':RunClose<CR>', { noremap = true, silent = false })
    -- vim.keymap.set('n', '<leader>crf', ':CRFiletype<CR>', { noremap = true, silent = false })
    -- vim.keymap.set('n', '<leader>crp', ':CRProjects<CR>', { noremap = true, silent = false })
  },
  -- config = true,
}
