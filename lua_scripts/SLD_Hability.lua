-- module(..., package.seeall)
local AIO = AIO or require("AIO")
local SLD_LIB = SLD_LIB or require("SLD_LIB")

assert(not SLD_Hability, "SLD_Hability is already loaded. Possibly different versions!")
-- SLD_Hability main table
SLD_Hability =
{
    -- SLD_Hability flavour functions
    unpack = unpack,
}



local SLD_Hability = SLD_Hability

if not AIO.AddAddon() then

function SLD_Hability:New ( msg )
   local MyHability = {}
   MyHability.Nom,
   MyHability.Descrip,
   MyHability.ID,
   MyHability.Leveau,
   MyHability.Ata_FUERZA,
   MyHability.Def_FUERZA,
   MyHability.Ata_DESTRE,
   MyHability.Def_DESTRE,
   MyHability.Ata_AGILID,
   MyHability.Def_AGILID,
   MyHability.Ata_INTELE,
   MyHability.Def_INTELE,
   MyHability.Ata_CONSTI,
   MyHability.Def_CONSTI,
   MyHability.Ata_SABIDU,
   MyHability.Def_SABIDU,
   MyHability.Ata_PERCEP,
   MyHability.Def_PERCEP,
   MyHability.Cos_MANA,
   MyHability.Cos_ENER,
   MyHability.Dif_TIPI,
   MyHability.OnlyAta,
   MyHability.OnlyDef,
   MyHability.Icono = strsplit ( "#", tostring(msg) )
   return MyHability
end				
else
   function LD_GetHability (ID, player)
      local MySQLCommand = "SELECT Nom, Desc, ID, Ata_FUERZA, Def_FUERZA, Ata_DESTRE, Def_DESTRE, Ata_AGILID, Def_AGILID, Ata_INTELE, Def_INTELE, Ata_CONSTI, Def_CONSTI, Ata_SABIDU, Def_SABIDU, Ata_PERCEP, Def_PERCEP, Cos_MANA, Cos_ENER, Dif_TIPI, OnlyAta, OnlyDef, Icono from LD_Habilidades where ID = " .. ID .. ";"   
      	  
   end
   PrintInfo("SLD Hability Loaded ...")
end