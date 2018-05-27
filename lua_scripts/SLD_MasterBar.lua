local AIO = AIO or require("AIO")
local SLD_LIB = SLD_LIB or require("SLD_LIB")
local SLD_Frames = SLD_Frames or require("SLD_Frames")
local SLD_Frames2 = SLD_Frames2 or require("SLD_Frames2")
local SLD_Frames3 = SLD_Frames3 or require("SLD_Frames3")

assert(not SLD_MasterBar, "SLD_MasterBar is already loaded. Possibly different versions!")
-- SLD_Frames main table
SLD_MasterBar =
{
    -- SLD_Frames flavour functions
    unpack = unpack,
}



local SLD_MasterBar = SLD_MasterBar
if not AIO.AddAddon() then
   LD_MasterFrame = CreateFrame ( "Frame", "LD_MasterFrame", UIParent )
   LD_MasterFrame:SetSize(320, 240)
   LD_MasterFrame.MyTitle = LD_MasterFrame:CreateTitleRegion()
   LD_MasterFrame.MyTitle:SetSize(320, 240) 
   LD_MasterFrame.MyTitle:SetPoint("TOPLEFT", LD_MasterFrame, "TOPLEFT", 0, 0)   
   LD_MasterFrame:SetPoint("TOPRIGHT", -40, -170)
   LD_MasterFrame:SetMovable(true)
   LD_MasterFrame:EnableMouse(true)
   local LD_MasterFrameBackground = LD_MasterFrame:CreateTexture("LD_MasterFrameBackground", "BACKGROUND")
   LD_MasterFrameBackground:SetTexture(0, 1, 1, 0.1)
   LD_MasterFrameBackground:SetAllPoints()

   LD_MasterFrame.NPC1B = LD_ButtonFrame ( 5, 210, LD_MasterFrame, "Interface\\ICONS\\ability_druid_flightform" )
   LD_MasterFrame.NPC1B:SetScript("OnClick", function ()
      if UnitName("target") == nil then
	     return
      end
	  LD_MasterFrame.NPC1N:SetText(UnitName("target"))
	  LD_MasterFrame.NPC1G:SetText(UnitGUID("target"))
	  end)
   LD_MasterFrame.NPC1N = LD_LabelTopColors (30,-15,LD_MasterFrame,"",0,1,0,1)
   LD_MasterFrame.NPC1G = LD_LabelTopColors (30,-15,LD_MasterFrame,"",0,0,0,0)
   LD_MasterFrame.NPC1T = LD_EditFrameTrans (LD_MasterFrame, 5, -40, 300, 15, 1, "", false, 0.2)
   LD_MasterFrame.NPC1T:SetScript("OnEscapePressed", function (self)
      self:SetText("")
      self:ClearFocus()	  
      end)
   LD_MasterFrame.NPC1T:SetScript("OnEnterPressed", function (self)
      local MyUnitGUID = LD_MasterFrame.NPC1G:GetText()
      LDSendMsg("NPSAY#" .. 
	             string.sub(MyUnitGUID,3) .. 
				 "#" .. string.sub(MyUnitGUID, -6, -1) .. 
				 "#" .. string.sub(MyUnitGUID, -12, -7) .. 
				 "#" .. LD_MasterFrame.NPC1T:GetText()) 
      LD_MasterFrame.NPC1T:SetText("")				 
      end)
   
   LD_MasterFrame.NPC2B = LD_ButtonFrame ( 5, 160, LD_MasterFrame, "Interface\\ICONS\\ability_druid_flightform" )
   LD_MasterFrame.NPC2B:SetScript("OnClick", function ()
      if UnitName("target") == nil then
	     return
      end
	  LD_MasterFrame.NPC2N:SetText(UnitName("target"))
	  LD_MasterFrame.NPC2G:SetText(UnitGUID("target"))
	  end)
   LD_MasterFrame.NPC2N = LD_LabelTopColors (30,-65,LD_MasterFrame,"",0,1,0,1)
   LD_MasterFrame.NPC2G = LD_LabelTopColors (30,-65,LD_MasterFrame,"",0,0,0,0)
   LD_MasterFrame.NPC2T = LD_EditFrameTrans (LD_MasterFrame, 5, -85, 300, 15, 1, "", false, 0.2)
   LD_MasterFrame.NPC2T:SetScript("OnEscapePressed", function (self)
      self:SetText("")
      self:ClearFocus()	  
      end)
      
   LD_MasterFrame.NPC2T:SetScript("OnEnterPressed", function (self)
      local MyUnitGUID = LD_MasterFrame.NPC2G:GetText()
      LDSendMsg("NPSAY#" .. 
	             string.sub(MyUnitGUID,3) .. 
				 "#" .. string.sub(MyUnitGUID, -6, -1) .. 
				 "#" .. string.sub(MyUnitGUID, -12, -7) .. 
				 "#" .. LD_MasterFrame.NPC2T:GetText()) 
      self:SetText("")
      self:ClearFocus()	  
      end)
   
   LD_MasterFrame.NPC3B = LD_ButtonFrame ( 5, 110, LD_MasterFrame, "Interface\\ICONS\\ability_druid_flightform" )
   LD_MasterFrame.NPC3B:SetScript("OnClick", function ()
      if UnitName("target") == nil then
	     return
      end
	  LD_MasterFrame.NPC3N:SetText(UnitName("target"))
	  LD_MasterFrame.NPC3G:SetText(UnitGUID("target"))
	  end)
   LD_MasterFrame.NPC3N = LD_LabelTopColors (30,-115,LD_MasterFrame,"",0,1,0,1)
   LD_MasterFrame.NPC3G = LD_LabelTopColors (30,-115,LD_MasterFrame,"",0,0,0,0)
   LD_MasterFrame.NPC3T = LD_EditFrameTrans (LD_MasterFrame, 5, -130, 300, 15, 1, "", false, 0.2)
   LD_MasterFrame.NPC3T:SetScript("OnEscapePressed", function (self)
      self:SetText("")
      self:ClearFocus()	  
      end)
      
   LD_MasterFrame.NPC3T:SetScript("OnEnterPressed", function (self)
      local MyUnitGUID = LD_MasterFrame.NPC3G:GetText()
      LDSendMsg("NPSAY#" .. 
	             string.sub(MyUnitGUID,3) .. 
				 "#" .. string.sub(MyUnitGUID, -6, -1) .. 
				 "#" .. string.sub(MyUnitGUID, -12, -7) .. 
				 "#" .. LD_MasterFrame.NPC3T:GetText()) 
      self:SetText("")
      self:ClearFocus()	  
      end)

   LD_MasterFrame.NPC4B = LD_ButtonFrame ( 5, 70, LD_MasterFrame, "Interface\\ICONS\\ability_druid_flightform" )
   LD_MasterFrame.NPC4B:SetScript("OnClick", function ()
      if UnitName("target") == nil then
	     return
      end
	  LD_MasterFrame.NPC4N:SetText(UnitName("target"))
	  LD_MasterFrame.NPC4G:SetText(UnitGUID("target"))
	  end)
   LD_MasterFrame.NPC4N = LD_LabelTopColors (30,-155,LD_MasterFrame,"",0,1,0,1)
   LD_MasterFrame.NPC4G = LD_LabelTopColors (30,-155,LD_MasterFrame,"",0,0,0,0)
   LD_MasterFrame.NPC4T = LD_EditFrameTrans (LD_MasterFrame, 5, -175, 300, 15, 1, "", false, 0.2)
   LD_MasterFrame.NPC4T:SetScript("OnEscapePressed", function (self)
      self:SetText("")
      self:ClearFocus()	  
      end)
      
   LD_MasterFrame.NPC4T:SetScript("OnEnterPressed", function (self)
      local MyUnitGUID = LD_MasterFrame.NPC4G:GetText()
      LDSendMsg("NPSAY#" .. 
	             string.sub(MyUnitGUID,3) .. 
				 "#" .. string.sub(MyUnitGUID, -6, -1) .. 
				 "#" .. string.sub(MyUnitGUID, -12, -7) .. 
				 "#" .. LD_MasterFrame.NPC4T:GetText()) 
      self:SetText("")
      self:ClearFocus()	  
      end)
   LD_MasterFrame.OpenCombat = LD_ButtonFrame ( 5, 20, LD_MasterFrame, "Interface\\ICONS\\ability_warrior_charge" )
   LD_MasterFrame.OpenCombat:SetScript("OnEnter", function(self)
      self:SetAlpha(1) 
      GameTooltip:SetOwner(self, "ANCHOR_LEFT");
      GameTooltip:AddLine("|cff00ffff Abrir combate");
	  GameTooltip:Show()
	  end)
   LD_MasterFrame.OpenCombat:SetScript("OnLeave", function(self)
	  self:SetAlpha(0.5) 
      GameTooltip:Hide()
	  end)
   LD_MasterFrame.OpenCombat:SetScript("OnClick", function(self)
      LDSendMsg("OPCMT#OPCMT")
	  end)
	  
   LD_MasterFrame.CloseCombat = LD_ButtonFrame ( 35, 20, LD_MasterFrame, "Interface\\ICONS\\ability_seal" )
   LD_MasterFrame.CloseCombat:SetScript("OnEnter", function(self)
      self:SetAlpha(1) 
      GameTooltip:SetOwner(self, "ANCHOR_LEFT");
      GameTooltip:AddLine("|cff00ffff Cerrar combate");
	  GameTooltip:Show()
	  end)
   LD_MasterFrame.CloseCombat:SetScript("OnLeave", function(self)
	  self:SetAlpha(0.5) 
      GameTooltip:Hide()
	  end)
   LD_MasterFrame.CloseCombat:SetScript("OnClick", function(self)
      LDSendMsg("CLCMT#CLCMT")
	  end)
	  
   LD_MasterFrame.FoeList = LD_ButtonFrame ( 65, 20, LD_MasterFrame, "Interface\\ICONS\\ability_warrior_rampage" )
   LD_MasterFrame.FoeList:SetScript("OnEnter", function(self)
      self:SetAlpha(1) 
      GameTooltip:SetOwner(self, "ANCHOR_LEFT");
      GameTooltip:AddLine("|cff00ffff Lista de enemigos");
	  GameTooltip:Show()
	  end)
   LD_MasterFrame.FoeList:SetScript("OnLeave", function(self)
	  self:SetAlpha(0.5) 
      GameTooltip:Hide()
	  end)
   LD_MasterFrame.FoeList:SetScript("OnClick", function(self)
      print("Calma campeón, que todavia me quedan cosas por hacer")
	  end)
	  
   LD_MasterFrame.Iniciativa = LD_ButtonFrame ( 95, 20, LD_MasterFrame, "Interface\\ICONS\\ability_rogue_sprint" )
   LD_MasterFrame.Iniciativa:SetScript("OnEnter", function(self)
      self:SetAlpha(1) 
      GameTooltip:SetOwner(self, "ANCHOR_LEFT");
      GameTooltip:AddLine("|cff00ffff Iniciativa");
	  GameTooltip:Show()
	  end)
   LD_MasterFrame.Iniciativa:SetScript("OnLeave", function(self)
	  self:SetAlpha(0.5) 
      GameTooltip:Hide()
	  end)
   LD_MasterFrame.Iniciativa:SetScript("OnClick", function(self)
      print("Calma campeón, que todavia me quedan cosas por hacer")
	  end)
	  
	  

   LD_MasterFrame:Hide()	  
else
   PrintInfo("SLD Master Bar Loaded ...")
end