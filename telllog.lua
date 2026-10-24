--#   ,-.       _,---._ __  / \
--#  /  )    .-'       `./ /   \
--# (  (   ,'            `/    /|
--#  \  `-"             \'\   / |
--#   `.              ,  \ \ /  |
--#    /`.          ,'-`----Y   |
--#   (            ;        |   '
--#   |  ,-.    ,-'         |  /
--#   |  | (   |   Meechie  | /
--#   )  |  \  `.___________|/
--================================================================================
-- TellLog LUA - v1.0 Date: 2026-09-16
--================================================================================

_addon.name = 'TellLog'
_addon.author = 'Meechie'
_addon.version = '1.0'
_addon.commands = {'telllog', 'tl'}

-- ============ State ============
local unread = {}

-- ============ Helpers ============
local function char_name()
    local player = windower.ffxi.get_player()
    return player and player.name or 'Unknown'
end

local function write_line(line)
    local f = io.open(windower.addon_path .. 'tells_' .. char_name() .. '.log', 'a')
    if f then
        f:write(line .. '\n')
        f:close()
    end
end

-- ============ Capture ============
windower.register_event('chat message', function(message, sender, mode, gm)
    if mode ~= 3 then return end
    local line = ('[%s] %s: %s'):format(os.date('%Y-%m-%d %H:%M:%S'), sender, message)
    write_line(line)
    table.insert(unread, line)
end)

-- ============ Commands ============
windower.register_event('addon command', function(cmd)
    cmd = cmd and cmd:lower() or 'show'
    if cmd == 'show' then
        if #unread == 0 then
            windower.add_to_chat(207, 'TellLog: no new tells')
        end
        for _, line in ipairs(unread) do
            windower.add_to_chat(207, line)
        end
    elseif cmd == 'clear' then
        unread = {}
        windower.add_to_chat(207, 'TellLog: cleared')
    end
end)
