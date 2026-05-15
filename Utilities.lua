-- Utilities.lua
-- Hilfsfunktionen für Space-Settling-AR

local Utilities = {}

-- Vektoroperationen
function Utilities.vec3Add(a, b)
    return vec3(a.x + b.x, a.y + b.y, a.z + b.z)
end

function Utilities.vec3Sub(a, b)
    return vec3(a.x - b.x, a.y - b.y, a.z - b.z)
end

function Utilities.vec3Multiply(a, scalar)
    return vec3(a.x * scalar, a.y * scalar, a.z * scalar)
end

function Utilities.vec3Length(a)
    return math.sqrt(a.x * a.x + a.y * a.y + a.z * a.z)
end

function Utilities.vec3Normalize(a)
    local length = Utilities.vec3Length(a)
    if length > 0 then
        return vec3(a.x / length, a.y / length, a.z / length)
    else
        return vec3(0, 0, 0)
    end
end

-- Kollisionserkennung
function Utilities.checkCollision(pos1, radius1, pos2, radius2)
    local distance = Utilities.vec3Length(Utilities.vec3Sub(pos1, pos2))
    return distance < (radius1 + radius2)
end

-- Zufallsfunktionen
function Utilities.randomVec3(min, max)
    return vec3(
        math.random() * (max - min) + min,
        math.random() * (max - min) + min,
        math.random() * (max - min) + min
    )
end

-- Zeitbasierte Funktionen
function Utilities.deltaTime()
    -- Rückgabe der Zeit seit dem letzten Frame (Platzhalter)
    return 1/60 -- Annahme: 60 FPS
end

-- Debug-Funktionen
function Utilities.printTable(t, indent)
    indent = indent or 0
    for key, value in pairs(t) do
        local formatting = string.rep("  ", indent) .. tostring(key) .. ": "
        if type(value) == "table" then
            print(formatting)
            Utilities.printTable(value, indent + 1)
        else
            print(formatting .. tostring(value))
        end
    end
end

return Utilities