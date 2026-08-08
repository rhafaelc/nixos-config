hl.layer_rule({
	match = {
		namespace = "noctalia-background-.*$",
	},
	ignore_alpha = 0.1,
	blur = true,
	blur_popups = true,
})

hl.window_rule({
	match = { class = "^(anki)$" },
	workspace = "3 silent",
})

hl.window_rule({
	match = { class = "^(vesktop)$" },
	workspace = "3 silent",
})
