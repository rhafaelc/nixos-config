hl.config({
	listener = {
		{
			timeout = 150, -- 2.5 min
			on_timeout = "brightnessctl -s set 10",
			on_resume = "brightnessctl -r",
		},

		-- Uncomment if you have keyboard backlight
		-- {
		--   timeout = 150,
		--   on_timeout = 'brightnessctl -sd rgb:kbd_backlight set 0',
		--   on_resume = 'brightnessctl -rd rgb:kbd_backlight',
		-- },

		{
			timeout = 300, -- 5 min
			on_timeout = "noctalia msg session lock",
		},

		{
			timeout = 330, -- 5.5 min
			on_timeout = "hyprctl dispatch dpms off",
			on_resume = "hyprctl dispatch dpms on",
		},

		{
			timeout = 1800, -- 30 min
			on_timeout = "systemctl suspend",
		},
	},
})
