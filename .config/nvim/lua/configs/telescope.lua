local options = {
	defaults = {
		file_ignore_patterns = {
			"node_modules",
		},
		layout_config = {
			horizontal = {
				prompt_position = "bottom",
			},
		},
		layout_strategy = "horizontal",
		path_display = { "truncate" },
		prompt_prefix = " ",
		selection_caret = " ",
		selection_strategy = "reset",
		sorting_strategy = "descending",
	},
}

return options
