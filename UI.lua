-- Benutzeroberfläche für Space-Settling-AR

local UI = {}

function UI.init()
    print("UI: Benutzeroberfläche wird initialisiert...")
    
    -- UI-Elemente
    UI.buttons = {}
    UI.labels = {}
    
    -- Beispiel-Button für das Startmenü
    table.insert(UI.buttons, {
        text = "Spiel starten",
        position = vec2(WIDTH/2, HEIGHT/2),
        size = vec2(200, 50),
        action = function()
            gameState = "playing"
        end
    })
    
    -- Beispiel-Label für den Spielstatus
    table.insert(UI.labels, {
        text = "Space Settling AR",
        position = vec2(WIDTH/2, HEIGHT - 50),
        color = color(255, 255, 255, 255)
    })
end

function UI.draw()
    -- Zeichne alle UI-Elemente
    for _, button in ipairs(UI.buttons) do
        UI.drawButton(button)
    end
    
    for _, label in ipairs(UI.labels) do
        UI.drawLabel(label)
    end
end

function UI.drawButton(button)
    -- Zeichne einen Button
    pushStyle()
    fill(0, 100, 200, 255)
    rectMode(CENTER)
    rect(button.position.x, button.position.y, button.size.x, button.size.y)
    
    fill(255, 255, 255, 255)
    textAlign(CENTER, CENTER)
    text(button.text, button.position.x, button.position.y)
    popStyle()
end

function UI.drawLabel(label)
    -- Zeichne ein Label
    pushStyle()
    fill(label.color)
    textAlign(CENTER, CENTER)
    text(label.text, label.position.x, label.position.y)
    popStyle()
end

function UI.touched(touch)
    -- Behandle Touch-Interaktionen mit UI-Elementen
    if touch.state == ENDED then
        for _, button in ipairs(UI.buttons) do
            if UI.isTouchInRect(touch, button.position, button.size) then
                button.action()
            end
        end
    end
end

function UI.isTouchInRect(touch, position, size)
    -- Überprüfe, ob ein Touch in einem Rechteck liegt
    local halfWidth = size.x / 2
    local halfHeight = size.y / 2
    
    return touch.x >= position.x - halfWidth and
           touch.x <= position.x + halfWidth and
           touch.y >= position.y - halfHeight and
           touch.y <= position.y + halfHeight
end

return UI