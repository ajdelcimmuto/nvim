-- local alpha = require("alpha")
-- local dashboard = require("alpha.themes.dashboard")

-- -- Set header
-- dashboard.section.header.val = {
--     "                                                     ",
--     "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
--     "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
--     "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
--     "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
--     "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
--     "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
--     "                                                     ",
-- }

-- -- Set menu
-- dashboard.section.buttons.val = {
--     dashboard.button( "e", "  > New file" , ":ene <BAR> startinsert <CR>"),
--     dashboard.button( "f", "  > Find file", ":Telescope find_files<CR>"),
--     dashboard.button( "r", "  > Recent"   , ":Telescope oldfiles<CR>"),
--     dashboard.button( "s", "  > Settings" , ":e $MYVIMRC | :cd %:p:h | split . | wincmd k | pwd<CR>"),
--     dashboard.button( "q", "  > Quit NVIM", ":qa<CR>"),
-- }

-- -- Set footer
-- local fortune = require("alpha.fortune")
-- dashboard.section.footer.val = fortune()

-- -- Send config to alpha
-- alpha.setup(dashboard.opts)

-- -- Disable folding on alpha buffer
-- vim.cmd([[
--     autocmd FileType alpha setlocal nofoldenable
-- ]])

-- -- Function to safely automatically close Alpha when a file is opened
-- local function safe_alpha_auto_close()
--     -- Wrap the function in pcall to catch any errors
--     local status, error = pcall(function()
--         local buffers = vim.api.nvim_list_bufs()
--         local alpha_buf_index = nil
--         local non_alpha_bufs = 0

--         for i, buf in ipairs(buffers) do
--             if vim.api.nvim_buf_is_valid(buf) then
--                 local buftype = vim.api.nvim_buf_get_option(buf, 'buftype')
--                 local filetype = vim.api.nvim_buf_get_option(buf, 'filetype')
                
--                 if filetype == 'alpha' then
--                     alpha_buf_index = i
--                 elseif buftype ~= 'nofile' and filetype ~= 'nerdtree' then
--                     non_alpha_bufs = non_alpha_bufs + 1
--                 end
--             end
--         end

--         if non_alpha_bufs > 0 and alpha_buf_index then
--             vim.api.nvim_buf_delete(buffers[alpha_buf_index], { force = true })
--         end
--     end)

--     -- If there was an error, print it to the console
--     if not status then
--         vim.api.nvim_err_writeln("Error in alpha_auto_close: " .. tostring(error))
--     end
-- end

-- -- Create an autocommand to run safe_alpha_auto_close when opening a file
-- vim.api.nvim_create_autocmd({"BufEnter", "BufAdd"}, {
--     pattern = "*",
--     callback = function()
--         -- Use vim.schedule to defer the execution to avoid potential race conditions
--         vim.schedule(safe_alpha_auto_close)
--     end
-- })

-- -- Optionally, you can add this to handle WinResized events separately
-- vim.api.nvim_create_autocmd({"WinResized"}, {
--     pattern = "*",
--     callback = function()
--         -- Only run the function if NERDTree is not the current filetype
--         if vim.bo.filetype ~= "nerdtree" then
--             vim.schedule(safe_alpha_auto_close)
--         end
--     end
-- })
