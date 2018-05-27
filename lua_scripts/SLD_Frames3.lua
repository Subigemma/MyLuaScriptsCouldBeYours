local AIO = AIO or require("AIO")
local SLD_LIB = SLD_LIB or require("SLD_LIB")
local SLD_Frames = SLD_Frames or require("SLD_Frames")
local SLD_Frames2 = SLD_Frames2 or require("SLD_Frames2")

assert(not SLD_Frames3, "SLD_Frames2 is already loaded. Possibly different versions!")
-- SLD_Frames main table
SLD_Frames3 =
{
    -- SLD_Frames flavour functions
    unpack = unpack,
}
local SLD_Frames3 = SLD_Frames3
if not AIO.AddAddon() then

LD_HabFrame = CreateFrame ( "Frame", "LD_HabFrame", UIParent )
local LD_HabFrameBackground = LD_HabFrame:CreateTexture("LD_HabFrameBackground", "BACKGROUND")
LD_HabFrameBackground:SetTexture(0, 0, 0, 0)
LD_HabFrameBackground:SetAllPoints()
LD_HabFrame:SetSize(500, 50)
LD_HabFrame:SetPoint("BOTTOMLEFT")


LD_RaidFrame = CreateFrame ( "Frame", "LD_RaidFrame", UIParent )
local LD_RaidFrameBackground = LD_RaidFrame:CreateTexture("LD_RaidFrameBackground", "BACKGROUND")
LD_RaidFrameBackground:SetTexture(0.5, 0.5, 1, 0.1)
LD_RaidFrameBackground:SetAllPoints()
LD_RaidFrame:SetSize(150, 400)
LD_RaidFrame:SetPoint("TOPLEFT", 10, -100)
LD_RaidFrame.MyTitle = LD_RaidFrame:CreateTitleRegion()
LD_RaidFrame.MyTitle:SetSize(150, 400) 
LD_RaidFrame.MyTitle:SetPoint("TOPLEFT", LD_RaidFrame, "TOPLEFT", 0, 0)
LD_RaidFrame:SetMovable(true)
LD_RaidFrame:EnableMouse(true)

LD_RaidFrame.Titol = LD_LabelTopColors (10,-10,LD_RaidFrame,"- RAID -",1,1,1,1)
LD_RaidFrame.Slots = {}
local IndexY = -30
LD_RaidFrame.menu = {
   { text = "Select an Option", isTitle = true},
   { text = "Opcion 1", func = function() print("Opcion 1"); end },
   { text = "Opcion 2", func = function() print("Opcion 2"); end },
   { text = "Mas Opciones", hasArrow = true,
     menuList = {
         { text = "Opcion 3", func = function() print("Opcion 3"); end }
     } 
   }
 }
for LoopVar=1,20 do
   LD_RaidFrame.Slots[LoopVar] = CreateFrame ( "Button", "LD_RaidFrame" .. tostring(LoopVar), UIParent )
   LD_RaidFrame.Slots[LoopVar]:SetPoint("TOPLEFT", LD_RaidFrame , "TOPLEFT", 30, IndexY )
   LD_RaidFrame.Slots[LoopVar]:SetSize(100, 20)
   LD_RaidFrame.Slots[LoopVar]:EnableMouse(true)
   LD_RaidFrame.Slots[LoopVar].Background=LD_RaidFrame.Slots[LoopVar]:CreateTexture("LD_SlotsBackground"..tostring(LoopVar), "BACKGROUND")
   LD_RaidFrame.Slots[LoopVar].Background:SetTexture(0.5, 0.5, 1, 0)
   LD_RaidFrame.Slots[LoopVar].Background:SetAllPoints()
   LD_RaidFrame.Slots[LoopVar].Txt = LD_LabelTopColors (30,IndexY,LD_RaidFrame,"",0,1,0,1)
   LD_RaidFrame.Slots[LoopVar].Fun = LD_LabelTopColors (0,IndexY,LD_RaidFrame,"",1,1,0,1)
   
   -- LD_RaidFrame.Slots[LoopVar].MenuFrame = CreateFrame("Frame", "MF"..tostring(LoopVar), LD_RaidFrame.Slots[LoopVar], "UIDropDownMenuTemplate")

    -- Or make the menu appear at the frame:
    -- LD_RaidFrame.Slots[LoopVar].MenuFrame:SetPoint("LEFT", LD_RaidFrame.Slots[LoopVar], "LEFT")
    IndexY=IndexY-20
end
LD_RaidFrame:Hide()

function LD_ClearRAID ()
   for i=1,20 do
      LD_RaidFrame.Slots[i]:SetText("")
   end	
end   

--
-- Zona de banda
--
LD_ToolTip=CreateFrame( "Frame", "LD_ToolTip", UIParent )
LD_ToolTip:SetPoint("TOPRIGHT", 0,0)
LD_ToolTip:SetSize(200,300)
LD_ToolTip.TxtNameMarc = CreateFrame( "Frame", "LD_ToolTip_TxtNameMarc", LD_ToolTip )
LD_ToolTip.TxtNameMarc:SetSize(200,30)
LD_ToolTip.TxtNameMarc:SetPoint("TOPRIGHT", LD_ToolTip, "TOPRIGHT", 0,0)
LD_ToolTip.TxtNameMarc:SetBackdrop({
	edgeFile = [[Interface\Tooltips\UI-Tooltip-Border]],
	edgeSize = 14,
	insets = {left = 3, right = 3, top = 3, bottom = 3},
})
LD_ToolTip.TxtName=LD_ToolTip:CreateFontString(nil,"ARTWORK","GameFontHighlight")
LD_ToolTip.TxtName:SetTextColor(1, 0.5, 0, 1)
LD_ToolTip.TxtName:SetPoint("TOPLEFT", 5 , 0)
LD_ToolTip.TxtName:SetSize(190, 30)
LD_ToolTip.TxtName:SetJustifyH("LEFT")
LD_ToolTip.TxtName:SetText("")
LD_ToolTip.TxtDesc=LD_ToolTip:CreateFontString(nil,"ARTWORK","GameFontHighlight")
LD_ToolTip.TxtDesc:SetTextColor(0.7, 0.7, 0.7, 1)
LD_ToolTip.TxtDesc:SetPoint("TOPLEFT", LD_ToolTip, "TOPLEFT", 5 , -50)
LD_ToolTip.TxtDesc:SetSize(190, 200)
LD_ToolTip.TxtDesc:SetJustifyH("LEFT")
LD_ToolTip.TxtDesc:SetJustifyV("TOP")
LD_ToolTip.TxtDesc:SetWordWrap(true)
LD_ToolTip.TxtDesc:SetText("")
LD_ToolTip:Hide()

--
-- Frame de enemigos
--
LD_FoeFrame = CreateFrame ( "Frame", "LD_FoeFrame", UIParent )
local LD_FoeFrameBackground = LD_FoeFrame:CreateTexture("LD_FoeFrameBackground", "BACKGROUND")
LD_FoeFrameBackground:SetTexture(1, 0.5, 0.5, 0.1)
LD_FoeFrameBackground:SetAllPoints()
LD_FoeFrame:SetSize(150, 400)
LD_FoeFrame:SetPoint("TOPLEFT", 150, -100)
LD_FoeFrame.MyTitle = LD_FoeFrame:CreateTitleRegion()
LD_FoeFrame.MyTitle:SetSize(150, 400) 
LD_FoeFrame.MyTitle:SetPoint("TOPLEFT", LD_FoeFrame, "TOPLEFT", 0, 0)
LD_FoeFrame:SetMovable(true)
LD_FoeFrame:EnableMouse(true)

LD_FoeFrame.Titol = LD_LabelTopColors (10,-10,LD_FoeFrame,"- ENEMIGOS -",1,1,1,1)
LD_FoeFrame.Slots = {}
local IndexY = -30
for LoopVar=1,20 do
   LD_FoeFrame.Slots[LoopVar] = CreateFrame ( "Button", "LD_FoeFrame" .. tostring(LoopVar), UIParent )
   LD_FoeFrame.Slots[LoopVar]:SetPoint("TOPLEFT", LD_FoeFrame , "TOPLEFT", 30, IndexY )
   LD_FoeFrame.Slots[LoopVar]:SetSize(100, 20)
   LD_FoeFrame.Slots[LoopVar]:EnableMouse(true)
   LD_FoeFrame.Slots[LoopVar].Background=LD_FoeFrame.Slots[LoopVar]:CreateTexture("LD_SlotsBackground"..tostring(LoopVar), "BACKGROUND")
   LD_FoeFrame.Slots[LoopVar].Background:SetTexture(0.5, 0.5, 1, 0)
   LD_FoeFrame.Slots[LoopVar].Background:SetAllPoints()
   LD_FoeFrame.Slots[LoopVar].Txt = LD_LabelTopColors (30,IndexY,LD_FoeFrame,"",0,1,0,1)
   LD_FoeFrame.Slots[LoopVar].Fun = LD_LabelTopColors (0,IndexY,LD_FoeFrame,"",1,1,0,1)
   IndexY=IndexY-20
end
LD_FoeFrame:Hide()

function OpenCombat()
   LDSendMsg("ROLMD#" .. UnitName("player") .. "#WORLD")
   LD_ROLFrame.AlertZone.TxtAlert:SetText("EN COMBATE")
   LD_ROLFrame:Show()
   LD_FoeFrame:Show()
end
function CloseCombat()
   LD_ROLFrame.AlertZone.TxtAlert:SetText("")
   LD_ROLFrame:Hide()
   LD_FoeFrame:Hide()
end


else
   PrintInfo("SLD Frames3 Loaded ...")
end