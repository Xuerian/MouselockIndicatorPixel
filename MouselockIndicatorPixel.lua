-- CarbinePlz
--- CarbinePlz During-Mouselock-Keybinds
-- Carbineplz.

-- Lets WildstarMouselockRebind simulate alternate bindings when GameLib.IsMouseLockOn() is true


local MouselockIndicatorPixel = {}

function MouselockIndicatorPixel:Init()
	Apollo.RegisterAddon(self)
end

function MouselockIndicatorPixel:OnLoad()
	self.xml = XmlDoc.CreateFromFile("MouselockIndicatorPixel.xml")
	self.wndPixels = Apollo.LoadForm("MouselockIndicatorPixel.xml", "MouselockIndicatorPixels", "InWorldHudStratum", self)
	self.wndPixels:Show(true)
	
	Apollo.CreateTimer("MouselockIndicatorPixelPulse", 0.2, true)
	Apollo.RegisterTimerHandler("MouselockIndicatorPixelPulse", "Pulse", self)
end

local green, black = CColor.new(0, 1, 0, 1), CColor.new(0, 0, 0, 1)
function MouselockIndicatorPixel:Pulse()
	self.wndPixels:SetBGColor(GameLib.IsMouseLockOn() and green or black)
end

MouselockIndicatorPixel:Init()
