hs.window.animationDuration = 0

function reloadConfig(files)
	local doReload = false
	for _,file in pairs(files) do
		if file:sub(-4) == ".lua" then
			doReload = true
		end
	end
	if doReload then
		hs.reload()
		hs.alert.show('Config Reloaded')
	end
end
hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", reloadConfig):start()

function bindKey(key, fn)
	hs.hotkey.bind({"cmd", "ctrl"}, key, fn)
end

positions = {
	maximized = hs.layout.maximized,
	centered = {x=0.15, y=0.15, w=0.7, h=0.7},

	left34 = {x=0, y=0, w=0.34, h=1},
	left50 = hs.layout.left50,
	left66 = {x=0, y=0, w=0.66, h=1},
	left70 = hs.layout.left70,

	right30 = hs.layout.right30,
	right34 = {x=0.66, y=0, w=0.34, h=1},
	right50 = hs.layout.right50,
	right66 = {x=0.34, y=0, w=0.66, h=1},

	upper50 = {x=0, y=0, w=1, h=0.5},
	upper50Left50 = {x=0, y=0, w=0.5, h=0.5},
	upper50Right15 = {x=0.85, y=0, w=0.15, h=0.5},
	upper50Right30 = {x=0.7, y=0, w=0.3, h=0.5},
	upper50Right50 = {x=0.5, y=0, w=0.5, h=0.5},

	lower50 = {x=0, y=0.5, w=1, h=0.5},
	lower50Left50 = {x=0, y=0.5, w=0.5, h=0.5},
	lower50Right50 = {x=0.5, y=0.5, w=0.5, h=0.5},

	chat = {x=0.5, y=0, w=0.35, h=0.5}
}

--
-- Layouts
--

layouts = {
	{
		name="Work",
		description="Pedal to the metal",
		small={
			{"Firefox", nil, screen, positions.upper50left50, nil, nil},
			{"iTerm",   nil, screen, positions.right50, nil, nil},
		},
		large={
			{"Firefox", nil, screen, positions.upper50left50, nil, nil},
			{"iTerm",   nil, screen, positions.right50, nil, nil},
		}
	},
}
currentLayout = null

function applyLayout(layout)
	local screen = hs.screen.mainScreen()

	local layoutSize = layout.small
	if layout.large and screen:currentMode().w > 1500 then
		layoutSize = layout.large
	end

	currentLayout = layout
	hs.layout.apply(layoutSize, function(windowTitle, layoutWindowTitle)
		return string.sub(windowTitle, 1, string.len(layoutWindowTitle)) == layoutWindowTitle
	end)
end

layoutChooser = hs.chooser.new(function(selection)
	if not selection then return end

	applyLayout(layouts[selection.index])
end)
i = 0
layoutChooser:choices(hs.fnutils.imap(layouts, function(layout)
	i = i + 1

	return {
		index=i,
		text=layout.name,
		subText=layout.description
	}
end))
layoutChooser:rows(#layouts)
layoutChooser:width(20)
layoutChooser:subTextColor({red=0, green=0, blue=0, alpha=0.4})

bindKey(';', function()
	layoutChooser:show()
end)

hs.screen.watcher.new(function()
	if not currentLayout then return end

	applyLayout(currentLayout)
end):start()

--
-- Grid
--

grid = {
	{key="u", units={positions.upper50Left50}},
	{key="i", units={positions.upper50}},
	{key="o", units={positions.upper50Right50}},

	{key="j", units={positions.left50, positions.left66, positions.left34}},
	{key="k", units={positions.centered, positions.maximized}},
	{key="l", units={positions.right50, positions.right66, positions.right34}},

	{key="m", units={positions.lower50Left50}},
	{key=",", units={positions.lower50}},
	{key=".", units={positions.lower50Right50}}
}
hs.fnutils.each(grid, function(entry)
	bindKey(entry.key, function()
		local units = entry.units
		local screen = hs.screen.mainScreen()
		local window = hs.window.focusedWindow()
		local windowGeo = window:frame()

		local index = 0
		hs.fnutils.find(units, function(unit)
			index = index + 1

			local geo = hs.geometry.new(unit):fromUnitRect(screen:frame()):floor()
			return windowGeo:equals(geo)
		end)
		if index == #units then index = 0 end

		currentLayout = null
		window:moveToUnit(units[index + 1])
	end)
end)

