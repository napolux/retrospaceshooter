local localization = nil
local lf = love.filesystem

local lib = {
    location = "lang/",
    extension = "lang"
}

function lib.setLocalization(newlocalization)
    if lf.exists(lib.location .. newlocalization .. "." .. lib.extension) then
        localization = {}
        for line in lf.lines(lib.location .. newlocalization .. "." .. lib.extension) do
            table.insert(localization, line)
        end
    else
        localization = nil
        print(lib.location .. newlocalization .. "." .. lib.extension .. " not found!!")
    end
end

function lib.getLocalized(txt)
    if not localization then
        return txt
    else
        for i, v in pairs(localization) do
            if string.sub(v, 1, string.len(txt)) == txt then
                return string.sub(v, string.len(txt)+2)
            end
        end
        return txt
    end
end

return lib