# Space-Settling-AR
Ein **Codea AR Strategy Game** – ein Framework für die Entwicklung von Augmented-Reality-Spielen in Codea (Lua).

---

## 📌 Überblick
Dieses Repository enthält ein **Grundgerüst für ein AR-Strategiespiel**, das in [Codea](https://codea.io/) entwickelt wurde. Das Framework bietet eine modulare Struktur, um schnell mit der Entwicklung von AR-Spielen zu beginnen.

---

## 🛠️ Struktur des Frameworks

| Datei | Beschreibung |
|-------|--------------|
| **Main.lua** | Hauptdatei: Initialisiert das Spiel und verwaltet die Hauptspielschleife (`setup`, `draw`, `touched`). |
| **AR.lua** | AR-spezifische Funktionen: Kamera-Setup, Marker-Erkennung und Platzierung von Objekten im AR-Raum. |
| **GameObjects.lua** | Spielobjekte: Klassen für Raumschiffe (`Ship`), Planeten (`Planet`) und deren Logik. |
| **UI.lua** | Benutzeroberfläche: Buttons, Labels und Touch-Interaktionen. |
| **Utilities.lua** | Hilfsfunktionen: Vektoroperationen, Kollisionserkennung und Debugging. |

---

## 🚀 Schnellstart

### 1. **Repository klonen oder herunterladen**
- Klone das Repository in deine lokale Codea-Umgebung oder lade die Dateien direkt herunter.

### 2. **Codea-Projekt erstellen**
- Erstelle ein neues Projekt in Codea.
- Füge die heruntergeladenen Dateien (`Main.lua`, `AR.lua`, `GameObjects.lua`, `UI.lua`, `Utilities.lua`) zu deinem Projekt hinzu.

### 3. **Spiel starten**
- Führe das Projekt in Codea aus. Das Spiel sollte automatisch initialisiert werden und die AR-Kamera sowie Beispielobjekte (Raumschiff, Planet) anzeigen.

---

## 📝 Anleitung zur Erweiterung

### **Neue Spielobjekte hinzufügen**
1. Öffne `GameObjects.lua`.
2. Erstelle eine neue Klasse (z. B. `Asteroid`) nach dem Muster von `Ship` oder `Planet`.
3. Füge die Klasse zur `GameObjects.init()`-Funktion hinzu, um sie beim Start zu laden.

**Beispiel:**
```lua
local Asteroid = {}
Asteroid.__index = Asteroid

function Asteroid.new(x, y, z, radius)
    local self = setmetatable({}, Asteroid)
    self.position = vec3(x, y, z)
    self.radius = radius
    return self
end

function Asteroid:draw()
    pushMatrix()
    translate(self.position.x, self.position.y, self.position.z)
    sphere(self.radius)
    popMatrix()
end

-- In GameObjects.init() hinzufügen:
table.insert(GameObjects.asteroids, Asteroid.new(50, 0, -15, 1))
```

### **AR-Funktionen anpassen**
- Bearbeite `AR.lua`, um spezifische AR-Funktionen (z. B. Marker-Erkennung) zu implementieren.
- Nutze die `AR.addMarker()`- oder `AR.addSurface()`-Funktionen, um Objekte im AR-Raum zu platzieren.

### **UI anpassen**
- Füge in `UI.lua` neue Buttons oder Labels hinzu, indem du die `UI.buttons`- oder `UI.labels`-Tabelle erweiterst.
- Definiere Aktionen für Buttons im `action`-Feld.

---

## 🎮 Spielsteuerung
- **Touch:** Berühre den Bildschirm, um mit UI-Elementen zu interagieren (z. B. "Spiel starten"-Button).
- **AR-Kamera:** Die Kamera wird automatisch initialisiert. Objekten werden im AR-Raum platziert.

---

## 🔧 Technische Details
- **Sprache:** Lua (Codea)
- **AR-Unterstützung:** Simuliert (Codea unterstützt keine native AR, aber das Framework ist für zukünftige Erweiterungen vorbereitet).
- **3D-Rendering:** Nutzung von Codeas `pushMatrix()`, `translate()`, `sphere()`, `box()` etc.

---

## 📂 Dateien
- [Main.lua](Main.lua) – Hauptlogik
- [AR.lua](AR.lua) – AR-Funktionen
- [GameObjects.lua](GameObjects.lua) – Spielobjekte
- [UI.lua](UI.lua) – Benutzeroberfläche
- [Utilities.lua](Utilities.lua) – Hilfsfunktionen

---

## 🤝 Mitwirken
Falls du Verbesserungen oder Erweiterungen hast, erstelle gerne einen **Pull Request** oder öffne ein **Issue**!

---

## 📜 Lizenz
Dieses Projekt ist **Open Source** und kann frei verwendet, verändert und weitergegeben werden.

---