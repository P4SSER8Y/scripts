require "keys"
require "rfbkeys"

-- FW pad config if screen rotated
screenRotateClockWise()
--screenRotateAntiClockWise()

-- variables client_width and client_height will be available when handleInput() is called
client_width = 0
client_height = 0

--[[
   you have also the following API functions:

   Quit( [status] )
      will quit the application. optional: return code (must be positive)

   SendKeyEvent( keyCode, pressed )
      sends a key event to the rfb server. "pressed" is a bool value
      telling whether the key was pressed (true) or released (false)

   SendPointerEvent( x, y, buttonMask )
      sends a pointer event to the rfb server
]]--


-- this handler will be called upon key presses (input events, actually)
function handleInput(channel, itype, code, value)
    --print("input:", channel, itype, code, value)
    if itype == EV_KEY then
        local pressed = false
        if value == EVENT_VALUE_KEY_PRESS then
            pressed = true
        elseif value == EVENT_VALUE_KEY_RELEASE then
            pressed = false
        else
            return -- we don't know how to handle this.
        end

        -- special keys
        if code == KEY_HOME then Quit()
        elseif code == KEY_MENU then SendKeyEvent(XK_Escape, pressed)
        elseif code == KEY_BACK then SendKeyEvent(XK_Escape, pressed)
        elseif code == KEY_KB then SendKeyEvent(XK_Escape, pressed)

        elseif code == KEY_PGBCK then SendKeyEvent(XK_Page_Up, pressed)
        elseif code == KEY_PGFWD then SendKeyEvent(XK_Page_Down, pressed)

        elseif code == KEY_LPGBCK then SendKeyEvent(XK_Page_Up, pressed)
        elseif code == KEY_LPGFWD then SendKeyEvent(XK_Page_Down, pressed)

        elseif code == KEY_FW_LEFT then SendKeyEvent(XK_Left, pressed)
        elseif code == KEY_FW_RIGHT then SendKeyEvent(XK_Right, pressed)
        elseif code == KEY_FW_UP then SendKeyEvent(XK_Up, pressed)
        elseif code == KEY_FW_DOWN then SendKeyEvent(XK_Down, pressed)

        elseif code == KEY_FW_PRESS then SendKeyEvent(XK_Return, pressed)
        end
    end
end
