
skeleton = {}
skeleton.modname = core.get_current_modname()
skeleton.modpath = core.get_modpath(skeleton.modname)

-- support mob libraries in order of preference
local mob_libs = {
	"mobs",
	"cmer",
	"creatures",
}

for _, ml in ipairs(mob_libs) do
	if core.get_modpath(ml) then
		skeleton.lib = ml
		break
	end
end

-- check for compatible library
if not skeleton.lib then
	error("a compatible mob library was not found, please install one of the following: "
		.. table.concat(mob_libs, ", "))
end

if skeleton.lib == "creatures" then
	skeleton.lib = "cmer"
end

function skeleton.log(lvl, msg)
	if not msg then
		msg = lvl
		lvl = nil
	end

	msg = "[" .. skeleton.modname .. "] " .. msg

	if not lvl then
		core.log(msg)
	else
		core.log(lvl, msg)
	end
end


local scripts = {
	"settings",
	"entity",
}

for _, script in ipairs(scripts) do
	dofile(skeleton.modpath .. "/" .. script .. ".lua")
end
