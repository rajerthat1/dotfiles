require("bookmarks"):setup({
	-- Persist only uppercase (A-Z) bookmarks across sessions (vim-style global marks)
	persist = "vim",

	-- Auto-save last directory so `'` works to jump back
	last_directory = { enable = true, persist = true, mode = "dir" },

	-- Show full path in bookmark descriptions
	desc_format = "full",

	-- Bookmark the hovered file (not parent dir)
	file_pick_mode = "hover",
})
