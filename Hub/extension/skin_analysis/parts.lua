local parts = {}

local function load(skin, path)

	local file = io.open(path .. "/analysis_result.lua", "w")
	
	local function export_skindata(tbl)
		local c = 1
		for i, v in pairs(tbl) do
			if i > c then
				file:write("},\n\n")
				c = c + 1
			end
			file:write("{")
			if type(v) == "table" then
				for i2, v2 in pairs(v) do
					if i2 == "offsets" or i2 == "op" then file:write(i2 .. " = {") end
					if i2 == "dst" then file:write(i2 .. " = {\n") end
					if type(v2) == "table" then
						for i3, v3 in pairs(v2) do
							if i2 == "dst" then file:write("\t") end
							if type(v3) == "table" then
								file:write("{")
								for i4, v4 in pairs(v3) do
									if i4 == "offsets" or i4 == "op" then file:write(i4 .. " = {") end
									if i4 == "dst" then file:write(i4 .. " = {\n") end
									if type(v4) == "table" then
										for i5, v5 in pairs(v4) do
											if type(v5) == "table" then
												file:write("{")
												for i6, v6 in pairs(v5) do
													file:write(i6 .. " = " .. tostring(v6) .. ", ")
												end
												file:write("}, ")
											else
												file:write(i5 .. " = " .. tostring(v5) .. ", ")
											end
										end
										file:write("}, ")
									else
										if type(i4) == "number"then
											if #v3 == i4 then 
												file:write(tostring(v4))
											else
												file:write(tostring(v4) .. ", ")
											end
										else
											file:write(i4 .. " = " .. tostring(v4) .. ", ")
										end
									end
								end
								file:write("},\n")
							else
								if type(i3) == "number"then
									if #v2 == i3 then 
										file:write(tostring(v3))
									else
										file:write(tostring(v3) .. ", ")
									end
								else
									file:write(i3 .. " = " .. tostring(v3) .. ", ")
								end
							end
						end
					else
						if (i2 == "id" and type(v2) ~= "number")
						or (i2 == "src" and type(v2) ~= "number")
						or (i2 == "path")
						then
							file:write(i2 .. " = \"" .. tostring(v2) .. "\", ")
						else
							file:write(i2 .. " = " .. tostring(v2) .. ", ")
						end
					end
					if i2 == "offsets" or i2 == "op" then file:write("}, ") end
					if i2 == "dst" then file:write("},") end
				end
			else
				file:write(i .. " = " .. tostring(v) .. ", ")
			end
		end
		if c ~= 1 then file:write("}") end
	end
	
	file:write("-- skin.property ------------------------------------\n")
	export_skindata(skin.property)
	file:write("\n\n\n\n-- skin.offset ------------------------------------\n")
	export_skindata(skin.offset)
	file:write("\n\n\n\n-- skin.filepath ------------------------------------\n")
	export_skindata(skin.filepath)
	file:write("\n\n\n\n-- skin.source ------------------------------------\n")
	export_skindata(skin.source)
	file:write("\n\n\n\n-- skin.image ------------------------------------\n")
	export_skindata(skin.image)
	file:write("\n\n\n\n-- skin.imageset ------------------------------------\n")
	export_skindata(skin.imageset)
	file:write("\n\n\n\n-- skin.value ------------------------------------\n")
	export_skindata(skin.value)
	file:write("\n\n\n\n-- skin.destination ------------------------------------\n")
	export_skindata(skin.destination)
	file:write("\n\n\n\n-- skin.judge ------------------------------------\n")
	if skin.judge[1].images then export_skindata(skin.judge[1].images) end
	if skin.judge[1].numbers then export_skindata(skin.judge[1].numbers) end
	--if skin.judge[2].images then export_skindata(skin.judge[2].images) end
	--if skin.judge[2].numbers then export_skindata(skin.judge[2].numbers) end
	--if skin.judge[3].images then export_skindata(skin.judge[3].images) end
	--if skin.judge[3].numbers then export_skindata(skin.judge[3].numbers) end
	--if skin.judge[4].images then export_skindata(skin.judge[4].images) end
	--if skin.judge[4].numbers then export_skindata(skin.judge[4].numbers) end
	
	io.close(file)
	
	return parts
	
end

return {
	parts = parts,
	load = load
}