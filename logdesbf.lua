spawn(function()
    while true do
        pcall(function()
            Req = (syn and syn.request) or request or (http and http.request) or http_request

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
            function SendItemData()
                local data = ""

                -- เช็คและรวมข้อมูลของ Vampire Fang
                local vampireFangCount = GetItemCount("Vampire Fang")
                if vampireFangCount > 0 then
                    data = "VF x" .. tostring(vampireFangCount)
                else
                    data = "VF x" .. tostring(vampireFangCount)
                end

                -- เช็คและรวมข้อมูลของ Leviathan Heart
                local leviathanHeartCount = GetItemCount("Leviathan Heart")
                if leviathanHeartCount > 0 then
                    data = data .. " | LH x" .. tostring(leviathanHeartCount)
                else
                    data = data .. " | DF x" .. tostring(darkFragmentCount)
                end

                -- เช็คและรวมข้อมูลของ Dark Fragment
                local darkFragmentCount = GetItemCount("Dark Fragment")
                if darkFragmentCount > 0 then
                    data = data .. " | DF x" .. tostring(darkFragmentCount)
                else
                    data = data .. " | DF x" .. tostring(darkFragmentCount)
                end

                -- เช็คว่ามี Shark Anchor หรือไม่
                local hasSharkAnchor = CheckWeapons("Shark Anchor")
                if hasSharkAnchor then
                    data = data .. " | Shark Anchor✅"
                else
                    data = data .. " | Shark Anchor❌"
                end

                -- เช็คว่ามี Sanguine Art หรือไม่
                local hasSanguineArt = HasSanguineArt()
                if hasSanguineArt then
                    data = data .. " | SA✅"
                else
                    data = data .. " | SA❌"
                end

                -- เพิ่มการเช็คดาบอื่น ๆ ตามต้องการ
                -- เช็คว่ามีดาบชื่ออื่น ๆ และรวมลงในข้อมูล
                local hasOtherSword = CheckWeapons("Cursed Dual Katana")
                if hasOtherSword then
                    data = data .. " | CDK✅"
                else
                    data = data .. " | CDK❌"
                end

                -- ส่งข้อมูลไปยังเซิร์ฟเวอร์
                Req({
                    Method = "POST",
                    Url = "http://localhost:7963/SetDescription?Account=" .. game.Players.LocalPlayer.Name,
                    Body = data
                })
            end

            -- เรียกใช้ฟังก์ชันสำหรับส่งข้อมูล
            SendItemData()
        end)

        -- รอเวลา 5 วินาที
        wait(5)
    end
end)
