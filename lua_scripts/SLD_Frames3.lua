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
LD_HabFrameBackground:SetTexture(1, 1, 1, 0.1)
LD_HabFrameBackground:SetAllPoints()
LD_HabFrame:SetSize(500, 50)
LD_HabFrame:SetPoint("BOTTOMLEFT")

else
   PrintInfo("SLD Frames3 Loaded ...")
end