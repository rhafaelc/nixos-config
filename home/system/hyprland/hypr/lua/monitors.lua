local monitor = "eDP-1"

hl.monitor({
	output = monitor,
	mode = "preferred",
	position = "0x0",
	scale = 1,
	bitdepth = 8,
})

for i = 1, 10 do
	hl.workspace_rule({
		workspace = i,
		monitor = monitor,
		persistent = (i <= 5),
	})
end
