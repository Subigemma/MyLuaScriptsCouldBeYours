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
for LoopVar=1,20 do
   LD_RaidFrame.Slots[LoopVar] = LD_LabelTopColors (10,IndexY,LD_RaidFrame,"",0,1,0,1)
   IndexY=IndexY-20
end
LD_RaidFrame:Hide()

function LD_ClearRAID ()
   for i=1,20 do
      LD_RaidFrame.Slots[i]:SetText("")
   end	
end   


else
   PrintInfo("SLD Frames3 Loaded ...")
end