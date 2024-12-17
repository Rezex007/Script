script_key = "HxSRRMMOcWcSgEVQhlvoZQddCnRrfjgh"
getgenv().SetFpsCap = false 
getgenv().FpsCap = 30
    getgenv().UiCheckItems = false
    getgenv().WhiteScreen = false
    getgenv().OneClickSetting = {
        Enable=true,
        UnlimitGetQuest=true,
        TripleQuest=true,
        AutoAddStats=true,
        RedeemCode=true,
        Sea2KeyHop=true,
        FruitEat = { --Priority, Name, 
            [1] = {'Dough-Dough','Kitsune-Kitsune','Buddha-Buddha', 'Leopard-Leopard','Mammoth-Mammoth','Venom-Venom','T-Rex-T-Rex','Rumble-Rumble','Spirit-Spirit'},
        },
        EatFruitFromStorage = true,
        SnipeFruit = true,
        SnipeFruitMirage = true,
        HopIfFoundNearExploiter = false,
        HopHakiColor =false,
        HopTushita = false,
        HopValkyriehelm = false,
        HopMirrorFractal=false,
        FarmPole = false, -- Turn off If Want Focus Level
        FarmItems = true, --Turn off If Want Focus Level And CDK, THis Only get After You Get God Human
        DisableSoulGuitar = true,
        DisableCDK = false,
        DisableRaceEvolve = true,
         RollRace={
            Enable = false,
            Races = {"Mink","Fishman","Human","Skypiea"}
        },
       MinFragment = 200000, --Farm After Max Level
    }
getgenv().Team = "Pirates"
loadstring(game:HttpGet("https://raw.githubusercontent.com/vinhuchi/rblx/main/W-azure/BloxFruit/OneClickLoader.lua"))()
