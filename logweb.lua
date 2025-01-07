
repeat task.wait() until game:IsLoaded()
getgenv().Hermanos_Settings = {
	['key'] = '043b3678-97b8-48e6-b97f-f7b52abec036',
	['PC'] = 'xxx',

	['webhooks'] = {
		['fullmoon'] = 'https://discord.com/api/webhooks/',
		['mirage'] = 'https://discord.com/api/webhooks/',
	},

	['Sword'] = {'Cursed Dual Katana', 'Shark Anchor', 'Tushita', 'Yama', 'Dark Dagger', 'Hallow Scythe', 'Saber'},
	['Gun'] = {'Soul Guitar', 'Serpent Bow', 'Kabucha', 'Acidum Rifle'},
	['Accessories'] = {'Dark Coat', 'Leviathan Shield','Leviathan Crown', 'Pale Scarf', 'Kitsune Mask', 'Kitsune Ribbon'},
	['Fruit'] = {'Kitsune', 'Leopard', 'Dragon',  'Spirit', 'Control', 'Venom', 'Shadow', 'Dough','Mammoth', 'T-Rex'},
}
task.spawn(function() loadstring(game:HttpGet('https://raw.githubusercontent.com/hermanos-dev/hermanos-script/main/script.lua'))() end)
	
