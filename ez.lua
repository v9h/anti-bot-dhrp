local chats = {
    "bot house roleplay",
    "dont join ac7",
    "hexaria",
    "idk what to put here lol",
    "get flung",
    "controls me n pc is breaking",
    "funi fling",
    "when u do the and then",
    "ur own bot fr",
    "| ",
    "gg/",
    "oven is a certified"
}

function detect(message,p)
    for _,m in pairs(chats) do
        if message:lower():find(m:gsub(" ","")) then
            print('detected: '..p.Name)
            task.spawn(function()
                while wait() do
                    p.Character:Destroy()
                end
            end)
        end
    end
end
game:GetService("Players").LocalPlayer.PlayerGui.Chat.Frame.ChatChannelParentFrame["Frame_MessageLogDisplay"].Scroller.ChildAdded:Connect(function(child)
    wait(.5) --// cuz of roblox initially making the message: ------- etc
    local message = child:FindFirstChildOfClass("TextLabel").Text;
    warn(message)
    message = message:gsub(' ',''); --// roblox adds a shitload of ' ' before message to offset for the username (retarded method)
    local chatter = child:FindFirstChildOfClass("TextLabel");
    chatter = chatter:FindFirstChildOfClass("TextButton").Text;
    chatter = chatter:split('[')[2]:split("]:")[1] --// most bot creators dont change displayname so this should be fine loll. if they start doing that ill just modify the code a bit.
    player = game.Players[chatter]
    print(message,chatter)
    detect(message,player)
end)

for i,v in pairs(game.Players:GetPlayers()) do
    v.Chatted:Connect(function(m)
        detect(m,v)
    end)
end

game.Players.PlayerAdded:Connect(function(plr)
    plr.Chatted:Connect(function(m)
        detect(m,v)
    end)
end)
