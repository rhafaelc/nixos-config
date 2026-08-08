hl.monitor({
	output = "eDP-1",
	mode = "preferred",
	position = "0x0",
	scale = 1,
	bitdepth = 8,
})

for i = 1, 10 do
	hl.workspace_rule({
		workspace = i,
		monitor = "eDP-1",
		persistent = (i <= 5),
	})
end
