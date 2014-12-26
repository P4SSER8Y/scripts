--[[
    This file contains settings related to key codes

    Copyright (C) 2010 Andy M. aka h1uke	h1ukeguy @ gmail.com
    Copyright (C) 2012 Hans-Werner Hilse <hilse@web.de>

    This program is free software; you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation; either version 2 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program; if not, write to the Free Software
    Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
]]--

KEY_HOME     = 102
KEY_MENU     = 139
KEY_BACK     = 158
KEY_KB       = 29

KEY_PGBCK    = 109
KEY_PGFWD    = 191

KEY_LPGBCK   = 193
KEY_LPGFWD   = 104

KEY_FW_LEFT  = 105
KEY_FW_RIGHT = 106
KEY_FW_UP    = 103
KEY_FW_DOWN  = 108

KEY_FW_PRESS = 194

-- constants from <linux/input.h>
EV_KEY = 1

-- event values
EVENT_VALUE_KEY_PRESS   = 1
EVENT_VALUE_KEY_REPEAT  = 2
EVENT_VALUE_KEY_RELEASE = 0

function screenRotateClockWise()
    KEY_FW_LEFT  = 103
    KEY_FW_RIGHT = 108
    KEY_FW_UP    = 106
    KEY_FW_DOWN  = 105
end

function screenRotateAntiClockWise()
    KEY_FW_LEFT  = 108
    KEY_FW_RIGHT = 103
    KEY_FW_UP    = 105
    KEY_FW_DOWN  = 106
end

