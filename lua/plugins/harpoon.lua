return {
	"ThePrimeagen/harpoon",

	config = function()
		require("neo-tree").setup({
			filesystem = {
				components = {
					harpoon_index = function(config, node, _)
						local Marked = require("harpoon.mark")
						local path = node:get_id()
						local success, index = pcall(Marked.get_index_of, path)
						if success and index and index > 0 then
							return {
								text = "⚓", -- <-- Add your favorite harpoon like arrow here
								highlight = config.highlight or "NeoTreeDirectoryIcon",
							}
						else
							return {
								text = "  ",
							}
						end
					end,
				},
				renderers = {
					file = {
						{ "icon" },
						{ "name", use_git_status_colors = true },
						{ "harpoon_index" }, --> This is what actually adds the component in where you want it
						{ "diagnostics" },
						{ "git_status", highlight = "NeoTreeDimText" },
					},
				},
			},
		})
	end,
}
