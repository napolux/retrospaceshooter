-- Debug utilities

-- We'll show useful info only if debug is active
function showDebugInfo() 
    if IS_DEBUG then
        love.graphics.print("FPS: " .. tostring(love.timer.getFPS()) .. " " ..
                            "SCREEN: " .. COMMON.SCREEN_W .. "x" .. COMMON.SCREEN_H .. " " ..
                            "LANG: " .. COMMON.LOCALE, 10, COMMON.SCREEN_H - 20)        
    end
end

-- Debug message, only if debug is active
function debugMsg(msg)
    if IS_DEBUG then
        print("[DEBUG]: " .. tostring(msg))
    end
end