-- Debug utilities

-- We'll show useful info only if debug is active
function showDebugInfo() 
    if IS_DEBUG then
        love.graphics.print("FPS: " .. tostring(love.timer.getFPS()) .. " " ..
                            "SCREEN: " .. love.graphics.getWidth() .. "x" .. love.graphics.getHeight() .. " " ..
                            "GS: " .. Gamestate.current().name .. " " ..
                            "LANG: " .. COMMON.LOCALE, 10, love.graphics.getHeight() - 20)        
    end
end

-- Debug message, only if debug is active
function debugMsg(msg)
    if IS_DEBUG then
        print("[DEBUG]: " .. tostring(msg))
    end
end

