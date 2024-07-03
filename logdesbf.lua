spawn(function()
    while true do
        pcall(function()
            local Req = (syn and syn.request) or request or (http and http.request) or http_request

            -- ฟังก์ชันสำหรับดึงข้อมูล Beli ของ LocalPlayer
            function GetLocalPlayerBeli()
                local player = game.Players.LocalPlayer
                local beliCount = 0
                if player:FindFirstChild("Data") and player.Data:FindFirstChild("Beli") then
                    beliCount = player.Data.Beli.Value
                end
                return beliCount
            end

            -- ฟังก์ชันสำหรับดึงข้อมูล Fragments ของ LocalPlayer
            function GetLocalPlayerFragments()
                local player = game.Players.LocalPlayer
                local fragmentsCount = 0
                if player:FindFirstChild("Data") and player.Data:FindFirstChild("Fragments") then
                    fragmentsCount = player.Data.Fragments.Value
                end
                return fragmentsCount
            end

            -- ฟังก์ชันสำหรับแปลงจำนวน Beli/Fragments ให้เป็นตัวย่อ
            function AbbreviateNumber(num)
                if num >= 1000000000 then
                    return string.format("%.2fb", num / 1000000000)
                elseif num >= 1000000 then
                    return string.format("%.2fm", num / 1000000)
                elseif num >= 1000 then
                    return string.format("%.2fk", num / 1000)
                else
                    return tostring(num)
                end
            end

            -- ฟังก์ชันสำหรับดึงข้อมูลจำนวนของวัสดุ
            function GetItemCount(itemName)
                local inventory = game:GetService("ReplicatedStorage").Remotes["CommF_"]:InvokeServer("getInventory")
                local itemCount = 0
                for _, item in pairs(inventory) do
                    if item["Type"] == "Material" and item["Name"] == itemName then
                        itemCount = item["Count"]
                        break
                    end
                end
                return itemCount
            end

            -- ฟังก์ชันสำหรับเช็คว่ามี Sanguine Art ในคลังหรือไม่
            function HasSanguineArt()
                local result = game:GetService("ReplicatedStorage").Remotes["CommF_"]:InvokeServer("BuySanguineArt")
                return result > 0
            end

            -- ฟังก์ชันสำหรับเช็คว่ามีดาบในกระเป๋าหรือไม่
            function CheckWeapons(weaponName)
                local inventoryWeapons = game:GetService("ReplicatedStorage").Remotes["CommF_"]:InvokeServer("getInventoryWeapons")
                for _, weapon in pairs(inventoryWeapons) do
                    if weapon.Name == weaponName or game.Players.LocalPlayer.Backpack:FindFirstChild(weaponName) then
                        return true
                    end
                end
                return false
            end

            -- ฟังก์ชันสำหรับส่งข้อมูล
            function SendPlayerData()
                local playerName = game.Players.LocalPlayer.Name

                -- ดึงข้อมูลต่างๆ
                local beliCount = GetLocalPlayerBeli()
                local fragmentsCount = GetLocalPlayerFragments()

                -- ดึงข้อมูลจำนวนวัสดุ
                local vampireFangCount = GetItemCount("Vampire Fang")
                local leviathanHeartCount = GetItemCount("Leviathan Heart")
                local darkFragmentCount = GetItemCount("Dark Fragment")
                local demonicwispCount = GetItemCount("Demonic Wisp")

                -- เช็คว่ามี Shark Anchor หรือไม่
                local hasSharkAnchor = CheckWeapons("Shark Anchor")

                -- เช็คว่ามี Sanguine Art หรือไม่
                local hasSanguineArt = HasSanguineArt()

                -- เช็คว่ามีดาบชื่ออื่น ๆ และรวมลงในข้อมูล
                local hasOtherSword = CheckWeapons("Cursed Dual Katana")

                -- สร้างข้อมูลในรูปแบบที่ต้องการ
                local data =      "B •" .. AbbreviateNumber(beliCount)
                data = data .. " | F •" .. AbbreviateNumber(fragmentsCount)
                data = data .. " | VF x" .. tostring(vampireFangCount)
                data = data .. " | LH x" .. tostring(leviathanHeartCount)
                data = data .. " | DF x" .. tostring(darkFragmentCount)
                data = data .. " | DW x" .. tostring(demonicwispCount)
                data = data .. " | SA" .. (hasSharkAnchor and "✅" or "❌")
                data = data .. " | SAT" .. (hasSanguineArt and "✅" or "❌")
                data = data .. " | CDK" .. (hasOtherSword and "✅" or "❌")


                -- ส่งข้อมูลไปยังเซิร์ฟเวอร์
                Req({
                    Method = "POST",
                    Url = "http://localhost:7963/SetDescription?Account=" .. playerName,
                    Body = data
                })
            end

            -- เรียกใช้ฟังก์ชันสำหรับส่งข้อมูล
            SendPlayerData()
        end)

        -- รอเวลา 5 วินาที
        wait(5)
    end
end)
