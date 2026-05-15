-- GameObjects.lua
-- Spielobjekte und deren Logik für Space-Settling-AR

local GameObjects = {}

-- Beispielklasse für ein Raumschiff
local Ship = {}
Ship.__index = Ship

function Ship.new(x, y, z)
    local self = setmetatable({}, Ship)
    self.position = vec3(x, y, z)
    self.velocity = vec3(0, 0, 0)
    self.health = 100
    self.model = "spaceship.obj" -- Platzhalter für 3D-Modell
    return self
end

function Ship:draw()
    -- Zeichne das Raumschiff
    pushMatrix()
    translate(self.position.x, self.position.y, self.position.z)
    -- Hier würde das 3D-Modell gezeichnet werden
    -- Beispiel: model(self.model)
    popMatrix()
end

function Ship:update()
    -- Aktualisiere die Position des Raumschiffs
    self.position = self.position + self.velocity
end

-- Beispielklasse für einen Planeten
local Planet = {}
Planet.__index = Planet

function Planet.new(x, y, z, radius)
    local self = setmetatable({}, Planet)
    self.position = vec3(x, y, z)
    self.radius = radius
    self.resources = 1000 -- Beispiel: Ressourcen auf dem Planeten
    return self
end

function Planet:draw()
    -- Zeichne den Planeten
    pushMatrix()
    translate(self.position.x, self.position.y, self.position.z)
    sphere(self.radius)
    popMatrix()
end

-- Initialisierung aller Spielobjekte
function GameObjects.init()
    print("GameObjects: Spielobjekte werden initialisiert...")
    
    GameObjects.ships = {}
    GameObjects.planets = {}
    
    -- Erstelle ein Beispiel-Raumschiff
    table.insert(GameObjects.ships, Ship.new(0, 0, -5))
    
    -- Erstelle einen Beispiel-Planeten
    table.insert(GameObjects.planets, Planet.new(0, 0, -10, 2))
end

function GameObjects.draw()
    -- Zeichne alle Spielobjekte
    for _, ship in ipairs(GameObjects.ships) do
        ship:draw()
    end
    
    for _, planet in ipairs(GameObjects.planets) do
        planet:draw()
    end
end

function GameObjects.update()
    -- Aktualisiere alle Spielobjekte
    for _, ship in ipairs(GameObjects.ships) do
        ship:update()
    end
end

function GameObjects.touched(touch)
    -- Behandle Touch-Interaktionen mit Spielobjekten
    -- Beispiel: Auswählen eines Raumschiffs oder Planeten
end

return GameObjects