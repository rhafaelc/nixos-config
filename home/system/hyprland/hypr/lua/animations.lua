hl.curve("snap", {
	type = "bezier",
	points = {
		{ 0.5, 1.0 },
		{ 0.2, 1.0 },
	},
})

hl.curve("snap2", {
	type = "bezier",
	points = {
		{ 0.5, 1.0 },
		{ 0.25, 1.0 },
	},
})

hl.animation({
	leaf = "global",
	enabled = true,
	speed = 0.7,
	bezier = "snap",
})

hl.animation({
	leaf = "border",
	enabled = true,
	speed = 0.7,
	bezier = "snap",
})

hl.animation({
	leaf = "windows",
	enabled = true,
	speed = 0.7,
	bezier = "snap2",
})

hl.animation({
	leaf = "windowsIn",
	enabled = true,
	speed = 0.65,
	bezier = "snap2",
	style = "popin 95%",
})

hl.animation({
	leaf = "windowsOut",
	enabled = true,
	speed = 0.65,
	bezier = "snap2",
	style = "popin 70%",
})

hl.animation({
	leaf = "fadeIn",
	enabled = true,
	speed = 0.7,
	bezier = "snap",
})

hl.animation({
	leaf = "fadeOut",
	enabled = true,
	speed = 0.7,
	bezier = "snap",
})

hl.animation({
	leaf = "workspaces",
	enabled = true,
	speed = 0.7,
	bezier = "snap",
	style = "slide",
})

hl.animation({
	leaf = "layers",
	enabled = true,
	speed = 0.7,
	bezier = "snap",
})
