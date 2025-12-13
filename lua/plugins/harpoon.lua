print("Loading harpoon config...")
local harpoon = require("harpoon")
harpoon:setup()

vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end, { desc = "Harpoon add file" })
vim.keymap.set("n", "<leader>e", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "Harpoon menu" })

-- Navigate to specific files
vim.keymap.set("n", "<leader>1", function() harpoon:list():select(1) end, { desc = "Harpoon file 1" })
vim.keymap.set("n", "<leader>2", function() harpoon:list():select(2) end, { desc = "Harpoon file 2" })
vim.keymap.set("n", "<leader>3", function() harpoon:list():select(3) end, { desc = "Harpoon file 3" })
vim.keymap.set("n", "<leader>4", function() harpoon:list():select(4) end, { desc = "Harpoon file 4" })
vim.keymap.set("n", "<leader>5", function() harpoon:list():select(5) end, { desc = "Harpoon file 5" })
vim.keymap.set("n", "<leader>6", function() harpoon:list():select(6) end, { desc = "Harpoon file 6" })
vim.keymap.set("n", "<leader>7", function() harpoon:list():select(7) end, { desc = "Harpoon file 7" })
vim.keymap.set("n", "<leader>8", function() harpoon:list():select(8) end, { desc = "Harpoon file 8" })

-- Cycle through marks
vim.keymap.set("n", "<leader>n", function() harpoon:list():prev() end, { desc = "Harpoon prev" })
vim.keymap.set("n", "<leader>p", function() harpoon:list():next() end, { desc = "Harpoon next" })
