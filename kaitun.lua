script_key = "HxSRRMMOcWcSgEVQhlvoZQddCnRrfjgh"
getgenv().SetFpsCap = false
getgenv().FpsCap = 10
getgenv().OneClickUi = true -- Only Open Necessacry Ui For One Click
getgenv().FpsBoost1 = true
    getgenv().WhiteScreen = true
    getgenv().UiCheckItems = true
    getgenv().OneClickSetting = {
        Enable=true,
        UnlimitGetQuest=true,
        TripleQuest=true,
        AutoAddStats=true,
        RedeemCode=true,
        Sea2KeyHop=true,
        FruitEat = { --Priority, Name, 
[1] = {"Spirit-Spirit"},
[2] = {"Dough-Dough"},
[3] = {"Kitsune-Kitsune"},
[4] = {"Buddha-Buddha"},
[5] = {"Leopard-Leopard"},
[6] = {"Mammoth-Mammoth"},
[7] = {"Venom-Venom"},
[8] = {"T-Rex-T-Rex"},
[9] = {"Rumble-Rumble"},
[10] = {"Gas-Gas"} 
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
        FarmItems = false, --Turn off If Want Focus Level And CDK, THis Only get After You Get God Human
        DisableSoulGuitar = false,
        DisableCDK = false,

    }
    getgenv().OneClickFarms = {
        ["Shark Anchor"] = true,
    }
getgenv().Team = "Pirates"
getgenv().AutoLoad = false --Will Load Script On Server Hop
 loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/3b2169cf53bc6104dabe8e19562e5cc2.lua"))()
