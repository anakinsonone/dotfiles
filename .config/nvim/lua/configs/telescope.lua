local options = {
	defaults = {
		selection_strategy = "reset",
		layout_strategy = "horizontal",
		layout_config = {
			horizontal = {
				prompt_position = "bottom",
			},
		},
		sorting_strategy = "descending",
		prompt_prefix = " ",
		selection_caret = " ",
		path_display = { "smart" },
		file_ignore_patterns = {
			"node_modules",
		},
	},
}

return options
