hl.config({
	input = {
		kb_layout = "us",
		touchpad = {
			natural_scroll = true,
			disable_while_typing = false,
		},
	},
})

hl.gesture({
	fingers = 4,
	direction = "horizontal",
	action = "workspace",
})

hl.gesture({
	fingers = 3,
	direction = "right",
	action = function()
		hl.dispatch(hl.dsp.focus({ direction = "left" }))
	end,
})

hl.gesture({
	fingers = 3,
	direction = "left",
	action = function()
		hl.dispatch(hl.dsp.focus({ direction = "right" }))
	end,
})
