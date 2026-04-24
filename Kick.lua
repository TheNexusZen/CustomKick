local function KickPlayer(title, reason)
    local colorMap = {
        ["a"] = "#4B0082", ["b"] = "#0000FF", ["c"] = "#00FFFF", ["d"] = "#556B2F",
        ["e"] = "#6B8E23", ["f"] = "#FF6347", ["g"] = "#00FF00", ["h"] = "#ADFF2F",
        ["i"] = "#FFFFF0", ["j"] = "#F0E68C", ["k"] = "#000000", ["l"] = "#AFFF00",
        ["m"] = "#FF00BB", ["n"] = "#000080", ["o"] = "#FFA500", ["p"] = "#FF00FF",
        ["q"] = "#800000", ["r"] = "#FF0000", ["s"] = "#808080", ["t"] = "#008080",
        ["u"] = "#40E0D0", ["v"] = "#EE82EE", ["w"] = "#FFFFFF", ["x"] = "#F5F5F5",
        ["y"] = "#FFFF00", ["z"] = "#4682B4"
    }

    local function convert(text, limit)
        local rawText = text:gsub("<[^>]+>", "")
        if limit and #rawText > limit then
            text = text:sub(1, limit) .. "..."
        end
        return text:gsub("<C=(%a)>", function(c)
            return '<font color="' .. (colorMap[c:lower()] or "#FFFFFF") .. '">'
        end):gsub("</c>", "</font>")
    end

    local finalTitle = convert(title, 15)
    local finalReason = convert(reason)
    local plainReason = reason:gsub("<[^>]+>", "")
    local CoreGui = (cloneref or (function(a) return a end))(game:GetService("CoreGui"))

    task.spawn(function()
        while true do
            pcall(function()
                local prompt = CoreGui:WaitForChild("RobloxPromptGui", 5):FindFirstChild("ErrorPrompt", true)
                if not prompt then return end

                local tLabel = prompt:FindFirstChild("ErrorTitle", true)
                local mLabel = prompt:FindFirstChild("ErrorMessage", true)
                
                if tLabel and mLabel then
                    tLabel.RichText = true
                    mLabel.RichText = true
                    tLabel.Text = finalTitle
                    mLabel.Text = finalReason
                end

                prompt.AutomaticSize = Enum.AutomaticSize.XY
                if prompt.Size.Y.Offset ~= 0 then
                    prompt.Size = UDim2.new(0, 400, 0, 0)
                end
            end)
            task.wait(0.1)
        end
    end)

    game:GetService("Players").LocalPlayer:Kick(plainReason)
end

return KickPlayer
