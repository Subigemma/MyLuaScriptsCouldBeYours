local AIO = AIO or require("AIO")
local SLD_LIB = SLD_LIB or require("SLD_LIB")

assert(not SLD_Player, "SLD_Player is already loaded. Possibly different versions!")
-- SLD_Frames main table
SLD_Player =
{
    -- SLD_Player flavour functions
    unpack = unpack,
}

--
-- Clase de manejo de PJ
--

local SLD_Player = SLD_Player 
if not AIO.AddAddon() then
   --
   -- Propiedades
   --
   SLD_Player.WName = GetUnitName("player")  -- Nombre Wow del pj
   SLD_Player.Account = ""                   -- Cuenta
   
   SLD_Player.Atributos = {}                 -- ATRIBUTOS
   SLD_Player.Atributos.FUERZA = 0           -- Fuerza física
   SLD_Player.Atributos.CONSTI = 0           -- Constitucion, aguante natural
   SLD_Player.Atributos.DESTRE = 0           -- Destreza
   SLD_Player.Atributos.AGILID = 0           -- Agilidad
   SLD_Player.Atributos.INTELE = 0           -- Entendimiento
   SLD_Player.Atributos.SABIDU = 0           -- Voluntad
   SLD_Player.Atributos.PERCEP = 0           -- Percepción
   
   --
   -- VARIABLES DE ROL (Marco LD_AttrFrame)
   --
   SLD_Player.Nombre = ""                    -- Nombre onrol
   SLD_Player.Apelli = ""                    -- Apellidos
   SLD_Player.App = "P"                      -- Estado de aprobacion de la ficha
   SLD_Player.Hist1 = ""                     -- Historia
   SLD_Player.Hist2 = ""                     -- Aspecto fisico
   SLD_Player.Edad = 0                       -- Edad

   --
   -- CUADRO DE DADOS/EMOTES (Marco LD_RolFrame)
   --
   SLD_Player.Dice1Min = 1                   -- Valor minimo de dados guardado (1)
   SLD_Player.Dice1Max = 10                  -- Valor maximo de dados guardado (1)
   SLD_Player.Dice2Min = 1                   -- Valor minimo de dados guardado (2)
   SLD_Player.Dice2Max = 0                   -- Valor maximo de dados guardado (2)
   SLD_Player.Say1 = ""                      -- Texto guardado(1)                       
   SLD_Player.Say2 = ""                      -- Texto guardado(2)                       
   SLD_Player.Say3 = ""                      -- Texto guardado(3)                       
   
   --
   -- Metodos
   --
   function SLD_Player:GetAccount(Data)
      SLD_Player.Account = Data 
   end
   
   function SLD_Player:GetAttributes(Data)   -- Distribucion de atributos desde mensaje del server
      local sHEAD, sPLAYER, sFUERZA, sCONSTI, sDESTRE, sAGILID, sINTELE, sSABIDU, sPERCEP = strsplit ( "#", Data )
      SLD_Player.Atributos.FUERZA = tonumber(sFUERZA)
      SLD_Player.Atributos.CONSTI = tonumber(sCONSTI)
      SLD_Player.Atributos.DESTRE = tonumber(sDESTRE)
      SLD_Player.Atributos.AGILID = tonumber(sAGILID)
      SLD_Player.Atributos.INTELE = tonumber(sINTELE)
      SLD_Player.Atributos.SABIDU = tonumber(sSABIDU)
      SLD_Player.Atributos.PERCEP = tonumber(sPERCEP)
	  LD_ServerDebug ("SLD_Player:GetAttributes Done ...")
   end	  

   function SLD_Player:GetRolVars(Data)   -- Distribucion de variables de rol desde mensaje del server
      local sHEAD, sPLAYER, sNombre, sApelli, sApp, sHist1, sHist2, sEdad, sApp = strsplit ( "#", Data )
      SLD_Player.Nombre = sNombre
      SLD_Player.Apelli = sApelli
      SLD_Player.App = sApp
      SLD_Player.Hist1 = sHist1
      SLD_Player.Hist2 = sHist2
      SLD_Player.Edad = tonumber(sEdad)
	  SLD_Player.App = sApp
	  LD_ServerDebug ("SLD_Player:GetRolVars Done ...")
   end
   
   function SLD_Player:GetDiceVars(Data)   -- Distribucion de variables guardadas dados/emotes mensaje del server
      local sDice1Min, sDice1Max, sDice2Min, sDice2Max, Say1, Say2, Say3 = strsplit ( "#", Data )
      SLD_Player.Dice1Min = tonumber(sDice1Min)
      SLD_Player.Dice1Max = tonumber(sDice1Max)
      SLD_Player.Dice2Min = tonumber(sDice2Min)
      SLD_Player.Dice2Max = tonumber(sDice2Max)
      SLD_Player.Say1 = Say1
      SLD_Player.Say2 = Say2
      SLD_Player.Say3 = Say3
	  LD_ServerDebug ("SLD_Player:GetDiceVars Done ...")
   end
   
   LD_ServerDebug ("SLD Player (Client) Loaded ...")

else

   function SLD_Player:SelectAttributes(PlayerName)
      local RetStr = "SETALLATTR#" .. PlayerName
      local WhereClause = ""
      local MySQLQuery = "SELECT LD_VALUE from LD_SessionVars where LD_PJ = '" .. PlayerName .."'"
      local MyAttributes = { "FUERZA", "CONSTI", "DESTRE", "AGILID", "INTELE", "SABIDU", "PERCEP" }
      local MyVal = nil
	  for MyIndex in pairs(MyAttributes)
	  do
         local WhereClause = " AND LD_TYPE='ATRIBUTO' AND LD_INDEX='" .. MyAttributes[MyIndex] .. "';"
  	     local MyRes = CharDBQuery(MySQLQuery .. WhereClause)
         if ( MyRes ~= nil ) then
            local NumRows = MyRes:GetRowCount()
            for i = 1,NumRows do
               MyVal = MyRes:GetString( 0 )
               MyRes:NextRow()
            end
		 else
		    MyVal = "0"
         end
	     RetStr = RetStr .. "#" .. MyVal
	  end
      return RetStr	  
   end
   
   function SLD_Player:SelectRolVars(PlayerName)
      local RetStr = "SETALLROL#" .. PlayerName
      local WhereClause = ""
      local MySQLQuery = "SELECT LD_VALUE from LD_SessionVars where LD_PJ = '" .. PlayerName .."'"
      local MyRolVars = { "NOMBRE", "APELLIDO", "APP", "HIST1", "HIST2", "EDAD", "APP" }
      local MyVal = nil
	  for MyIndex in pairs(MyRolVars)
	  do
         local WhereClause = " AND LD_TYPE='ROL' AND LD_INDEX='" .. MyRolVars[MyIndex] .. "';"
  	     local MyRes = CharDBQuery(MySQLQuery .. WhereClause)
         if ( MyRes ~= nil ) then
            local NumRows = MyRes:GetRowCount()
            for i = 1,NumRows do
               MyVal = MyRes:GetString( 0 )
               MyRes:NextRow()
            end
		 else
		    MyVal = ""
         end
	     RetStr = RetStr .. "#" .. MyVal
	  end
      return RetStr	  
   end
   
   function SLD_Player:SelectDiceVars(PlayerName)
      local RetStr = "SETDICEVARS#" .. PlayerName
      local WhereClause = ""
      local MySQLQuery = "SELECT LD_VALUE from LD_SessionVars where LD_PJ = '" .. PlayerName .."'"
      local MyDiceVars = { "DICE1MIN", "DICE1MAX", "DICE2MIN", "DICE2MAX"}
	  local MySayVars = {"SAY1", "SAY2", "SAY3" }
      local MyVal = nil
	  for MyIndex in pairs(MyDiceVars)
	  do
         local WhereClause = " AND LD_TYPE LIKE 'DICE%' AND LD_INDEX='" .. MyDiceVars[MyIndex] .. "';"
  	     local MyRes = CharDBQuery(MySQLQuery .. WhereClause)
         if ( MyRes ~= nil ) then
            local NumRows = MyRes:GetRowCount()
            for i = 1,NumRows do
               MyVal = MyRes:GetString( 0 )
               MyRes:NextRow()
            end
		 else
		    MyVal = ""
         end
	     RetStr = RetStr .. "#" .. MyVal
	  end
	  for MyIndex in pairs(MySayVars)
	  do
         local WhereClause = " AND LD_TYPE='SAY' AND LD_INDEX='" .. MySayVars[MyIndex] .. "';"
  	     local MyRes = CharDBQuery(MySQLQuery .. WhereClause)
         if ( MyRes ~= nil ) then
            local NumRows = MyRes:GetRowCount()
            for i = 1,NumRows do
               MyVal = MyRes:GetString( 0 )
               MyRes:NextRow()
            end
		 else
		    MyVal = ""
         end
	     RetStr = RetStr .. "#" .. MyVal
	  end
      return RetStr	  
   end
   
   PrintInfo("SLD Player (Server) Loaded ...")
end
