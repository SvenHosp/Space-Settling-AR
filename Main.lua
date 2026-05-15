-- Main.lua
-- Hauptdatei für das Space-Settling-AR Spiel
-- Initialisiert das Spiel und verwaltet die Hauptspielschleife

function setup()
    -- Initialisiere das Spiel
    print("Space-Settling-AR: Spiel wird initialisiert...")
    
    -- Lade AR-Modul
    require("AR")
    
    -- Lade Spielobjekte
    require("GameObjects")
    
    -- Lade Benutzeroberfläche
    require("UI")
    
    -- Lade Hilfsfunktionen
    require("Utilities")
    
    -- Initialisiere AR-Kamera
    AR.init()
    
    -- Initialisiere Spielobjekte
    GameObjects.init()
    
    -- Initialisiere UI
    UI.init()
    
    -- Spielstatus
    gameState = "menu"
end

function draw()
    -- Hauptspielschleife
    background(0, 0, 0, 255) -- Schwarzer Hintergrund
    
    -- AR-Rendering
    AR.draw()
    
    -- Spielobjekte zeichnen
    GameObjects.draw()
    
    -- UI zeichnen
    UI.draw()
end

function touched(touch)
    -- Touch-Interaktionen
    UI.touched(touch)
    GameObjects.touched(touch)
end