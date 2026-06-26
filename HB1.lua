local WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/yuihghghg/RJ/refs/heads/main/ui.lua"))()

-- ==================== 小企鹅风格主题 ====================
local techGreen = Color3.fromRGB(0, 255, 160)
local black = Color3.fromRGB(255, 255, 255)
-- 将描述文字改为亮白色，确保公告内容清晰
local brightGray = Color3.fromRGB(240, 240, 245)

WindUI:AddTheme({
    Name = "DeltaForce",
    WindowTopbarTitle = techGreen,
    WindowTopbarAuthor = techGreen,
    TabTitle = techGreen,
    ElementTitle = black,
    ButtonText = black,
    PopupTitle = black,
    DialogTitle = black,
    ElementDesc = brightGray,      -- 调亮描述文
    PopupContent = black,
    DialogContent = black ,
    PlaceholderText = techGreen,
    Icon = techGreen,
    TooltipText = black,
    TooltipSecondaryText = black,
})
WindUI:SetTheme("DeltaForce")

-- 获取服务
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local HttpService = game:GetService("HttpService")

-- 创建主窗口
local Window = WindUI:CreateWindow({
    Title = "HB零度网络张怀民",
    Author = "User",
    Folder = "MyHub",
    Transparent = true, 
    Theme = "DeltaForce",
    SideBarWidth = 130,
    HideSearchBar = false, -- 显示侧边栏搜索框
    ScrollBarEnabled = true,
    Background = "https://i.postimg.cc/vZ3pXZK9/1000029658.jpg",
    BackgroundImageTransparency = 0.7,
    User = { Enabled = true },
    ToggleKey = Enum.KeyCode.F,
})

print("✅ 窗口已创建，主题 DeltaForce 已应用")

-- 定义统一的图标链接
local sjzIcon = "https://i.postimg.cc/ZqWDcFp4/1000038387.jpg"

-- ==================== 创建所有标签页 ====================
local Tabs = {
    gonggao = Window:Tab({ Title = "公告", Icon = sjzIcon }),
    zho = Window:Tab({ Title = "通用", Icon = sjzIcon }),
    fe = Window:Tab({ Title = "🔞动作fe🔞", Icon = sjzIcon }),
    bot = Window:Tab({ Title = "☠︎自瞄", Icon = sjzIcon }),
    Lemon = Window:Tab({ Title = "柠檬脚本", Icon = sjzIcon }),
    Lucky = Window:Tab({ Title = "踢幸运方块", Icon = sjzIcon }),
    MiniWar = Window:Tab({ Title = "迷你战争", Icon = sjzIcon }),
    doors = Window:Tab({ Title = "doors", Icon = sjzIcon }),
    dao = Window:Tab({ Title = "刀刃球", Icon = sjzIcon }),
    shen99 = Window:Tab({ Title = "森林中的99夜", Icon = sjzIcon }),
    mosha = Window:Tab({ Title = "谋杀悬疑2", Icon = sjzIcon })
}

-- ========== 新增标签页 ========== 
Tabs.JiSuChuanQi = Window:Tab({ Title = "极速传奇", Icon = sjzIcon })
Tabs.QiCheYingXiao = Window:Tab({ Title = "汽车营销大亨", Icon = sjzIcon })
Tabs.ChengWeiQiGai = Window:Tab({ Title = "成为乞丐", Icon = sjzIcon })
Tabs.ZaiChaoShi = Window:Tab({ Title = "在超市生活一周", Icon = sjzIcon })
Tabs.YuanSuLiLiang = Window:Tab({ Title = "元素力量大亨", Icon = sjzIcon })
Tabs.JianZaoJiDi = Window:Tab({ Title = "建造你的基地", Icon = sjzIcon })
Tabs.ZhengZaiXunQiu = Window:Tab({ Title = "正在寻求", Icon = sjzIcon })
Tabs.ZhongZhiHuaYuan = Window:Tab({ Title = "种植花园", Icon = sjzIcon })
Tabs.ZiRanZaiHai = Window:Tab({ Title = "自然灾害", Icon = sjzIcon })
Tabs.ZuiQiangZhanChang = Window:Tab({ Title = "最强战场", Icon = sjzIcon})
Tabs.tp = Window:Tab({ Title = "躲避", Icon = sjzIcon})
Tabs.zw = Window:Tab({ Title = "植物大战脑红❌可能没效果", Icon = sjzIcon})
Tabs.kg = Window:Tab({ Title = "矿井", Icon = sjzIcon})
--==================== 公告标签页 ====================
-- 公告独立变量
local NoticeConfig = {
    TitleText = "📢 工具版本公告 V2.0",
    MainContent = [[
更新内容清单：
1、全部UI界面移除折叠分区，所有功能直接平铺显示
2、修复行走速度、跳跃高度滑块变成按钮的bug
3、优化UI侧边栏宽度，文字显示更清晰
4、优化主题配色，弹窗文字对比度提升
5、快捷键F一键隐藏/显示菜单，无冲突

使用须知：
本脚本仅用于单机本地测试，请勿多人联机滥用，违规操作会导致Roblox账号封禁！
]],
    NoticeImg = "https://i.postimg.cc/V6V2qKMd/1000026520.jpg", -- 可替换自己图片直链
    StatusTip = "公告加载完成，当前为离线静态公告",
    IsLoadFinish = true
}

-- 直接挂载到gonggao标签页（无折叠Section）
-- 公告大标题
local noticeTitle = Tabs.gonggao:Paragraph({
    Title = NoticeConfig.TitleText,
    Desc = "",
    Image = "bell",
    ImageSize = 22,
    ThumbnailSize = 0
})

-- 公告正文内容
local noticeContent = Tabs.gonggao:Paragraph({
    Title = "",
    Desc = NoticeConfig.MainContent,
    ImageSize = 0
})

-- 公告展示图片
local noticeImage = Tabs.gonggao:Image({
    Image = NoticeConfig.NoticeImg,
    AspectRatio = "16:9",
    Radius = 14
})

-- 分割线
Tabs.gonggao:Divider()

-- 底部状态文字
local noticeStatus = Tabs.gonggao:Paragraph({
    Title = "",
    Desc = NoticeConfig.StatusTip
})

Tabs.gonggao:Divider()

-- 刷新重置公告按钮
Tabs.gonggao:Button({
    Title = "🔁 重置公告",
    Icon = "refresh",
    Callback = function()
        -- 点击重置所有公告文字
        noticeTitle:SetTitle(NoticeConfig.TitleText)
        noticeContent:SetDesc(NoticeConfig.MainContent)
        noticeStatus:SetDesc("公告已重置，内容无变动")
        WindUI:Notify({
            Title = "提示",
            Content = "公告刷新完成！",
            Duration = 2.5,
            Icon = "check"
        })
    end
})

-- 底部免责提示按钮
Tabs.gonggao:Button({
    Title = "⚠️ 查看使用免责声明",
    Icon = "alert",
    Callback = function()
        WindUI:Dialog({
            Title = "免责须知",
            Content = [[
1、本工具仅作学习Lua脚本编程使用；
2、禁止在公共服务器、多人房间内使用；
3、因违规使用造成账号封禁，一切后果由使用者自行承担；
4、禁止倒卖、二次分发本脚本源码。
            ]],
            ConfirmText = "已知晓",
            CancelText = "关闭"
        })
    end
})

-- ============================================================
-- ==================== 工具函数 ====================
local function getCharacter()
    if LocalPlayer and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
        return LocalPlayer.Character
    end
    return nil
end

-- ==================== 无限跳（JumpRequest 事件） ====================
local isInfiniteJumpEnabled = false

UserInputService.JumpRequest:Connect(function()
    if isInfiniteJumpEnabled then
        local character = getCharacter()
        if character then
            local humanoid = character:FindFirstChildOfClass("Humanoid")
            if humanoid then
                humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
            end
        end
    end
end)

-- ==================== 通用标签页 ====================
Tabs.zho:Paragraph({
    Title = "通用:",
    Desc = "",
    Image = "https://i.postimg.cc/d1sH5qJN/1781878127576.png",
    ImageSize = 20,
    ThumbnailSize = 120
})

-- 行走速度滑块
Tabs.zho:Slider({
    Title = "行走速度（默认16）",
    Desc = "调整角色的行走速度",
    Value = { Min = 1, Max = 400, Default = 16 },
    Step = 1,
    IsTextbox = true,
    Callback = function(value)
        local char = getCharacter()
        if char then char.Humanoid.WalkSpeed = value end
    end
})
-- 跳跃高度滑块
Tabs.zho:Slider({
    Title = "跳跃高度（默认50）",
    Desc = "调整角色的跳跃高度",
    Value = { Min = 0, Max = 400, Default = 50 },
    Step = 1,
    IsTextbox = true,
    Callback = function(value)
        local char = getCharacter()
        if char then char.Humanoid.JumpPower = value end
    end
})
Tabs.zho:Slider({
    Title = "设置缩放焦距(正常70)",
    Desc = "",
    Value = { Min = 0.1, Max = 250, Default = 70 },
    Step = 0.1,
    IsTextbox = true,
    Callback = function(fieldOfView)
        workspace.CurrentCamera.FieldOfView = fieldOfView
    end
})
Tabs.zho:Slider({
    Title = "设置血量",
    Desc = "",
    Value = { Min = 100, Max = 10000, Default = 100 },
    Step = 1,
    IsTextbox = true,
    Callback = function(health)
        local char = game.Players.LocalPlayer.Character
        if char and char:FindFirstChild("Humanoid") then
            char.Humanoid.Health = health
        end
    end
})
Tabs.zho:Slider({
    Title = "设置帧率FPS",
    Desc = "",
    Value = { Min = 300, Max = 100000, Default = 300 },
    Step = 1,
    IsTextbox = true,
    Callback = function(fps)
        setfpscap(fps)
    end
})
-- 无限跳开关
Tabs.zho:Toggle({
    Title = "无限跳",
    Desc = "开启后可在空中连续跳跃",
    Value = false,
    Callback = function(state)
        isInfiniteJumpEnabled = state
    end
})
Tabs.zho:Toggle({
    Title = "人物显示",
    Desc = "",
    Value = false,
    Callback = function(enabled)
        getgenv().enabled = enabled
        getgenv().filluseteamcolor = true
        getgenv().outlineuseteamcolor = true
        getgenv().fillcolor = Color3.new(1, 0, 0)
        getgenv().outlinecolor = Color3.new(1, 1, 1)
        getgenv().filltrans = 0.5
        getgenv().outlinetrans = 0.5
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Vcsk/RobloxScripts/main/Highlight-ESP.lua"))()
    end
})
Tabs.zho:Toggle({
     Title = "自动互动",
     Desc = "",
     Value = false,
     Callback = function(enabled)
         if enabled then
             autoInteract = true
             while autoInteract do
                 for _, descendant in pairs(workspace:GetDescendants()) do
                     if descendant:IsA("ProximityPrompt") then
                         fireproximityprompt(descendant)
                     end
                 end
                 task.wait(0.25)
             end
         else
             autoInteract = false
         end
     end
 })
 Tabs.zho:Toggle({
    Title = "夜视",
    Desc = "",
    Value = false,
    Callback = function(enabled)
        spawn(function()
            while task.wait() do
                local lighting = game.Lighting
                if enabled then
                    lighting.Ambient = Color3.new(1, 1, 1)
                else
                    lighting.Ambient = Color3.new(0, 0, 0)
                end
            end
        end)
    end
})
Tabs.zho:Toggle({
    Title = "穿墙",
    Desc = "",
    Value = false,
    Callback = function(enabled)
        local workspace = game:GetService("Workspace")
        local Players = game:GetService("Players")
        if enabled then
            Clipon = true
        else
            Clipon = false
        end
        Stepped = game:GetService("RunService").Stepped:Connect(function()
            if Clipon then
                local char = workspace:FindFirstChild(Players.LocalPlayer.Name)
                if char then
                    for _, part in pairs(char:GetChildren()) do
                        if part:IsA("BasePart") then
                            part.CanCollide = false
                        end
                    end
                end
            else
                if Stepped then
                    Stepped:Disconnect()
                    Stepped = nil
                end
            end
        end)
    end
})
Tabs.zho:Toggle({
    Title = "获取所有玩家背包",
    Desc = "部分服务器没效果",
    Value = false,
    Callback = function(enabled)
        spawn(function()
            while enabled and task.wait() do
                for _, player in pairs(game.Players:GetPlayers()) do
                    for _, tool in pairs(player.Backpack:GetChildren()) do
                        tool.Parent = game.Players.LocalPlayer.Backpack
                        task.wait()
                    end
                end
            end
        end)
    end
})
-- 原有通用按妞
Tabs.zho:Button({
    Title = "获取当前道具",
    Callback = function()
        loadstring(game:HttpGet("https://pastefy.app/3FU05Dyt/raw"))()
    end
})

Tabs.zho:Button({
    Title = "装备全部道具",
    Callback = function()
        loadstring(game:HttpGet("https://pastefy.app/uBqVR9JC/raw"))()
    end
})

Tabs.zho:Button({
    Title = "删除道具",
    Callback = function()
        loadstring(game:HttpGet("https://pastefy.app/r4LHK4p0/raw"))()
    end
})

Tabs.zho:Button({
    Title = "删除所有道具",
    Callback = function()
        loadstring(game:HttpGet("https://pastefy.app/8HB71Lbj/raw"))()
    end
})
Tabs.zho:Button({
    Title = "快速互动",
    Callback = function()
        game.ProximityPromptService.PromptButtonHoldBegan:Connect(function(prompt)
            prompt.HoldDuration = 0
        end)
    end
})
Tabs.zho:Button({
    Title = "随机传送",
    Callback = function()
        loadstring(game:HttpGet("https://gist.githubusercontent.com/skid123skidlol/cd0d2dce51b3f20ad1aac941da06a1a1/raw/f58b98cce7d51e53ade94e7bb460e4f24fb7e0ff/%257BFE%257D%2520Invisible%2520Tool%2520(can%2520hold%2520tools)", true))()
    end
})
Tabs.zho:Button({
    Title = "TX翻译",
    Callback = function()
        TX = "TX Script"
Script = "全自动翻译"
loadstring(game:HttpGet("https://raw.githubusercontent.com/JsYb666/Item/refs/heads/main/Auto-language"))()
    end
})
Tabs.zho:Button({
    Title = "飞行fly",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/rodan-demirali/RobloxUI/refs/heads/main/flyUIscript"))()
    end
})
Tabs.zho:Button({
    Title = "甩飞所有人",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/zqyDSUWX"))()
    end
})
Tabs.zho:Button({
    Title = "死亡笔记1",
    Callback = function()
        loadstring(game:HttpGet([[https://raw.githubusercontent.com/xiaopi77/xiaopi77/main/1_1.txt_2024-08-08_153358.OTed.lua]]))()
    end
})
Tabs.zho:Button({
    Title = "传送至玩家身边",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Infinity2346/Tect-Menu/main/Teleport%20Gui.lua"))()
    end
})
Tabs.zho:Button({
    Title = "指令",
    Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
    end
})
Tabs.zho:Button({
    Title = "死亡笔记2",
    Callback = function()
        --Made by Hirari_Tear, credits to expro for the GUI--

local Handle = Instance.new('Part')

local Mesh = Instance.new('SpecialMesh')

local Death = Instance.new('Tool')

Death.Name = "Death Note"

Handle.Name = "Handle"

Death.Parent = game.Players.LocalPlayer.Backpack

Death.GripForward = Vector3.new(0.331, -0.766, 0.551)

Death.GripPos = Vector3.new(-0.8, 0, -0.8)

Death.GripRight = Vector3.new(-0.943, -0.297, 0.152)

Death.GripUp = Vector3.new(-0.048, 0.57, 0.82)

Death.ToolTip = "Kill your fucking rival"

Handle.Parent = Death

Mesh.Parent = Handle

Mesh.MeshId = "http://www.roblox.com/asset/?id=1136139"

Mesh.TextureId = "http://www.roblox.com/asset/?id=18276952"

Mesh.Scale = Vector3.new(0.55, 0.174, 0.6)

Handle.Rotation = Vector3.new(0,-90,0)

Death.Equipped:connect(function(mouse)

local Bounce = Enum.EasingStyle.Bounce

local Quad = Enum.EasingStyle.Quad

local Normal = Enum.EasingStyle.Linear



local ScreenGui = Instance.new("ScreenGui", game.Players["LocalPlayer"].PlayerGui)

ScreenGui.Name = "Death Note"



local open = Instance.new("ImageButton", ScreenGui)

open.Position = UDim2.new(1, -110, 1, 500)

open.Size = UDim2.new(0, 100,0, 150)

open.Image = "rbxassetid://18536731"

open:TweenPosition(UDim2.new(1, -110, 1, -150), "In", Bounce, 0.8, true)



local Note = Instance.new("Frame", ScreenGui)

Note.Active = true

Note.Position = UDim2.new(1, -321, 1, 500)

Note.Size = UDim2.new(0, 320,0, 250)

Note.Visible = false

Note.Draggable = true



open.MouseButton1Down:connect(function()

open:TweenPosition(UDim2.new(open.Position.X.Scale,open.Position.X.Offset, 1, 500), "Out", Normal, 0.8, true)

wait(0.30)

open.Visible = false

Note.Visible = true

Note.Position = UDim2.new(1, -321, 1, 500)

Note:TweenPosition(UDim2.new(1, -321, 1, -251), "In", Normal, 0.5, true)

end)



local bg = Instance.new("Frame", Note)

bg.BackgroundColor3 = Color3.fromRGB(31, 31, 31)

bg.Size = UDim2.new(0, 160,0, 250)

bg.ZIndex = 2



-- Background



local close = Instance.new("TextButton", bg)

close.BackgroundColor3 = Color3.fromRGB(0, 0, 0)

close.BackgroundTransparency = 1

close.Position = UDim2.new(0, 8,0, 10)

close.Size = UDim2.new(0, 10,0, 10)

close.ZIndex = 4

close.Font = "Cartoon"

close.Text = "X"

close.TextColor3 = Color3.fromRGB(255, 255, 255)

close.TextSize = "17"



close.MouseButton1Down:connect(function()

Note:TweenPosition(UDim2.new(Note.Position.X.Scale,Note.Position.X.Offset,1, 500), "Out", Normal, 0.5, true)

wait(0.30)

Note.Visible = false

open.Visible = true

open:TweenPosition(UDim2.new(1, -110, 1, -150), "In", Normal, 0.8, true)

end)



local image1 = Instance.new("ImageLabel", bg)

image1.BackgroundTransparency = 1

image1.Size = UDim2.new(1, 0,1, 0)

image1.ZIndex = 3

image1.Image = "rbxassetid://18528551"



local title = Instance.new("TextLabel", bg)

title.BackgroundTransparency = 1

title.Position = UDim2.new(0, 0,0, 30)

title.Size = UDim2.new(1, 0,0, 30)

title.ZIndex = 4

title.Font = "Bodoni"

title.Text = "DEATH NOTE"

title.TextColor3 = Color3.fromRGB(255, 255, 255)

title.TextSize = "18"



local body = Instance.new("TextLabel", bg)

body.BackgroundTransparency = 1

body.Position = UDim2.new(0, 15,0, 65)

body.Size = UDim2.new(0, 134,0, 40)

body.ZIndex = 4

body.Font = "Garamond"

body.Text = "Type in somebody's name to kill them."

body.TextColor3 = Color3.fromRGB(255, 255, 255)

body.TextSize = "19"

body.TextWrapped = true

body.TextXAlignment = "Left"

body.TextYAlignment = "Top"



local line = Instance.new("TextLabel", body)

line.BackgroundTransparency = 1

line.Position = UDim2.new(0, 0,0, 50)

line.Size = UDim2.new(0, 130,0, 40)

line.ZIndex = 4

line.Font = "Garamond"

line.Text = "________________"

line.TextColor3 = Color3.fromRGB(255, 255, 255)

line.TextSize = "19"

line.TextWrapped = true

line.TextXAlignment = "Left"

line.TextYAlignment = "Top"



local text = Instance.new("TextLabel", body)

text.BackgroundTransparency = 1

text.Position = UDim2.new(0, 0,0, 100)

text.Size = UDim2.new(0, 134,0, 40)

text.ZIndex = 4

text.Font = "Garamond"

text.Text = "This was made by RcDZ."

text.TextColor3 = Color3.fromRGB(255, 255, 255)

text.TextSize = "19"

text.TextWrapped = true

text.TextXAlignment = "Left"

text.TextYAlignment = "Top"



-- Page



local page = Instance.new("Frame", Note)

page.BackgroundColor3 = Color3.fromRGB(236, 236, 236)

page.Position = UDim2.new(0, 160,0, 0)

page.Size = UDim2.new(0, 160,0, 250)

page.ZIndex = 2



local list = Instance.new("TextBox", page)

list.BackgroundTransparency = 1

list.Position = UDim2.new(0, 25,0, 20)

list.Size = UDim2.new(0.8, 5,0, 230)

list.ZIndex = 4

list.Font = "Antique"

list.Text = ""

list.TextColor3 = Color3.fromRGB(0, 0, 0)

list.TextSize = "23"

list.TextWrapped = true

list.TextXAlignment = "Left"

list.TextYAlignment = "Top"



local image2 = Instance.new("ImageLabel", page)

image2.BackgroundTransparency = 1

image2.Size = UDim2.new(1, 0,1, 0)

image2.ZIndex = 3

image2.Image = "rbxassetid://170279713"

image2.Transparency = 0.2



while true do

repeat wait() until game.Workspace:FindFirstChild(list.Text)

if game.Workspace[list.Text]:FindFirstChild("Humanoid") then

game.Workspace[list.Text].Humanoid.PlatformStand = true

game.Workspace[list.Text].Humanoid.Health = 0

elseif game.Workspace[list.Text]:FindFirstChild("Zombie") then

game.Workspace[list.Text].Zombie.PlatformStand = true

game.Workspace[list.Text].Zombie.Health = 0

end

end

end)

Death.Unequipped:connect(function(mouse)

game.Players.LocalPlayer.PlayerGui["Death Note"]:remove()

end)
--12333
    end
})
Tabs.zho:Button({
    Title = "魂魄跟随",
    Callback = function()
        
    end
})
Tabs.zho:Button({
    Title = "ESP",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/wa0101/Roblox-ESP/refs/heads/main/esp.lua"))()
    end
})
Tabs.zho:Button({
    Title = "穿墙",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/sandakovandrej23-art/ROBLOXNOCLIPGUI/refs/heads/main/Noclipgui.lua"))()
    end
})
Tabs.zho:Button({
    Title = "踏空行走",
    Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/main/Float'))()
    end
})
Tabs.zho:Button({
    Title = "修改移速",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/tiger-v1/RobloxSpeedJump.GUI/refs/heads/main/SpeedJumpGUI.lua"))()
    end
})
Tabs.zho:Button({
    Title = "🔴esp🔴",
    Callback = function()
        local Workspace, RunService, Players, CoreGui, Lighting = cloneref(game:GetService("Workspace")), cloneref(game:GetService("RunService")), cloneref(game:GetService("Players")), game:GetService("CoreGui"), cloneref(game:GetService("Lighting"))

local ESP = {
    Enabled = true,
    TeamCheck = true,
    MaxDistance = 200,
    FontSize = 11,
    FadeOut = {
        OnDistance = true,
        OnDeath = false,
        OnLeave = false,
    },
    Options = { 
        Teamcheck = false, TeamcheckRGB = Color3.fromRGB(0, 255, 0),
        Friendcheck = true, FriendcheckRGB = Color3.fromRGB(0, 255, 0),
        Highlight = false, HighlightRGB = Color3.fromRGB(255, 0, 0),
    },
    Drawing = {
        Chams = {
            Enabled  = true,
            Thermal = true,
            FillRGB = Color3.fromRGB(119, 120, 255),
            Fill_Transparency = 100,
            OutlineRGB = Color3.fromRGB(119, 120, 255),
            Outline_Transparency = 100,
            VisibleCheck = true,
        },
        Names = {
            Enabled = true,
            RGB = Color3.fromRGB(255, 255, 255),
        },
        Flags = {
            Enabled = true,
        },
        Distances = {
            Enabled = true, 
            Position = "Text",
            RGB = Color3.fromRGB(255, 255, 255),
        },
        Weapons = {
            Enabled = true, WeaponTextRGB = Color3.fromRGB(119, 120, 255),
            Outlined = false,
            Gradient = false,
            GradientRGB1 = Color3.fromRGB(255, 255, 255), GradientRGB2 = Color3.fromRGB(119, 120, 255),
        },
        Healthbar = {
            Enabled = true,  
            HealthText = true, Lerp = false, HealthTextRGB = Color3.fromRGB(119, 120, 255),
            Width = 2.5,
            Gradient = true, GradientRGB1 = Color3.fromRGB(200, 0, 0), GradientRGB2 = Color3.fromRGB(60, 60, 125), GradientRGB3 = Color3.fromRGB(119, 120, 255), 
        },
        Boxes = {
            Animate = true,
            RotationSpeed = 300,
            Gradient = false, GradientRGB1 = Color3.fromRGB(119, 120, 255), GradientRGB2 = Color3.fromRGB(0, 0, 0), 
            GradientFill = true, GradientFillRGB1 = Color3.fromRGB(119, 120, 255), GradientFillRGB2 = Color3.fromRGB(0, 0, 0), 
            Filled = {
                Enabled = true,
                Transparency = 0.75,
                RGB = Color3.fromRGB(0, 0, 0),
            },
            Full = {
                Enabled = true,
                RGB = Color3.fromRGB(255, 255, 255),
            },
            Corner = {
                Enabled = true,
                RGB = Color3.fromRGB(255, 255, 255),
            },
        };
    };
    Connections = {
        RunService = RunService;
    };
    Fonts = {};
}

-- Def & Vars
local Euphoria = ESP.Connections;
local lplayer = Players.LocalPlayer;
local camera = game.Workspace.CurrentCamera;
local Cam = Workspace.CurrentCamera;
local RotationAngle, Tick = -45, tick();

-- Weapon Images
local Weapon_Icons = {
    ["Wooden Bow"] = "http://www.roblox.com/asset/?id=17677465400",
    ["Crossbow"] = "http://www.roblox.com/asset/?id=17677473017",
    ["Salvaged SMG"] = "http://www.roblox.com/asset/?id=17677463033",
    ["Salvaged AK47"] = "http://www.roblox.com/asset/?id=17677455113",
    ["Salvaged AK74u"] = "http://www.roblox.com/asset/?id=17677442346",
    ["Salvaged M14"] = "http://www.roblox.com/asset/?id=17677444642",
    ["Salvaged Python"] = "http://www.roblox.com/asset/?id=17677451737",
    ["Military PKM"] = "http://www.roblox.com/asset/?id=17677449448",
    ["Military M4A1"] = "http://www.roblox.com/asset/?id=17677479536",
    ["Bruno's M4A1"] = "http://www.roblox.com/asset/?id=17677471185",
    ["Military Barrett"] = "http://www.roblox.com/asset/?id=17677482998",
    ["Salvaged Skorpion"] = "http://www.roblox.com/asset/?id=17677459658",
    ["Salvaged Pump Action"] = "http://www.roblox.com/asset/?id=17677457186",
    ["Military AA12"] = "http://www.roblox.com/asset/?id=17677475227",
    ["Salvaged Break Action"] = "http://www.roblox.com/asset/?id=17677468751",
    ["Salvaged Pipe Rifle"] = "http://www.roblox.com/asset/?id=17677468751",
    ["Salvaged P250"] = "http://www.roblox.com/asset/?id=17677447257",
    ["Nail Gun"] = "http://www.roblox.com/asset/?id=17677484756"
};

-- Functions
local Functions = {}
do
    function Functions:Create(Class, Properties)
        local _Instance = typeof(Class) == 'string' and Instance.new(Class) or Class
        for Property, Value in pairs(Properties) do
            _Instance[Property] = Value
        end
        return _Instance;
    end
    --
    function Functions:FadeOutOnDist(element, distance)
        local transparency = math.max(0.1, 1 - (distance / ESP.MaxDistance))
        if element:IsA("TextLabel") then
            element.TextTransparency = 1 - transparency
        elseif element:IsA("ImageLabel") then
            element.ImageTransparency = 1 - transparency
        elseif element:IsA("UIStroke") then
            element.Transparency = 1 - transparency
        elseif element:IsA("Frame") and (element == Healthbar or element == BehindHealthbar) then
            element.BackgroundTransparency = 1 - transparency
        elseif element:IsA("Frame") then
            element.BackgroundTransparency = 1 - transparency
        elseif element:IsA("Highlight") then
            element.FillTransparency = 1 - transparency
            element.OutlineTransparency = 1 - transparency
        end;
    end;  
end;

do -- Initalize
    local ScreenGui = Functions:Create("ScreenGui", {
        Parent = CoreGui,
        Name = "ESPHolder",
    });

    local DupeCheck = function(plr)
        if ScreenGui:FindFirstChild(plr.Name) then
            ScreenGui[plr.Name]:Destroy()
        end
    end

    local ESP = function(plr)
        coroutine.wrap(DupeCheck)(plr) -- Dupecheck
        local Name = Functions:Create("TextLabel", {Parent = ScreenGui, Position = UDim2.new(0.5, 0, 0, -11), Size = UDim2.new(0, 100, 0, 20), AnchorPoint = Vector2.new(0.5, 0.5), BackgroundTransparency = 1, TextColor3 = Color3.fromRGB(255, 255, 255), Font = Enum.Font.Code, TextSize = ESP.FontSize, TextStrokeTransparency = 0, TextStrokeColor3 = Color3.fromRGB(0, 0, 0), RichText = true})
        local Distance = Functions:Create("TextLabel", {Parent = ScreenGui, Position = UDim2.new(0.5, 0, 0, 11), Size = UDim2.new(0, 100, 0, 20), AnchorPoint = Vector2.new(0.5, 0.5), BackgroundTransparency = 1, TextColor3 = Color3.fromRGB(255, 255, 255), Font = Enum.Font.Code, TextSize = ESP.FontSize, TextStrokeTransparency = 0, TextStrokeColor3 = Color3.fromRGB(0, 0, 0), RichText = true})
        local Weapon = Functions:Create("TextLabel", {Parent = ScreenGui, Position = UDim2.new(0.5, 0, 0, 31), Size = UDim2.new(0, 100, 0, 20), AnchorPoint = Vector2.new(0.5, 0.5), BackgroundTransparency = 1, TextColor3 = Color3.fromRGB(255, 255, 255), Font = Enum.Font.Code, TextSize = ESP.FontSize, TextStrokeTransparency = 0, TextStrokeColor3 = Color3.fromRGB(0, 0, 0), RichText = true})
        local Box = Functions:Create("Frame", {Parent = ScreenGui, BackgroundColor3 = Color3.fromRGB(0, 0, 0), BackgroundTransparency = 0.75, BorderSizePixel = 0})
        local Gradient1 = Functions:Create("UIGradient", {Parent = Box, Enabled = ESP.Drawing.Boxes.GradientFill, Color = ColorSequence.new{ColorSequenceKeypoint.new(0, ESP.Drawing.Boxes.GradientFillRGB1), ColorSequenceKeypoint.new(1, ESP.Drawing.Boxes.GradientFillRGB2)}})
        local Outline = Functions:Create("UIStroke", {Parent = Box, Enabled = ESP.Drawing.Boxes.Gradient, Transparency = 0, Color = Color3.fromRGB(255, 255, 255), LineJoinMode = Enum.LineJoinMode.Miter})
        local Gradient2 = Functions:Create("UIGradient", {Parent = Outline, Enabled = ESP.Drawing.Boxes.Gradient, Color = ColorSequence.new{ColorSequenceKeypoint.new(0, ESP.Drawing.Boxes.GradientRGB1), ColorSequenceKeypoint.new(1, ESP.Drawing.Boxes.GradientRGB2)}})
        local Healthbar = Functions:Create("Frame", {Parent = ScreenGui, BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 0})
        local BehindHealthbar = Functions:Create("Frame", {Parent = ScreenGui, ZIndex = -1, BackgroundColor3 = Color3.fromRGB(0, 0, 0), BackgroundTransparency = 0})
        local HealthbarGradient = Functions:Create("UIGradient", {Parent = Healthbar, Enabled = ESP.Drawing.Healthbar.Gradient, Rotation = -90, Color = ColorSequence.new{ColorSequenceKeypoint.new(0, ESP.Drawing.Healthbar.GradientRGB1), ColorSequenceKeypoint.new(0.5, ESP.Drawing.Healthbar.GradientRGB2), ColorSequenceKeypoint.new(1, ESP.Drawing.Healthbar.GradientRGB3)}})
        local HealthText = Functions:Create("TextLabel", {Parent = ScreenGui, Position = UDim2.new(0.5, 0, 0, 31), Size = UDim2.new(0, 100, 0, 20), AnchorPoint = Vector2.new(0.5, 0.5), BackgroundTransparency = 1, TextColor3 = Color3.fromRGB(255, 255, 255), Font = Enum.Font.Code, TextSize = ESP.FontSize, TextStrokeTransparency = 0, TextStrokeColor3 = Color3.fromRGB(0, 0, 0)})
        local Chams = Functions:Create("Highlight", {Parent = ScreenGui, FillTransparency = 1, OutlineTransparency = 0, OutlineColor = Color3.fromRGB(119, 120, 255), DepthMode = "AlwaysOnTop"})
        local WeaponIcon = Functions:Create("ImageLabel", {Parent = ScreenGui, BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Size = UDim2.new(0, 40, 0, 40)})
        local Gradient3 = Functions:Create("UIGradient", {Parent = WeaponIcon, Rotation = -90, Enabled = ESP.Drawing.Weapons.Gradient, Color = ColorSequence.new{ColorSequenceKeypoint.new(0, ESP.Drawing.Weapons.GradientRGB1), ColorSequenceKeypoint.new(1, ESP.Drawing.Weapons.GradientRGB2)}})
        local LeftTop = Functions:Create("Frame", {Parent = ScreenGui, BackgroundColor3 = ESP.Drawing.Boxes.Corner.RGB, Position = UDim2.new(0, 0, 0, 0)})
        local LeftSide = Functions:Create("Frame", {Parent = ScreenGui, BackgroundColor3 = ESP.Drawing.Boxes.Corner.RGB, Position = UDim2.new(0, 0, 0, 0)})
        local RightTop = Functions:Create("Frame", {Parent = ScreenGui, BackgroundColor3 = ESP.Drawing.Boxes.Corner.RGB, Position = UDim2.new(0, 0, 0, 0)})
        local RightSide = Functions:Create("Frame", {Parent = ScreenGui, BackgroundColor3 = ESP.Drawing.Boxes.Corner.RGB, Position = UDim2.new(0, 0, 0, 0)})
        local BottomSide = Functions:Create("Frame", {Parent = ScreenGui, BackgroundColor3 = ESP.Drawing.Boxes.Corner.RGB, Position = UDim2.new(0, 0, 0, 0)})
        local BottomDown = Functions:Create("Frame", {Parent = ScreenGui, BackgroundColor3 = ESP.Drawing.Boxes.Corner.RGB, Position = UDim2.new(0, 0, 0, 0)})
        local BottomRightSide = Functions:Create("Frame", {Parent = ScreenGui, BackgroundColor3 = ESP.Drawing.Boxes.Corner.RGB, Position = UDim2.new(0, 0, 0, 0)})
        local BottomRightDown = Functions:Create("Frame", {Parent = ScreenGui, BackgroundColor3 = ESP.Drawing.Boxes.Corner.RGB, Position = UDim2.new(0, 0, 0, 0)})
        local Flag1 = Functions:Create("TextLabel", {Parent = ScreenGui, Position = UDim2.new(1, 0, 0, 0), Size = UDim2.new(0, 100, 0, 20), AnchorPoint = Vector2.new(0.5, 0.5), BackgroundTransparency = 1, TextColor3 = Color3.fromRGB(255, 255, 255), Font = Enum.Font.Code, TextSize = ESP.FontSize, TextStrokeTransparency = 0, TextStrokeColor3 = Color3.fromRGB(0, 0, 0)})
        local Flag2 = Functions:Create("TextLabel", {Parent = ScreenGui, Position = UDim2.new(1, 0, 0, 0), Size = UDim2.new(0, 100, 0, 20), AnchorPoint = Vector2.new(0.5, 0.5), BackgroundTransparency = 1, TextColor3 = Color3.fromRGB(255, 255, 255), Font = Enum.Font.Code, TextSize = ESP.FontSize, TextStrokeTransparency = 0, TextStrokeColor3 = Color3.fromRGB(0, 0, 0)})
        --local DroppedItems = Functions:Create("TextLabel", {Parent = ScreenGui, AnchorPoint = Vector2.new(0.5, 0.5), BackgroundTransparency = 1, TextColor3 = Color3.fromRGB(255, 255, 255), Font = Enum.Font.Code, TextSize = ESP.FontSize, TextStrokeTransparency = 0, TextStrokeColor3 = Color3.fromRGB(0, 0, 0)})
        --
        local Updater = function()
            local Connection;
            local function HideESP()
                Box.Visible = false;
                Name.Visible = false;
                Distance.Visible = false;
                Weapon.Visible = false;
                Healthbar.Visible = false;
                BehindHealthbar.Visible = false;
                HealthText.Visible = false;
                WeaponIcon.Visible = false;
                LeftTop.Visible = false;
                LeftSide.Visible = false;
                BottomSide.Visible = false;
                BottomDown.Visible = false;
                RightTop.Visible = false;
                RightSide.Visible = false;
                BottomRightSide.Visible = false;
                BottomRightDown.Visible = false;
                Flag1.Visible = false;
                Chams.Enabled = false;
                Flag2.Visible = false;
                if not plr then
                    ScreenGui:Destroy();
                    Connection:Disconnect();
                end
            end
            --
            Connection = Euphoria.RunService.RenderStepped:Connect(function()
                if plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
                    local HRP = plr.Character.HumanoidRootPart
                    local Humanoid = plr.Character:WaitForChild("Humanoid");
                    local Pos, OnScreen = Cam:WorldToScreenPoint(HRP.Position)
                    local Dist = (Cam.CFrame.Position - HRP.Position).Magnitude / 3.5714285714
                    
                    if OnScreen and Dist <= ESP.MaxDistance then
                        local Size = HRP.Size.Y
                        local scaleFactor = (Size * Cam.ViewportSize.Y) / (Pos.Z * 2)
                        local w, h = 3 * scaleFactor, 4.5 * scaleFactor

                        -- Fade-out effect --
                        if ESP.FadeOut.OnDistance then
                            Functions:FadeOutOnDist(Box, Dist)
                            Functions:FadeOutOnDist(Outline, Dist)
                            Functions:FadeOutOnDist(Name, Dist)
                            Functions:FadeOutOnDist(Distance, Dist)
                            Functions:FadeOutOnDist(Weapon, Dist)
                            Functions:FadeOutOnDist(Healthbar, Dist)
                            Functions:FadeOutOnDist(BehindHealthbar, Dist)
                            Functions:FadeOutOnDist(HealthText, Dist)
                            Functions:FadeOutOnDist(WeaponIcon, Dist)
                            Functions:FadeOutOnDist(LeftTop, Dist)
                            Functions:FadeOutOnDist(LeftSide, Dist)
                            Functions:FadeOutOnDist(BottomSide, Dist)
                            Functions:FadeOutOnDist(BottomDown, Dist)
                            Functions:FadeOutOnDist(RightTop, Dist)
                            Functions:FadeOutOnDist(RightSide, Dist)
                            Functions:FadeOutOnDist(BottomRightSide, Dist)
                            Functions:FadeOutOnDist(BottomRightDown, Dist)
                            Functions:FadeOutOnDist(Chams, Dist)
                            Functions:FadeOutOnDist(Flag1, Dist)
                            Functions:FadeOutOnDist(Flag2, Dist)
                        end

                        -- Teamcheck
                        if ESP.TeamCheck and plr ~= lplayer and ((lplayer.Team ~= plr.Team and plr.Team) or (not lplayer.Team and not plr.Team)) and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") and plr.Character:FindFirstChild("Humanoid") then

                            do -- Chams
                                Chams.Adornee = plr.Character
                                Chams.Enabled = ESP.Drawing.Chams.Enabled
                                Chams.FillColor = ESP.Drawing.Chams.FillRGB
                                Chams.OutlineColor = ESP.Drawing.Chams.OutlineRGB
                                do -- Breathe
                                    if ESP.Drawing.Chams.Thermal then
                                        local breathe_effect = math.atan(math.sin(tick() * 2)) * 2 / math.pi
                                        Chams.FillTransparency = ESP.Drawing.Chams.Fill_Transparency * breathe_effect * 0.01
                                        Chams.OutlineTransparency = ESP.Drawing.Chams.Outline_Transparency * breathe_effect * 0.01
                                    end
                                end
                                if ESP.Drawing.Chams.VisibleCheck then
                                    Chams.DepthMode = "Occluded"
                                else
                                    Chams.DepthMode = "AlwaysOnTop"
                                end
                            end;

                            do -- Corner Boxes
                                LeftTop.Visible = ESP.Drawing.Boxes.Corner.Enabled
                                LeftTop.Position = UDim2.new(0, Pos.X - w / 2, 0, Pos.Y - h / 2)
                                LeftTop.Size = UDim2.new(0, w / 5, 0, 1)
                                
                                LeftSide.Visible = ESP.Drawing.Boxes.Corner.Enabled
                                LeftSide.Position = UDim2.new(0, Pos.X - w / 2, 0, Pos.Y - h / 2)
                                LeftSide.Size = UDim2.new(0, 1, 0, h / 5)
                                
                                BottomSide.Visible = ESP.Drawing.Boxes.Corner.Enabled
                                BottomSide.Position = UDim2.new(0, Pos.X - w / 2, 0, Pos.Y + h / 2)
                                BottomSide.Size = UDim2.new(0, 1, 0, h / 5)
                                BottomSide.AnchorPoint = Vector2.new(0, 5)
                                
                                BottomDown.Visible = ESP.Drawing.Boxes.Corner.Enabled
                                BottomDown.Position = UDim2.new(0, Pos.X - w / 2, 0, Pos.Y + h / 2)
                                BottomDown.Size = UDim2.new(0, w / 5, 0, 1)
                                BottomDown.AnchorPoint = Vector2.new(0, 1)
                                
                                RightTop.Visible = ESP.Drawing.Boxes.Corner.Enabled
                                RightTop.Position = UDim2.new(0, Pos.X + w / 2, 0, Pos.Y - h / 2)
                                RightTop.Size = UDim2.new(0, w / 5, 0, 1)
                                RightTop.AnchorPoint = Vector2.new(1, 0)
                                
                                RightSide.Visible = ESP.Drawing.Boxes.Corner.Enabled
                                RightSide.Position = UDim2.new(0, Pos.X + w / 2 - 1, 0, Pos.Y - h / 2)
                                RightSide.Size = UDim2.new(0, 1, 0, h / 5)
                                RightSide.AnchorPoint = Vector2.new(0, 0)
                                
                                BottomRightSide.Visible = ESP.Drawing.Boxes.Corner.Enabled
                                BottomRightSide.Position = UDim2.new(0, Pos.X + w / 2, 0, Pos.Y + h / 2)
                                BottomRightSide.Size = UDim2.new(0, 1, 0, h / 5)
                                BottomRightSide.AnchorPoint = Vector2.new(1, 1)
                                
                                BottomRightDown.Visible = ESP.Drawing.Boxes.Corner.Enabled
                                BottomRightDown.Position = UDim2.new(0, Pos.X + w / 2, 0, Pos.Y + h / 2)
                                BottomRightDown.Size = UDim2.new(0, w / 5, 0, 1)
                                BottomRightDown.AnchorPoint = Vector2.new(1, 1)                                                            
                            end

                            do -- Boxes
                                Box.Position = UDim2.new(0, Pos.X - w / 2, 0, Pos.Y - h / 2)
                                Box.Size = UDim2.new(0, w, 0, h)
                                Box.Visible = ESP.Drawing.Boxes.Full.Enabled;

                                -- Gradient
                                if ESP.Drawing.Boxes.Filled.Enabled then
                                    Box.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                                    if ESP.Drawing.Boxes.GradientFill then
                                        Box.BackgroundTransparency = ESP.Drawing.Boxes.Filled.Transparency;
                                    else
                                        Box.BackgroundTransparency = 1
                                    end
                                    Box.BorderSizePixel = 1
                                else
                                    Box.BackgroundTransparency = 1
                                end
                                -- Animation
                                RotationAngle = RotationAngle + (tick() - Tick) * ESP.Drawing.Boxes.RotationSpeed * math.cos(math.pi / 4 * tick() - math.pi / 2)
                                if ESP.Drawing.Boxes.Animate then
                                    Gradient1.Rotation = RotationAngle
                                    Gradient2.Rotation = RotationAngle
                                else
                                    Gradient1.Rotation = -45
                                    Gradient2.Rotation = -45
                                end
                                Tick = tick()
                            end

                            -- Healthbar
                            do  
                                local health = Humanoid.Health / Humanoid.MaxHealth;
                                Healthbar.Visible = ESP.Drawing.Healthbar.Enabled;
                                Healthbar.Position = UDim2.new(0, Pos.X - w / 2 - 6, 0, Pos.Y - h / 2 + h * (1 - health))  
                                Healthbar.Size = UDim2.new(0, ESP.Drawing.Healthbar.Width, 0, h * health)  
                                --
                                BehindHealthbar.Visible = ESP.Drawing.Healthbar.Enabled;
                                BehindHealthbar.Position = UDim2.new(0, Pos.X - w / 2 - 6, 0, Pos.Y - h / 2)  
                                BehindHealthbar.Size = UDim2.new(0, ESP.Drawing.Healthbar.Width, 0, h)
                                -- Health Text
                                do
                                    if ESP.Drawing.Healthbar.HealthText then
                                        local healthPercentage = math.floor(Humanoid.Health / Humanoid.MaxHealth * 100)
                                        HealthText.Position = UDim2.new(0, Pos.X - w / 2 - 6, 0, Pos.Y - h / 2 + h * (1 - healthPercentage / 100) + 3)
                                        HealthText.Text = tostring(healthPercentage)
                                        HealthText.Visible = Humanoid.Health < Humanoid.MaxHealth
                                        if ESP.Drawing.Healthbar.Lerp then
                                            local color = health >= 0.75 and Color3.fromRGB(0, 255, 0) or health >= 0.5 and Color3.fromRGB(255, 255, 0) or health >= 0.25 and Color3.fromRGB(255, 170, 0) or Color3.fromRGB(255, 0, 0)
                                            HealthText.TextColor3 = color
                                        else
                                            HealthText.TextColor3 = ESP.Drawing.Healthbar.HealthTextRGB
                                        end
                                    end                        
                                end
                            end

                            do -- Names
                                Name.Visible = ESP.Drawing.Names.Enabled
                                if ESP.Options.Friendcheck and lplayer:IsFriendsWith(plr.UserId) then
                                    Name.Text = string.format('(<font color="rgb(%d, %d, %d)">F</font>) %s', ESP.Options.FriendcheckRGB.R * 255, ESP.Options.FriendcheckRGB.G * 255, ESP.Options.FriendcheckRGB.B * 255, plr.Name)
                                else
                                    Name.Text = string.format('(<font color="rgb(%d, %d, %d)">E</font>) %s', 255, 0, 0, plr.Name)
                                end
                                Name.Position = UDim2.new(0, Pos.X, 0, Pos.Y - h / 2 - 9)
                            end
                            
                            do -- Distance
                                if ESP.Drawing.Distances.Enabled then
                                    if ESP.Drawing.Distances.Position == "Bottom" then
                                        Weapon.Position = UDim2.new(0, Pos.X, 0, Pos.Y + h / 2 + 18)
                                        WeaponIcon.Position = UDim2.new(0, Pos.X - 21, 0, Pos.Y + h / 2 + 15);
                                        Distance.Position = UDim2.new(0, Pos.X, 0, Pos.Y + h / 2 + 7)
                                        Distance.Text = string.format("%d meters", math.floor(Dist))
                                        Distance.Visible = true
                                    elseif ESP.Drawing.Distances.Position == "Text" then
                                        Weapon.Position = UDim2.new(0, Pos.X, 0, Pos.Y + h / 2 + 8)
                                        WeaponIcon.Position = UDim2.new(0, Pos.X - 21, 0, Pos.Y + h / 2 + 5);
                                        Distance.Visible = false
                                        if ESP.Options.Friendcheck and lplayer:IsFriendsWith(plr.UserId) then
                                            Name.Text = string.format('(<font color="rgb(%d, %d, %d)">F</font>) %s [%d]', ESP.Options.FriendcheckRGB.R * 255, ESP.Options.FriendcheckRGB.G * 255, ESP.Options.FriendcheckRGB.B * 255, plr.Name, math.floor(Dist))
                                        else
                                            Name.Text = string.format('(<font color="rgb(%d, %d, %d)">E</font>) %s [%d]', 255, 0, 0, plr.Name, math.floor(Dist))
                                        end
                                        Name.Visible = ESP.Drawing.Names.Enabled
                                    end
                                end
                            end

                            do -- Weapons
                                Weapon.Text = "none"
                                Weapon.Visible = ESP.Drawing.Weapons.Enabled
                            end                            
                        else
                            HideESP();
                        end
                    else
                        HideESP();
                    end
                else
                    HideESP();
                end
            end)
        end
        coroutine.wrap(Updater)();
    end
    do -- Update ESP
        for _, v in pairs(game:GetService("Players"):GetPlayers()) do
            if v.Name ~= lplayer.Name then
                coroutine.wrap(ESP)(v)
            end      
        end
        --
        game:GetService("Players").PlayerAdded:Connect(function(v)
            coroutine.wrap(ESP)(v)
        end);
    end;
end;
    end
})
Tabs.zho:Button({
    Title = "2d名片",
    Callback = function()
      if getgenv().QuantumHUD_Running then
	pcall(function()
		game:GetService("RunService"):UnbindFromRenderStep("Quantum_Stationary_Engine")
		local legacy = game:GetService("Workspace"):FindFirstChild("QUANTUM_STATIONARY_STORAGE")
		if legacy then legacy:Destroy() end
	end)
end
getgenv().QuantumHUD_Running = true

getgenv().LaunchQuantumGraphicsPipeline = function(customConfig)
	customConfig = customConfig or {}
	
	local QuantumHUD = {}
	QuantumHUD.__index = QuantumHUD

	local Players = game:GetService("Players")
	local Workspace = game:GetService("Workspace")
	local RunService = game:GetService("RunService")
	local Lighting = game:GetService("Lighting") 

	-- 默认参数
	function QuantumHUD.new()
		local self = setmetatable({}, QuantumHUD)
		
		self.Config = {
			MaxHUDs = customConfig.MaxHUDs or 5,                                       
			MaxDistance = customConfig.MaxDistance or 361,                                 
			StorageName = "QUANTUM_STATIONARY_STORAGE",
			
			BodyReflectance = customConfig.BodyReflectance or 0.15,   
			HeadReflectance = customConfig.HeadReflectance or 0.01,   
			LightBrightness = customConfig.LightBrightness or 0.45,   
			LightRange = customConfig.LightRange or 11.0,             
			OutlineTransparency = customConfig.OutlineTransparency or 0.05, 
			
			PinkGlassBg = Color3.fromRGB(255, 230, 238),      
			PinkGlassStroke = Color3.fromRGB(255, 230, 238), 
			MyCardBg = Color3.fromRGB(45, 15, 22),             
			MyCardStroke = Color3.fromRGB(45, 15, 22),       
			
			HealthBarProgressColor = Color3.fromRGB(255, 120, 160), 
			HealthBarContainerColor = Color3.fromRGB(255, 255, 255), 
			
			TextHDMain = Color3.fromRGB(255, 255, 255),        
			TextHDSub = Color3.fromRGB(255, 190, 210),         
			ShadowColor = Color3.fromRGB(20, 5, 10),           
			
			CardSize = Vector3.new(4.6, 1.75, 0.05),            
			ShoulderHeight = 1.6,                             
			EyeSeparation = 4.3,                               
			ViewAngleThreshold = 0.12,
			
			BaseStiffness = 18.5,     
			FluidDragCoeff = 0.25,    
			ParallaxIntensity = 0.35, 
			MicroVibeFreq = 8.5       
		}

		self.LocalPlayer = Players.LocalPlayer
		self.Slots = {}
		self.IsRunning = false
		self.StorageFolder = nil
		
		self.MyFluidState = { Position = Vector3.new(), Velocity = Vector3.new(), Rotation = Vector3.new() }
		self.SlotFluidStates = {}
		self.GlobalCurrentAlpha = 1.0                          
		return self
	end

	-- 物理引擎 
	function QuantumHUD:_updateFluidEngine(state, targetPos, dt)
		local displacement = state.Position - targetPos
		local distance = displacement.Magnitude
		local dynamicDamping = 0.45 + math.clamp(1 / (distance + 0.1), 0, 1.8)
		
		local springForce = -self.Config.BaseStiffness * displacement
		local baseDampingForce = -dynamicDamping * state.Velocity
		local fluidDragForce = -state.Velocity.Unit * (state.Velocity.Magnitude ^ 2) * self.Config.FluidDragCoeff
		
		if state.Velocity.Magnitude == 0 then fluidDragForce = Vector3.new() end
		local acceleration = springForce + baseDampingForce + fluidDragForce
		
		state.Velocity = state.Velocity + acceleration * dt
		state.Position = state.Position + state.Velocity * dt
		return state.Position
	end
	
	-- 视线检测 
	function QuantumHUD:_isTargetVisibleThroughCover(camera, myChar, targetChar, targetRoot)
		if not myChar or not targetChar then return false end
		
		local raycastParams = RaycastParams.new()
		local ignoreList = {myChar, targetChar}
		if self.StorageFolder then table.insert(ignoreList, self.StorageFolder) end
		raycastParams.FilterDescendantsInstances = ignoreList
		raycastParams.FilterType = Enum.RaycastFilterType.Exclude
		
		local camPos = camera.CFrame.Position
		local checkPoints = { targetRoot.Position }
		
		local head = targetChar:FindFirstChild("Head")
		if head then table.insert(checkPoints, head.Position) end
		
		local leftLeg = targetChar:FindFirstChild("Left Leg") or targetChar:FindFirstChild("LeftLowerLeg")
		if leftLeg then table.insert(checkPoints, leftLeg.Position) end
		
		local rightLeg = targetChar:FindFirstChild("Right Leg") or targetChar:FindFirstChild("RightLowerLeg")
		if rightLeg then table.insert(checkPoints, rightLeg.Position) end
		
		for _, point in ipairs(checkPoints) do
			local direction = point - camPos
			local result = Workspace:Raycast(camPos, direction, raycastParams)
			if not result then return true end
		end
		return false
	end

	-- 清理残留
	function QuantumHUD:PurgeLegacyPipelines()
		pcall(function() RunService:UnbindFromRenderStep("Quantum_Stationary_Engine") end)
		local legacy = Workspace:FindFirstChild(self.Config.StorageName)
		if legacy then pcall(function() legacy:Destroy() end) task.wait(0.02) end
	end

	-- 玻璃容器
	function QuantumHUD:_buildGlassContainer(name)
		if not self.StorageFolder then
			self.StorageFolder = Workspace:FindFirstChild(self.Config.StorageName) or Instance.new("Folder")
			self.StorageFolder.Name = self.Config.StorageName
			self.StorageFolder.Parent = Workspace
		end

		local masterPart = Instance.new("Part")
		masterPart.Name = "ST_Master_" .. name
		masterPart.Size = self.Config.CardSize
		masterPart.Transparency = 1
		masterPart.CanCollide = false; masterPart.CanTouch = false; masterPart.CanQuery = false
		masterPart.Anchored = true
		masterPart.Parent = self.StorageFolder

		local blurFilter = Instance.new("Part")
		blurFilter.Name = "GlassBlurFilter"
		blurFilter.Size = Vector3.new(self.Config.CardSize.X - 0.02, self.Config.CardSize.Y - 0.02, 0.01)
		blurFilter.Material = Enum.Material.Glass
		blurFilter.Transparency = 1 
		blurFilter.Color = self.Config.PinkGlassBg
		blurFilter.CanCollide = false; blurFilter.CanTouch = false; blurFilter.CanQuery = false
		blurFilter.Anchored = true
		blurFilter.Parent = masterPart

		return masterPart
	end

	-- 画布渲染引擎 
	function QuantumHUD:_attachUltraHDCanvas(parentPart, isLocal)
		local sGui = Instance.new("SurfaceGui")
		sGui.Name = "CanvasEngine"
		sGui.Face = Enum.NormalId.Front
		sGui.CanvasSize = Vector2.new(1380, 525)           
		sGui.PixelsPerStud = 300                             
		sGui.AlwaysOnTop = true
		sGui.LightInfluence = 0.0                          
		sGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
		sGui.Enabled = false 
		sGui.Parent = parentPart

		local canvas = Instance.new("CanvasGroup")
		canvas.Name = "AlphaGroup"
		canvas.Size = UDim2.new(1, 0, 1, 0)
		canvas.BackgroundColor3 = isLocal and self.Config.MyCardBg or self.Config.PinkGlassBg
		canvas.GroupTransparency = 1                       
		canvas.BorderSizePixel = 0
		canvas.Parent = sGui
		Instance.new("UICorner", canvas).CornerRadius = UDim.new(0, 42) 

		local stroke = Instance.new("UIStroke", canvas)
		stroke.Thickness = 6.5                                         
		stroke.Color = isLocal and self.Config.MyCardStroke or self.Config.PinkGlassStroke

		local avatar = Instance.new("ImageLabel")
		avatar.Name = "UserAvatar"
		avatar.Size = UDim2.new(0, 130, 0, 130)
		avatar.Position = UDim2.new(0, 45, 0.5, -65)
		avatar.BackgroundTransparency = 1
		avatar.Parent = canvas
		Instance.new("UICorner", avatar).CornerRadius = UDim.new(1, 0)
		
		local avStroke = Instance.new("UIStroke", avatar)
		avStroke.Thickness = 4
		avStroke.Color = stroke.Color

		local function CreateHDText(name, size, pos, color, font)
			local label = Instance.new("TextLabel")
			label.Name = name
			label.Size = UDim2.new(0.75, 0, 0.22, 0)
			label.Position = pos
			label.BackgroundTransparency = 1
			label.TextColor3 = color
			label.TextSize = size
			label.Font = font
			label.TextXAlignment = Enum.TextXAlignment.Left
			label.TextStrokeTransparency = 1
			
			local shadow = Instance.new("UIStroke", label)
			shadow.Color = self.Config.ShadowColor
			shadow.Thickness = 3.5
			shadow.LineJoinMode = Enum.LineJoinMode.Round
			label.Parent = canvas
			return label
		end

		CreateHDText("TitleLabel", 46, UDim2.new(0, 210, 0.16, 0), self.Config.TextHDMain, Enum.Font.GothamBold)
		CreateHDText("SubTagLabel", 32, UDim2.new(0, 210, 0.46, 0), self.Config.TextHDSub, Enum.Font.GothamBold)
		CreateHDText("StatusLabel", 34, UDim2.new(0, 210, 0.72, 0), self.Config.TextHDMain, Enum.Font.Code)

		if isLocal then
			local coordLabel = CreateHDText("CoordLabel", 28, UDim2.new(0, 210, 0.73, 0), self.Config.TextHDSub, Enum.Font.Code)
			coordLabel.Size = UDim2.new(0.75, 0, 0.18, 0)
			canvas.StatusLabel.Position = UDim2.new(0, 210, 0.56, 0)
			canvas.StatusLabel.TextSize = 30
			
			local hpContainer = Instance.new("Frame")
			hpContainer.Name = "HPContainer"
			hpContainer.Size = UDim2.new(0, 1120, 0, 14)
			hpContainer.Position = UDim2.new(0, 210, 0.43, 0)
			hpContainer.BackgroundColor3 = self.Config.HealthBarContainerColor
			hpContainer.BorderSizePixel = 0
			hpContainer.Parent = canvas
			Instance.new("UICorner", hpContainer).CornerRadius = UDim.new(0, 7)
			
			local hpProgress = Instance.new("Frame")
			hpProgress.Name = "HPProgress"
			hpProgress.Size = UDim2.new(1, 0, 1, 0) 
			hpProgress.BackgroundColor3 = self.Config.HealthBarProgressColor
			hpProgress.BorderSizePixel = 0
			hpProgress.Parent = hpContainer
			Instance.new("UICorner", hpProgress).CornerRadius = UDim.new(0, 7)
		end

		return canvas
	end

	-- 矩阵运算 
	function QuantumHUD:_calculateCinematicTransform(targetRoot, camera, state, gameTime, deltaTime)
		local camCF = camera.CFrame
		local baseShoulderPos = targetRoot.Position + Vector3.new(0, self.Config.ShoulderHeight, 0)
		local targetWorldPos = baseShoulderPos + (camCF.RightVector * self.Config.EyeSeparation)
		
		local slowLayer = math.sin(gameTime * 0.95) * math.cos(gameTime * 0.3) * 0.09
		local fastLayer = math.sin(gameTime * self.Config.MicroVibeFreq) * 0.006 
		local finalBobY = slowLayer + fastLayer
		local finalBobX = math.cos(gameTime * 1.1) * math.sin(gameTime * 0.4) * 0.06
		
		targetWorldPos = targetWorldPos + Vector3.new(finalBobX, finalBobY, finalBobX * 0.3)
		
		local dt = math.min(deltaTime, 0.03)
		local currentPhysicsPos = self:_updateFluidEngine(state, targetWorldPos, dt)
		
		local lookAtCF = CFrame.lookAt(currentPhysicsPos, camCF.Position, Vector3.new(0, 1, 0))
		local localTargetVec = camCF:ToObjectSpace(lookAtCF).Position.Unit
		
		local targetTiltX = -localTargetVec.Y * self.Config.ParallaxIntensity
		local targetTiltY = localTargetVec.X * self.Config.ParallaxIntensity
		state.Rotation = state.Rotation + (Vector3.new(targetTiltX, targetTiltY, 0) - state.Rotation) * 0.15
		
		return lookAtCF * CFrame.Angles(state.Rotation.X, state.Rotation.Y, math.sin(gameTime * 0.5) * 0.005)
	end

	--  视线方向计算 
	function QuantumHUD:_evaluateGlobalState(myRoot, myHum, camera)
		if myHum.MoveDirection.Magnitude > 0.01 then return 1.0 end
		local cameraToMeDirection = (camera.CFrame.Position - myRoot.Position).Unit
		local lookDirectionDot = myRoot.CFrame.LookVector:Dot(cameraToMeDirection)
		if lookDirectionDot > self.Config.ViewAngleThreshold then return 0.0 else return 1.0 end
	end

	--  主渲染管线驱动 
	function QuantumHUD:_launchPipelineLoop()
		RunService:BindToRenderStep("Quantum_Stationary_Engine", Enum.RenderPriority.Camera.Value + 1, function(dt)
			if not self.IsRunning then return end
			
			local camera = Workspace.CurrentCamera
			local myChar = self.LocalPlayer.Character
			local myRoot = myChar and myChar:FindFirstChild("HumanoidRootPart")
			local myHum = myChar and myChar:FindFirstChild("Humanoid")
			local currentTime = os.clock()
			
			if not (camera and myRoot and myHum) then return end
			
			local targetGlobalAlpha = self:_evaluateGlobalState(myRoot, myHum, camera)
			local wasHidden = (self.GlobalCurrentAlpha > 0.95)
			
			local alphaSpeed = targetGlobalAlpha == 0 and 0.09 or 0.25
			self.GlobalCurrentAlpha = self.GlobalCurrentAlpha + (targetGlobalAlpha - self.GlobalCurrentAlpha) * alphaSpeed
			
			local isGlobalVisible = self.GlobalCurrentAlpha < 0.95
			local computedBlurTransparency = 0.45 + (self.GlobalCurrentAlpha * 0.55)
			
			-- 本地驱动
			if self.My3DInstance then
				if isGlobalVisible then
					self.My3DInstance.CanvasEngine.Enabled = true
					local alphaGroup = self.My3DInstance.CanvasEngine.AlphaGroup
					alphaGroup.GroupTransparency = self.GlobalCurrentAlpha
					self.My3DInstance.GlassBlurFilter.Transparency = computedBlurTransparency
					
					local hpRatio = math.clamp(myHum.Health / myHum.MaxHealth, 0, 1)
					alphaGroup.StatusLabel.Text = "💖 状态: " .. tostring(math.floor(hpRatio * 100)) .. "%"
					alphaGroup.HPContainer.HPProgress.Size = UDim2.new(hpRatio, 0, 1, 0)
					
					local pos = myRoot.Position
					alphaGroup.CoordLabel.Text = string.format("坐标: X:%.1f / Y:%.1f / Z:%.1f", pos.X, pos.Y, pos.Z)
					
					if wasHidden then 
						local basePos = myRoot.Position + (camera.CFrame.RightVector * self.Config.EyeSeparation)
						self.MyFluidState.Position = basePos
						self.MyFluidState.Velocity = Vector3.new()
						self.MyFluidState.Rotation = Vector3.new()
					end
					
					local finalCF = self:_calculateCinematicTransform(myRoot, camera, self.MyFluidState, currentTime, dt)
					self.My3DInstance.CFrame = finalCF
					self.My3DInstance.GlassBlurFilter.CFrame = finalCF * CFrame.new(0, 0, -0.01)
				else
					self.My3DInstance.CanvasEngine.Enabled = false
					self.My3DInstance.GlassBlurFilter.Transparency = 1
				end
			end
			
			-- 目标驱动
			local targetPool = {}
			for _, player in pairs(Players:GetPlayers()) do
				if player ~= self.LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") and player.Character:FindFirstChild("Humanoid") then
					local tChar = player.Character; local tRoot = tChar.HumanoidRootPart; local tHum = tChar.Humanoid
					if tHum.Health > 0 then
						local _, inViewport = camera:WorldToScreenPoint(tRoot.Position)
						local distance = (myRoot.Position - tRoot.Position).Magnitude
						if inViewport and distance <= self.Config.MaxDistance then
							local isVisible = self:_isTargetVisibleThroughCover(camera, myChar, tChar, tRoot)
							if isVisible then
								table.insert(targetPool, {player = player, root = tRoot, hum = tHum, dist = distance, char = tChar})
							end
						end
					end
				end
			end
			table.sort(targetPool, function(a, b) return a.dist < b.dist end)
			
			for i = 1, self.Config.MaxHUDs do
				local slot = self.Slots[i]
				local data = targetPool[i]
				
				if data and isGlobalVisible then
					slot.Part.CanvasEngine.Enabled = true
					local alphaGroup = slot.Part.CanvasEngine.AlphaGroup
					alphaGroup.GroupTransparency = self.GlobalCurrentAlpha
					slot.Part.GlassBlurFilter.Transparency = computedBlurTransparency
					
					if wasHidden or not self.SlotFluidStates[i] or slot.LastTarget ~= data.player then
						local basePos = data.root.Position + (camera.CFrame.RightVector * self.Config.EyeSeparation)
						self.SlotFluidStates[i] = { Position = basePos, Velocity = Vector3.new(), Rotation = Vector3.new() }
					end
					
					local finalCF = self:_calculateCinematicTransform(data.root, camera, self.SlotFluidStates[i], currentTime, dt)
					slot.Part.CFrame = finalCF
					slot.Part.GlassBlurFilter.CFrame = finalCF * CFrame.new(0, 0, -0.01)
					
					if slot.LastTarget ~= data.player then
						slot.LastTarget = data.player
						alphaGroup.TitleLabel.Text = data.player.DisplayName
						
						local avatarUrl = "rbxthumb://type=AvatarHeadShot&id=" .. tostring(data.player.UserId) .. "&w=150&h=150"
						if alphaGroup.UserAvatar.Image ~= avatarUrl then
							alphaGroup.UserAvatar.Image = avatarUrl
						end
						
						local tool = data.char:FindFirstChildOfClass("Tool")
						alphaGroup.SubTagLabel.Text = tool and ("🌸 " .. tool.Name) or "[ UNARMED ]"
					end
					alphaGroup.StatusLabel.Text = "💢 HP: " .. tostring(math.floor(data.hum.Health)) .. " / " .. tostring(data.hum.MaxHealth)
				else
					if slot.Part then
						slot.Part.CanvasEngine.Enabled = false
						slot.Part.GlassBlurFilter.Transparency = 1
					end
					if not data then
						slot.LastTarget = nil
						self.SlotFluidStates[i] = nil
					end
				end
			end
		end)
	end

	-- 角色材质与高光
	function QuantumHUD:_applyVisualEnhancements(character)
		if not character then return end
		
		for _, item in ipairs(character:GetDescendants()) do
			if item.Name == "Quantum_Self_Highlight" or item.Name == "Quantum_Self_PointLight" then
				item:Destroy()
			end
		end

		for _, part in ipairs(character:GetDescendants()) do
			if part:IsA("MeshPart") or part:IsA("BasePart") then
				if part:IsA("MeshPart") then
					part.RenderFidelity = Enum.RenderFidelity.Precise
				end
				part.CastShadow = true
				
				pcall(function()
					if part.Material == Enum.Material.Plastic then
						part.Material = Enum.Material.SmoothPlastic
					end
					
					if part.Name == "Head" or part.Name == "Face" or part.Name:find("Face") then
						part.Reflectance = self.Config.HeadReflectance
					else
						part.Reflectance = self.Config.BodyReflectance
					end
				end)
			end
		end

		local lowerTorso = character:FindFirstChild("LowerTorso") or character:FindFirstChild("Torso")
		if lowerTorso then
			local light = Instance.new("PointLight")
			light.Name = "Quantum_Self_PointLight"
			light.Color = Color3.fromRGB(255, 245, 250) 
			light.Brightness = self.Config.LightBrightness                      
			light.Range = self.Config.LightRange                           
			light.Shadows = true                        
			light.Parent = lowerTorso
		end

		local highlight = Instance.new("Highlight")
		highlight.Name = "Quantum_Self_Highlight"
		highlight.FillColor = Color3.fromRGB(255, 255, 255)
		highlight.FillTransparency = 1.0            
		highlight.OutlineColor = Color3.fromRGB(255, 255, 255) 
		highlight.OutlineTransparency = self.Config.OutlineTransparency         
		highlight.Adornee = character
		highlight.Parent = character
	end

	-- 画质
	function QuantumHUD:_maximizeMobileGraphicsPipeline()
		pcall(function()
			settings().Rendering.QualityLevel = Enum.QualityLevel.Level21
			Lighting.Technology = Enum.Technology.Future
			Lighting.ShadowMapEnabled = true
			Lighting.GlobalShadows = true
			Lighting.EnvironmentDiffuseScale = 1.0  
			Lighting.EnvironmentSpecularScale = 1.0 
			Lighting.Ambient = Color3.fromRGB(35, 32, 38)
			Lighting.OutdoorAmbient = Color3.fromRGB(45, 42, 50)
		end)

		for _, fx in ipairs(Lighting:GetChildren()) do
			if fx.Name:find("QuantumFX_") then fx:Destroy() end
		end

		local colorCorrection = Instance.new("ColorCorrectionEffect")
		colorCorrection.Name = "QuantumFX_ColorMax"
		colorCorrection.Brightness = 0.02
		colorCorrection.Contrast = 0.20       
		colorCorrection.Saturation = 0.16     
		colorCorrection.TintColor = Color3.fromRGB(255, 252, 248) 
		colorCorrection.Parent = Lighting

		local bloom = Instance.new("BloomEffect")
		bloom.Name = "QuantumFX_BloomMax"
		bloom.Intensity = 0.95                
		bloom.Size = 32                       
		bloom.Threshold = 0.80                
		bloom.Parent = Lighting

		local sunRays = Instance.new("SunRaysEffect")
		sunRays.Name = "QuantumFX_SunRaysMax"
		sunRays.Intensity = 0.40
		sunRays.Spread = 0.92
		sunRays.Parent = Lighting

		local blur = Instance.new("BlurEffect")
		blur.Name = "QuantumFX_MotionBlurMax"
		blur.Size = 2.6
		blur.Parent = Lighting

		task.spawn(function()
			for _, desc in ipairs(Workspace:GetDescendants()) do
				if desc:IsA("BasePart") and not desc:IsDescendantOf(Players.LocalPlayer.Character) then
					pcall(function()
						if desc.Material == Enum.Material.Plastic then
							desc.Material = Enum.Material.SmoothPlastic
						end
						if desc.Reflectance < 0.05 then
							desc.Reflectance = 0.06
						end
					end)
				end
			end
		end)
	end

	-- 启动
	function QuantumHUD:Start()
		self:PurgeLegacyPipelines()
		self.IsRunning = true
		
		self:_maximizeMobileGraphicsPipeline()
		
		self.My3DInstance = self:_buildGlassContainer("LocalPlayer")
		local myCanvas = self:_attachUltraHDCanvas(self.My3DInstance, true)
		myCanvas.TitleLabel.Text = "👑 " .. self.LocalPlayer.DisplayName
		myCanvas.SubTagLabel.Text = "🌸如果没人爱着你，还有开发者爱着你(=^▽^=)"
		myCanvas.UserAvatar.Image = "rbxthumb://type=AvatarHeadShot&id=" .. tostring(self.LocalPlayer.UserId) .. "&w=150&h=150"
		
		if self.LocalPlayer.Character then
			self:_applyVisualEnhancements(self.LocalPlayer.Character)
		end

		self.LocalPlayer.CharacterAdded:Connect(function(newCharacter)
			self:_applyVisualEnhancements(newCharacter)
		end)
		
		for i = 1, self.Config.MaxHUDs do
			local part = self:_buildGlassContainer("Slot_" .. i)
			local canvas = self:_attachUltraHDCanvas(part, false)
			self.Slots[i] = {Part = part, Canvas = canvas, LastTarget = nil}
		end
		
		self:_launchPipelineLoop()
	end

	local RunInstance = QuantumHUD.new()
	RunInstance:Start()
end

-- 一些配置数值
LaunchQuantumGraphicsPipeline({
	MaxHUDs = 5,              
	MaxDistance = 360,         
	
	BodyReflectance = 0.15,    
	HeadReflectance = 0.01,    
	LightBrightness = 0.45,    
	LightRange = 11.0,         
	OutlineTransparency = 0.05 
})  
    end
})
Tabs.zho:Button({
    Title = "强制锁人",
    Callback = function()
        local Players       = game:GetService("Players")
local RunService    = game:GetService("RunService")
local Workspace     = game:GetService("Workspace")
local UserInputService = game:GetService("UserInputService")
local StarterGui    = game:GetService("StarterGui")
local TweenService  = game:GetService("TweenService")

local Camera        = Workspace.CurrentCamera
local LocalPlayer   = Players.LocalPlayer

local Enabled       = false
local LockedTarget  = nil

-- 锁定平滑度 (0~1，值越小越跟手)
local SMOOTHNESS    = 0.75
-- 锁定距离限制
local MAX_DISTANCE  = 1000
local SEARCH_DISTANCE = 55
-- 瞄准点偏移 (负值为向左偏移)
local CAMERA_LEFT_OFFSET = -1.27

local lastSearchTime = 0
local SEARCH_RATE    = 0.25

local screenGui = Instance.new("ScreenGui")
screenGui.ResetOnSpawn = false
screenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")

-- ====================== 辅助函数 ======================
local function getTargetPart(character)
    return character and character:FindFirstChild("Head")
end

local function getNeckPosition(head)
    if not head then return nil end
    local char = head.Parent
    if not char then return nil end

    local neckAtt = head:FindFirstChild("NeckAttachment")
    if not neckAtt then
        local torso = char:FindFirstChild("UpperTorso") or char:FindFirstChild("Torso")
        if torso then
            neckAtt = torso:FindFirstChild("NeckAttachment")
        end
    end

    if neckAtt and neckAtt:IsA("Attachment") then
        return neckAtt.WorldPosition
    end

    return (head.CFrame * CFrame.new(0, -0.5, 0)).Position
end

local function findClosestTarget()
    local center = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
    local closest, minDist = nil, math.huge

    local myRoot = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    if not myRoot then return nil end

    local overlapParams = OverlapParams.new()
    overlapParams.FilterDescendantsInstances = {LocalPlayer.Character}
    overlapParams.FilterType = Enum.RaycastFilterType.Exclude

    local nearbyParts = Workspace:GetPartBoundsInRadius(myRoot.Position, SEARCH_DISTANCE, overlapParams)

    local checkedModels = {}

    for _, part in ipairs(nearbyParts) do
        local char = part:FindFirstAncestorWhichIsA("Model")
        if char and not checkedModels[char] and char ~= LocalPlayer.Character then
            checkedModels[char] = true

            local hum = char:FindFirstChildOfClass("Humanoid")
            if hum and hum.Health > 0 then
                local targetPart = getTargetPart(char)
                if targetPart then
                    local neckPos = getNeckPosition(targetPart)
                    if neckPos then
                        local screenPos, onScreen = Camera:WorldToViewportPoint(neckPos)
                        if onScreen then
                            local dist = (Vector2.new(screenPos.X, screenPos.Y) - center).Magnitude
                            if dist < minDist then
                                minDist = dist
                                closest = targetPart
                            end
                        end
                    end
                end
            end
        end
    end
    return closest
end

local function isValidTarget(targetPart)
    if not targetPart then return false end
    local char = targetPart.Parent
    if not char or not char:IsA("Model") then return false end

    local hum = char:FindFirstChildOfClass("Humanoid")
    if not hum or hum.Health <= 0 then return false end
    if char == LocalPlayer.Character then return false end

    local myRoot = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    if myRoot then
        local neckPos = getNeckPosition(targetPart)
        if neckPos and (neckPos - myRoot.Position).Magnitude > MAX_DISTANCE then
            return false
        end
    end
    return true
end

local function forceInstantReset()
    local char = LocalPlayer.Character
    if char and char:FindFirstChild("Humanoid") then
        Camera.CameraType = Enum.CameraType.Fixed
        Camera.CameraSubject = char.Humanoid
        Camera.CameraType = Enum.CameraType.Custom
    end
end

-- ====================== UI组件 ======================
local toggleBtn
local billboard

local function createUI()
    -- 悬浮开关按钮
    toggleBtn = Instance.new("ImageButton")
    toggleBtn.Size = UDim2.new(0, 85, 0, 85)
    toggleBtn.Position = UDim2.new(1, -95, 0, 10)
    toggleBtn.BackgroundTransparency = 1
    toggleBtn.Image = "rbxassetid://110432273832755"   -- 默认状态图标
    toggleBtn.ScaleType = Enum.ScaleType.Fit
    toggleBtn.Parent = screenGui

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(1, 0)
    corner.Parent = toggleBtn

    -- 锁定指示器 (Billboard)
    billboard = Instance.new("BillboardGui")
    billboard.Name = "锁定指示器"
    billboard.StudsOffset = Vector3.new(0, 2, 0)
    billboard.AlwaysOnTop = true
    billboard.LightInfluence = 0
    billboard.Enabled = false
    billboard.Size = UDim2.new(0, 60, 0, 60)
    billboard.Parent = screenGui

    local indImage = Instance.new("ImageLabel")
    indImage.Size = UDim2.new(1, 0, 1, 0)
    indImage.BackgroundTransparency = 1
    indImage.Image = "rbxassetid://100230908593841"   -- 环形指示器
    indImage.ImageColor3 = Color3.fromRGB(0, 255, 255)
    indImage.Parent = billboard

    local indCorner = Instance.new("UICorner")
    indCorner.CornerRadius = UDim.new(1, 0)
    indCorner.Parent = indImage

    -- 拖动按钮逻辑
    local dragging, dragStart, startPos

    toggleBtn.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = toggleBtn.Position
        end
    end)

    toggleBtn.InputChanged:Connect(function(input)
        if dragging and (input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseMovement) then
            local delta = input.Position - dragStart
            toggleBtn.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end)

    toggleBtn.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)

    -- 锁定开关函数
    local function toggleEnabled()
        Enabled = not Enabled
        if Enabled then
            LockedTarget = findClosestTarget()
            StarterGui:SetCore("SendNotification", {
                Title = "锁定系统",
                Text = "已开启锁定",
                Icon = "rbxassetid://82817965256191",
                Duration = 2
            })
        else
            LockedTarget = nil
            forceInstantReset()
            if billboard then
                billboard.Enabled = false
            end
            StarterGui:SetCore("SendNotification", {
                Title = "锁定系统",
                Text = "已关闭锁定",
                Icon = "rbxassetid://82817965256191",
                Duration = 2
            })
        end
        -- 切换按钮图标 (这里简单用透明度变化代表开关状态)
        toggleBtn.ImageTransparency = Enabled and 0 or 0.5
    end

    toggleBtn.MouseButton1Click:Connect(toggleEnabled)

    -- 键盘按 L 键开关
    UserInputService.InputBegan:Connect(function(input)
        if input.KeyCode == Enum.KeyCode.L then
            toggleEnabled()
        end
    end)
end

-- ====================== 初始化 ======================
createUI()

-- 角色重生时重置相机
local function onCharacterAdded(character)
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    if humanoid then
        humanoid.Died:Connect(function()
            Enabled = false
            LockedTarget = nil
            forceInstantReset()
            if billboard then billboard.Enabled = false end
            toggleBtn.ImageTransparency = 0.5
        end)
    end
end

if LocalPlayer.Character then onCharacterAdded(LocalPlayer.Character) end
LocalPlayer.CharacterAdded:Connect(onCharacterAdded)

-- ====================== 主循环 ======================
RunService.RenderStepped:Connect(function()
    if not Enabled then
        if billboard then billboard.Enabled = false end
        return
    end

    -- 更新目标
    local now = tick()
    if now - lastSearchTime > SEARCH_RATE then
        if not isValidTarget(LockedTarget) then
            LockedTarget = findClosestTarget()
        end
        lastSearchTime = now
    end

    -- 相机锁定
    if LockedTarget and LockedTarget.Parent then
        -- 重置相机类型
        local char = LocalPlayer.Character
        if char and char:FindFirstChild("Humanoid") then
            Camera.CameraType = Enum.CameraType.Fixed
            Camera.CameraSubject = char.Humanoid
            Camera.CameraType = Enum.CameraType.Custom
        end

        -- 计算锁定位置 (颈部位置 + 偏移)
        local targetPos = getNeckPosition(LockedTarget)
        if targetPos then
            local rightVec = Camera.CFrame.RightVector
            local finalPos = targetPos - (rightVec * CAMERA_LEFT_OFFSET)
            local targetCFrame = CFrame.new(Camera.CFrame.Position, finalPos)
            -- 平滑跟随
            Camera.CFrame = Camera.CFrame:Lerp(targetCFrame, SMOOTHNESS)
        end

        -- 更新指示器
        local charTarget = LockedTarget.Parent
        local adorneePart = charTarget:FindFirstChild("UpperTorso") or charTarget:FindFirstChild("Torso") or charTarget:FindFirstChild("HumanoidRootPart")
        if adorneePart then
            billboard.Adornee = adorneePart
            billboard.Enabled = true
            -- 动态调整指示器大小
            local distance = (Camera.CFrame.Position - adorneePart.Position).Magnitude
            local scale = math.clamp(1400 / (distance + 8), 1.5, 8)
            billboard.Size = UDim2.new(0, scale * 10, 0, scale * 10)
        else
            billboard.Enabled = false
        end
    else
        if billboard then billboard.Enabled = false end
    end
end)
    end
})

--=======fe====================
Tabs.fe:Paragraph({
    Title = "🔞动作fe🔞:",
    Desc = "备注",
    Image = "https://play-lh.googleusercontent.com/7cIIPlWm4m7AGqVpEsIfyL-HW4cQla4ucXnfalMft1TMIYQIlf2vqgmthlZgbNAQoaQ",
    ImageSize = 20,
    ThumbnailSize = 120
})
Tabs.fe:Button({
  Title = "feSussHub",
  Callback = function()
    -- FE SussyHub Made by Nil <3
    -- Mizt Source by Melon <3
    loadstring(game:HttpGet(('https://gist.githubusercontent.com/Nilrogram/8b0c8bd710be142f383c71f79279752c/raw/e4fb01a7de7cd498bb53270d2ad191dfab268a88/FE%2520SussyHub'),true))();
  end
})
Tabs.fe:Button({
    Title = "FE无需本体死亡甩飞",
    Callback = function()
        loadstring(game:HttpGet('https://gist.githubusercontent.com/axelinharlem182/1ee425c9d850af697f8c3cb108a9d816/raw/c4660b01faf4db266e8031e310121a65836f98a7/The%20Villain',true))()
    end
})
Tabs.fe:Button({
    Title = "格斗",
    Callback = function()
        loadstring(game:HttpGet("https://github.com/Sinister-Scripts/Roblox-Exploits/raw/refs/heads/main/FE-Fighter-Cracked"))()
    end
})
Tabs.fe:Button({
    Title = "r6动作",
    Callback = function()
        loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-R6-Animations-Menu-By-Me-19427"))()
    end
})
Tabs.fe:Button({
    Title = "猫动作脚本",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/Y1MkBRn3"))()
    end
})
Tabs.fe:Button({
    Title = "撸关r6",
    Callback = function()
        loadstring(game:HttpGet("https://pastefy.app/wa3v2Vgm/raw"))()
    end
})
Tabs.fe:Button({
    Title = "撸关r15",
    Callback = function()
        loadstring(game:HttpGet("https://pastefy.app/YZoglOyJ/raw"))()
    end
})
Tabs.fe:Button({
    Title = "R15无头",
    Callback = function()
        loadstring(game:HttpGet(("https://raw.githubusercontent.com/ke9460394-dot/ugik/refs/heads/main/假无头.lua"),true))()
    end
})
Tabs.fe:Button({
    Title = "R6无头",
    Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/Gazer-Ha/Valiant-Ui-Lib-Gazed-/refs/heads/main/Head%20Pack'))()
    end
})
Tabs.fe:Button({
    Title = "FE蛇",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/randomstring0/qwertys/refs/heads/main/qwerty5.lua"))()
    end
})
Tabs.fe:Button({
    Title = "FE隐形",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/vP6CrQJj"))()
    end
})
Tabs.fe:Button({
    Title = "FE超光速和超级跳跃",
    Callback = function()
        loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Fake-lag-41217"))()
    end
})
Tabs.fe:Button({
    Title = "祖国人",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/giobolqv1/homelander-by-GioBolqv1-/refs/heads/main/homelander.lua"))()
    end
})
Tabs.fe:Button({
    Title = "FE爬行",
    Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/0Ben1/fe/main/obf_vZDX8j5ggfAf58QhdJ59BVEmF6nmZgq4Mcjt2l8wn16CiStIW2P6EkNc605qv9K4.lua.txt'))()
    end
})
Tabs.fe:Button({
    Title = "将军飞踢",
    Callback = function()
        loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Fe-DropKick-Script-165813"))()
    end
})

-- ======瞄准===== --
Tabs.bot:Paragraph({
    Title = "瞄准:",
    Desc = "瞄准╳",
    Image = "https://play-lh.googleusercontent.com/7cIIPlWm4m7AGqVpEsIfyL-HW4cQla4ucXnfalMft1TMIYQIlf2vqgmthlZgbNAQoaQ",
    ImageSize = 20,
    ThumbnailSize = 120
})
Tabs.bot:Button({
    Title = "瞄准1好用",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/kesicihub/Universal-Aim-Esp-/refs/heads/main/universalaimesp.lua"))()
    end
})
Tabs.bot:Button({
    Title = "瞄准2好用",
    Callback = function()
        --Cool Aimbot

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local CoreGui = game:GetService("CoreGui")
local UserInputService = game:GetService("UserInputService")
local Teams = game:GetService("Teams")

local camera = workspace.CurrentCamera
local lp = Players.LocalPlayer

local isDraggingGUI = false
local config = {
    enabled = true, 
    radius = 90, 
    smoothness = 0.18, 
    modeName = "SOFT",
    rangeName = "SMALL",
    targetPart = "Head", 
    showBoxes = true, 
    boxThickness = 2,
    predict = true, 
    predictIntensity = 0.16,
    teamSettings = {} 
}

local theme = {
    background = Color3.fromRGB(25, 25, 25),
    accent = Color3.fromRGB(35, 35, 35),
    text = Color3.fromRGB(255, 255, 255),
    offensive = Color3.fromRGB(200, 50, 50),
    safe = Color3.fromRGB(50, 200, 50),
    button = Color3.fromRGB(40, 40, 40),
    handle = Color3.fromRGB(100, 100, 100, 150)
}

local function makeDraggable(frame, handle)
    local dragging, dragStart, startPos
    handle.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            isDraggingGUI = true
            dragStart = input.Position
            startPos = frame.Position
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                    isDraggingGUI = false
                end
            end)
        end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            local delta = input.Position - dragStart
            frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end)
end

local sg = Instance.new("ScreenGui", CoreGui)
sg.Name = "CoolAimbotUI"
sg.IgnoreGuiInset = true

local dot = Instance.new("Frame", sg)
dot.Size = UDim2.new(0, 4, 0, 4)
dot.AnchorPoint = Vector2.new(0.5, 0.5)
dot.Position = UDim2.new(0.5, 0, 0.5, 0)
dot.BackgroundColor3 = Color3.new(1, 1, 1)
dot.BorderSizePixel = 0
Instance.new("UICorner", dot)

local mainFrame = Instance.new("Frame", sg)
mainFrame.Size = UDim2.new(0, 150, 0, 35)
mainFrame.Position = UDim2.new(0, 20, 0, 120)
mainFrame.BackgroundTransparency = 1

local btnToggle = Instance.new("TextButton", mainFrame)
btnToggle.Size = UDim2.new(0, 100, 1, 0)
btnToggle.BackgroundColor3 = theme.button
btnToggle.Text = "AIM: ON"
btnToggle.TextColor3 = Color3.new(0, 1, 0)
btnToggle.Font = Enum.Font.GothamBold
btnToggle.BorderSizePixel = 0
Instance.new("UICorner", btnToggle)

local btnSettings = Instance.new("TextButton", mainFrame)
btnSettings.Size = UDim2.new(0, 40, 1, 0)
btnSettings.Position = UDim2.new(0, 105, 0, 0)
btnSettings.BackgroundColor3 = theme.accent
btnSettings.Text = "⚙️"
btnSettings.BorderSizePixel = 0
Instance.new("UICorner", btnSettings)

-- MENÚ ANCHO (WIDTH)
local menu = Instance.new("Frame", sg)
menu.Size = UDim2.new(0, 340, 0, 180) -- Más ancho, menos largo
menu.Position = UDim2.new(0.5, -170, 0.4, -90)
menu.BackgroundColor3 = theme.background
menu.Visible = false
menu.BorderSizePixel = 0
Instance.new("UICorner", menu)

local menuHandle = Instance.new("Frame", menu)
menuHandle.Size = UDim2.new(1, 0, 0, 25)
menuHandle.BackgroundColor3 = theme.handle
menuHandle.BackgroundTransparency = 0.5
Instance.new("UICorner", menuHandle)
makeDraggable(menu, menuHandle)

-- Contenedor de botones en cuadrícula
local container = Instance.new("Frame", menu)
container.Size = UDim2.new(1, -20, 1, -40)
container.Position = UDim2.new(0, 10, 0, 35)
container.BackgroundTransparency = 1

local grid = Instance.new("UIGridLayout", container)
grid.CellSize = UDim2.new(0, 155, 0, 35)
grid.CellPadding = UDim2.new(0, 10, 0, 10)
grid.HorizontalAlignment = Enum.HorizontalAlignment.Center

-- Ventana de Equipos
local teamWindow = Instance.new("Frame", sg)
teamWindow.Size = UDim2.new(0, 200, 0, 230)
teamWindow.Position = UDim2.new(0.5, 180, 0.4, -115)
teamWindow.BackgroundColor3 = theme.background
teamWindow.Visible = false
teamWindow.BorderSizePixel = 0
Instance.new("UICorner", teamWindow)

local teamHandle = Instance.new("Frame", teamWindow)
teamHandle.Size = UDim2.new(1, 0, 0, 20)
teamHandle.BackgroundColor3 = theme.handle
teamHandle.BackgroundTransparency = 0.5
Instance.new("UICorner", teamHandle)
makeDraggable(teamWindow, teamHandle)

local teamScroll = Instance.new("ScrollingFrame", teamWindow)
teamScroll.Size = UDim2.new(1, -10, 1, -85)
teamScroll.Position = UDim2.new(0, 5, 0, 25)
teamScroll.BackgroundTransparency = 1
teamScroll.BorderSizePixel = 0
Instance.new("UIListLayout", teamScroll).Padding = UDim.new(0, 5)

local closeTeams = Instance.new("TextButton", teamWindow)
closeTeams.Size = UDim2.new(1, -20, 0, 30)
closeTeams.Position = UDim2.new(0, 10, 1, -40)
closeTeams.BackgroundColor3 = Color3.fromRGB(100, 30, 30)
closeTeams.Text = "CLOSE TEAMS"
closeTeams.TextColor3 = theme.text
closeTeams.BorderSizePixel = 0
Instance.new("UICorner", closeTeams)
closeTeams.MouseButton1Click:Connect(function() teamWindow.Visible = false end)

local function isEnemy(p)
    if not p or p == lp or not p.Character then return false end
    local t = Teams:GetTeams()
    if #t <= 1 then return true end
    if #t == 2 then return p.Team ~= lp.Team end
    if #t >= 3 then
        if p.Team == lp.Team then return false end
        return config.teamSettings[p.Team.Name] ~= "Safe"
    end
    return true
end

local function createOpt(txt, parent, cb)
    local b = Instance.new("TextButton", parent)
    b.Size = UDim2.new(0, 150, 0, 35); b.BackgroundColor3 = theme.button
    b.Text = txt; b.TextColor3 = theme.text; b.Font = Enum.Font.Gotham; b.TextSize = 12
    b.BorderSizePixel = 0; Instance.new("UICorner", b)
    b.MouseButton1Click:Connect(function() cb(b) end)
    return b
end

-- Botones organizados
createOpt("MODE: SOFT", container, function(b)
    if config.modeName == "SOFT" then
        config.smoothness, config.modeName = 0.4, "🟧"
        b.TextColor3 = Color3.fromRGB(255, 200, 50)
    elseif config.modeName == "🟧" then
        config.smoothness, config.modeName = 1.0, "🟥"
        b.TextColor3 = Color3.fromRGB(255, 50, 50)
    else
        config.smoothness, config.modeName = 0.18, "SOFT"
        b.TextColor3 = theme.text
    end
    b.Text = "MODE: " .. config.modeName
end)

createOpt("RANGE: SMALL", container, function(b)
    if config.rangeName == "SMALL" then
        config.radius, config.rangeName = 200, "MEDIUM"
        b.TextColor3 = Color3.fromRGB(50, 200, 255)
    elseif config.rangeName == "MEDIUM" then
        config.radius, config.rangeName = 600, "STRONG"
        b.TextColor3 = Color3.fromRGB(150, 50, 255)
    else
        config.radius, config.rangeName = 90, "SMALL"
        b.TextColor3 = theme.text
    end
    b.Text = "RANGE: " .. config.rangeName
end)

createOpt("TARGET: HEAD", container, function(b)
    config.targetPart = (config.targetPart == "Head") and "HumanoidRootPart" or "Head"
    b.Text = "TARGET: " .. (config.targetPart == "Head" and "HEAD" or "TORSO")
end)

createOpt("ESP: ON", container, function(b)
    config.showBoxes = not config.showBoxes
    b.Text = "ESP: " .. (config.showBoxes and "ON" or "OFF")
end)

createOpt("PREDICT: ON", container, function(b)
    config.predict = not config.predict
    b.Text = "PREDICT: " .. (config.predict and "ON" or "OFF")
end)

local btnTeams = createOpt("TEAM MANAGER", container, function() teamWindow.Visible = true end)
btnTeams.Visible = false

createOpt("CLOSE MENU", container, function() menu.Visible = false; teamWindow.Visible = false end).BackgroundColor3 = Color3.fromRGB(100,30,30)

-- Logica ESP y Aimbot
local espCache = {}
local function updateESP()
    for _, p in pairs(Players:GetPlayers()) do
        local char = p.Character
        local root = char and char:FindFirstChild("HumanoidRootPart")
        if isEnemy(p) and root and char.Humanoid.Health > 0 and config.showBoxes then
            local pos, oS = camera:WorldToViewportPoint(root.Position)
            if oS then
                local b = espCache[p]
                if not b then
                    b = Instance.new("Frame", sg); b.BackgroundTransparency = 1; b.BorderSizePixel = 0
                    for i=1,4 do local line = Instance.new("Frame", b); line.BackgroundColor3 = Color3.new(1,0,0); line.BorderSizePixel = 0 end
                    espCache[p] = b
                end
                local h = math.abs(camera:WorldToViewportPoint(char.Head.Position + Vector3.new(0, 0.5, 0)).Y - camera:WorldToViewportPoint(root.Position - Vector3.new(0, 3, 0)).Y)
                b.Visible, b.Size, b.Position = true, UDim2.new(0, h*0.6, 0, h), UDim2.new(0, pos.X - (h*0.6)/2, 0, pos.Y - h/2)
                local l = b:GetChildren(); l[1].Size, l[1].Position = UDim2.new(1,0,0,config.boxThickness), UDim2.new(0,0,0,0); l[2].Size, l[2].Position = UDim2.new(1,0,0,config.boxThickness), UDim2.new(0,0,1,-config.boxThickness); l[3].Size, l[3].Position = UDim2.new(0,config.boxThickness,1,0), UDim2.new(0,0,0,0); l[4].Size, l[4].Position = UDim2.new(0,config.boxThickness,1,0), UDim2.new(1,-config.boxThickness,0,0)
            else if espCache[p] then espCache[p].Visible = false end end
        else if espCache[p] then espCache[p].Visible = false end end
    end
end

local function checkWall(part)
    local rP = RaycastParams.new()
    rP.FilterDescendantsInstances = {lp.Character, camera, sg}; rP.FilterType = Enum.RaycastFilterType.Blacklist
    local res = workspace:Raycast(camera.CFrame.Position, (part.Position - camera.CFrame.Position).Unit * 500, rP)
    return (res and res.Instance:IsDescendantOf(part.Parent))
end

local function getBestTarget()
    local target, sD = nil, config.radius
    local center = Vector2.new(camera.ViewportSize.X / 2, camera.ViewportSize.Y / 2)
    for _, p in pairs(Players:GetPlayers()) do
        if isEnemy(p) and p.Character and p.Character.Humanoid.Health > 0 then
            local part = p.Character:FindFirstChild(config.targetPart)
            if part then
                local pos, oS = camera:WorldToViewportPoint(part.Position)
                if oS then
                    local d = (Vector2.new(pos.X, pos.Y) - center).Magnitude
                    if d < sD and checkWall(part) then target, sD = part, d end
                end
            end
        end
    end
    return target
end

task.spawn(function()
    while task.wait(1) do
        local tList = Teams:GetTeams()
        if #tList >= 3 then
            btnTeams.Visible = true
            for _, t in pairs(tList) do
                if t ~= lp.Team and not config.teamSettings[t.Name] then
                    config.teamSettings[t.Name] = "Offensive"
                    local tb = Instance.new("TextButton", teamScroll)
                    tb.Size = UDim2.new(1,0,0,30); tb.Text = t.Name..": OFFENSIVE"; tb.BackgroundColor3 = theme.offensive; tb.BorderSizePixel = 0; Instance.new("UICorner", tb)
                    tb.MouseButton1Click:Connect(function()
                        config.teamSettings[t.Name] = (config.teamSettings[t.Name] == "Offensive") and "Safe" or "Offensive"
                        tb.BackgroundColor3 = (config.teamSettings[t.Name] == "Offensive") and theme.offensive or theme.safe
                        tb.Text = t.Name..": "..config.teamSettings[t.Name]:upper()
                    end)
                end
            end
        else btnTeams.Visible = false end
    end
end)

Players.PlayerRemoving:Connect(function(p) if espCache[p] then espCache[p]:Destroy(); espCache[p] = nil end end)

RunService:BindToRenderStep("AimbotUpdate", Enum.RenderPriority.Camera.Value + 1, function()
    updateESP()
    if config.enabled and not isDraggingGUI then
        local t = getBestTarget()
        if t then
            local pPos = t.Position + (config.predict and (t.Velocity * config.predictIntensity * ((t.Position - camera.CFrame.Position).Magnitude / 100)) or Vector3.new(0,0,0))
            camera.CFrame = camera.CFrame:Lerp(CFrame.lookAt(camera.CFrame.Position, pPos), config.smoothness)
        end
    end
end)

btnSettings.MouseButton1Click:Connect(function() menu.Visible = not menu.Visible end)
btnToggle.MouseButton1Click:Connect(function() 
    config.enabled = not config.enabled
    btnToggle.Text = config.enabled and "AIM: ON" or "AIM: OFF"; btnToggle.TextColor3 = config.enabled and Color3.new(0,1,0) or Color3.new(1,0,0); dot.Visible = config.enabled
end)
    end
})
Tabs.bot:Button({
    Title = "静默瞄准通用",
    Callback = function()
        local SilentAimSettings = {
    Enabled = false,
    ClassName = "Universal Silent Aim",
    ToggleKey = "RightAlt",
    TeamCheck = false,
    VisibleCheck = false,
    TargetPart = "HumanoidRootPart",
    SilentAimMethod = "Raycast",
    FOVRadius = 130,
    FOVVisible = true,
    ShowSilentAimTarget = false,
    MouseHitPrediction = false,
    MouseHitPredictionAmount = 0.165,
    HitChance = 100,
    HeadshotChanceEnabled = false,
    HeadshotChance = 0,
    FixedFOV = true,
    TargetIndicatorRadius = 20,
    CrosshairLength = 30,
    CrosshairGap = 5,
    IndicatorRotationEnabled = false,
    IndicatorRotationSpeed = 1,
    IndicatorRainbowEnabled = false,
    IndicatorRainbowSpeed = 1,
    MaxDistance = 500,
    PriorityMode = "准星最近",
    TargetInfoStyle = "面板",
    ShowTargetName = true,
    ShowTargetHealth = true,
    ShowTargetDistance = true,
    ShowTargetCategory = false,
    ShowDamageNotifier = false,
    HighlightEnabled = false,
    HighlightRainbowEnabled = false,
    HighlightColor = Color3.fromRGB(255, 255, 0),
    IndependentPanelPosition = "200,200",
    IndependentPanelPinned = false,
    LeakAndHitMode = false,
    Wallbang = false,
    EnableNameTargeting = false,
    WhitelistedNames = {},
    BlacklistedNames = {},
    ShowTracer = false,
    Tracer_Y_Offset = 0,
    WhitelistPath = {},
    IndicatorBreathingEnabled = true,
    IndicatorBreathingSpeed = 1,
    IndicatorBreathingMin = 0.8,
    IndicatorBreathingMax = 1.2,
    ThreeLineCrosshairEnabled = true,
    ThreeLineCrosshairLength = 30,
    ThreeLineCrosshairGap = 5
}

getgenv().SilentAimSettings = SilentAimSettings
local MainFileName = "UniversalSilentAim"

local Camera = workspace.CurrentCamera
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local GuiService = game:GetService("GuiService")
local UserInputService = game:GetService("UserInputService")
local HttpService = game:GetService("HttpService")
local Debris = game:GetService("Debris")
local CoreGui = game:GetService("CoreGui")
local PathfindingService = game:GetService("PathfindingService")

local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()

local GetPlayers = Players.GetPlayers
local WorldToViewportPoint = Camera.WorldToViewportPoint
local FindFirstChild = game.FindFirstChild
local RenderStepped = RunService.RenderStepped
local GetMouseLocation = UserInputService.GetMouseLocation

local resume = coroutine.resume
local create = coroutine.create

local ValidTargetParts = {"Head", "HumanoidRootPart"}
local PredictionAmount = 0.165

local currentTargetPart = nil
local currentHighlight = nil
local currentRotationAngle = 0
local currentIndicatorHue = 0
local npcList = {}
local targetMap = {}
local avatarCache = {}
local recentShots = {}
local pendingDamage = {}

local lockedTargetObject = nil

local target_indicator_circle = Drawing.new("Circle")
target_indicator_circle.Visible = false; target_indicator_circle.ZIndex = 1000; target_indicator_circle.Thickness = 2; target_indicator_circle.Filled = false
local target_indicator_lines = {}
for i = 1, 5 do local line = Drawing.new("Line"); line.Visible = false; line.ZIndex = 1000; line.Thickness = 2; table.insert(target_indicator_lines, line) end
local tracer_line = Drawing.new("Line")
tracer_line.Visible = false; tracer_line.ZIndex = 998; tracer_line.Color = Color3.fromRGB(255, 255, 0); tracer_line.Thickness = 1; tracer_line.Transparency = 1

local overhead_info_texts = {
    Name = Drawing.new("Text"),
    Health = Drawing.new("Text"),
    Distance = Drawing.new("Text"),
    Category = Drawing.new("Text")
}
for _, text in pairs(overhead_info_texts) do
    text.Visible = false; text.ZIndex = 1001; text.Font = Drawing.Fonts.Plex; text.Size = 14; text.Color = Color3.fromRGB(255, 255, 255); text.Center = true; text.Outline = true
end

local panel_info_bg = Drawing.new("Square")
panel_info_bg.Visible = false; panel_info_bg.ZIndex = 1002; panel_info_bg.Color = Color3.fromRGB(0, 0, 0); panel_info_bg.Thickness = 0; panel_info_bg.Filled = true; panel_info_bg.Transparency = 0.5
local panel_info_texts = {
    Name = Drawing.new("Text"),
    Health = Drawing.new("Text"),
    Distance = Drawing.new("Text"),
    Category = Drawing.new("Text")
}
for _, text in pairs(panel_info_texts) do
    text.Visible = false; text.ZIndex = 1003; text.Font = Drawing.Fonts.Plex; text.Size = 14; text.Color = Color3.fromRGB(255, 255, 255); text.Center = false; text.Outline = true
end

local FOVCircleGui = Instance.new("ScreenGui", LocalPlayer:WaitForChild("PlayerGui"))
FOVCircleGui.Name = "FOVCircleGui"; FOVCircleGui.ResetOnSpawn = false; FOVCircleGui.IgnoreGuiInset = true; FOVCircleGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
local FOVCircleFrame = Instance.new("Frame", FOVCircleGui)
FOVCircleFrame.Name = "FOVCircleFrame"; FOVCircleFrame.AnchorPoint = Vector2.new(0.5, 0.5); FOVCircleFrame.Position = UDim2.fromScale(0.5, 0.5); FOVCircleFrame.BackgroundTransparency = 1
local FOVStroke = Instance.new("UIStroke", FOVCircleFrame)
FOVStroke.Name = "FOVStroke"; FOVStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border; FOVStroke.Thickness = 1; FOVStroke.Transparency = 0.5
local FOVCorner = Instance.new("UICorner", FOVCircleFrame)
FOVCorner.Name = "FOVCorner"; FOVCorner.CornerRadius = UDim.new(1, 0)

local IndependentPanelGui = Instance.new("ScreenGui", LocalPlayer:WaitForChild("PlayerGui"))
IndependentPanelGui.Name = "IndependentPanelGui"; IndependentPanelGui.ResetOnSpawn = false; IndependentPanelGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
local IndependentPanelFrame = Instance.new("Frame", IndependentPanelGui)
IndependentPanelFrame.Name = "PanelFrame"; IndependentPanelFrame.Size = UDim2.fromOffset(160, 100);
IndependentPanelFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30); IndependentPanelFrame.BackgroundTransparency = 0.3; IndependentPanelFrame.BorderSizePixel = 1; IndependentPanelFrame.BorderColor3 = Color3.new(1,1,1)
IndependentPanelFrame.Visible = false; IndependentPanelFrame.Active = true
local IPCorner = Instance.new("UICorner", IndependentPanelFrame); IPCorner.CornerRadius = UDim.new(0, 4)
local IPListLayout = Instance.new("UIListLayout", IndependentPanelFrame)
IPListLayout.Padding = UDim.new(0, 5); IPListLayout.SortOrder = Enum.SortOrder.LayoutOrder; IPListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center; IPListLayout.VerticalAlignment = Enum.VerticalAlignment.Center

local independent_panel_texts = {}
for i, name in ipairs({"Name", "Health", "Distance", "Category"}) do
    local label = Instance.new("TextLabel", IndependentPanelFrame)
    label.Name = name; label.Size = UDim2.new(1, -10, 0, 15); label.BackgroundTransparency = 1
    label.Font = Enum.Font.SourceSans; label.TextSize = 14; label.TextColor3 = Color3.new(1,1,1); label.TextXAlignment = Enum.TextXAlignment.Left; label.LayoutOrder = i
    independent_panel_texts[name] = label
end
IndependentPanelFrame.InputBegan:Connect(function(input) if input.UserInputType == Enum.UserInputType.MouseButton1 and IndependentPanelFrame.Draggable then IndependentPanelFrame.Position = UDim2.fromOffset(UserInputService:GetMouseLocation().X, UserInputService:GetMouseLocation().Y) end end)
IndependentPanelFrame.InputEnded:Connect(function(input) if input.UserInputType == Enum.UserInputType.MouseButton1 and IndependentPanelFrame.Draggable then SilentAimSettings.IndependentPanelPosition = IndependentPanelFrame.Position.X.Offset .. "," .. IndependentPanelFrame.Position.Y.Offset end end)

local ExpectedArguments = {
    FindPartOnRayWithIgnoreList = { ArgCountRequired = 3, Args = {"Instance", "Ray", "table", "boolean", "boolean"} },
    FindPartOnRayWithWhitelist = { ArgCountRequired = 3, Args = {"Instance", "Ray", "table", "boolean"} },
    FindPartOnRay = { ArgCountRequired = 2, Args = {"Instance", "Ray", "Instance", "boolean", "boolean"} },
    Raycast = { ArgCountRequired = 3, Args = {"Instance", "Vector3", "Vector3", "RaycastParams"} }
}

local HitSounds = {
    ["bell"] = "rbxassetid://8679627751",
    ["metal"] = "rbxassetid://3125624765",
    ["click"] = "rbxassetid://17755696142",
    ["exp"] = "rbxassetid://10070796384"
}

local rainbowColor = Color3.fromHSV(0, 1, 1)
task.spawn(function()
    while task.wait() do
        if Library and Library.Unloaded then break end
        local hue = (tick() % 6) / 6
        rainbowColor = Color3.fromHSV(hue, 1, 1)
    end
end)

local function playHitSound(soundId)
    local sound = Instance.new("Sound")
    sound.Parent = CoreGui
    sound.SoundId = soundId
    sound.Volume = 0.6
    sound:Play()
    Debris:AddItem(sound, sound.TimeLength + 0.2)
end

function CalculateChance(Percentage)
    Percentage = math.floor(Percentage)
    return math.random() <= Percentage / 100
end

do
    if not isfolder(MainFileName) then makefolder(MainFileName) end
    if not isfolder(string.format("%s/%s", MainFileName, tostring(game.PlaceId))) then makefolder(string.format("%s/%s", MainFileName, tostring(game.PlaceId))) end
end

local function getPositionOnScreen(Vector)
    local Vec3, OnScreen = WorldToViewportPoint(Camera, Vector)
    return Vector2.new(Vec3.X, Vec3.Y), OnScreen
end

local function ValidateArguments(Args, RayMethod)
    local Matches = 0
    if #Args < RayMethod.ArgCountRequired then return false end
    for Pos, Argument in next, Args do if typeof(Argument) == RayMethod.Args[Pos] then Matches = Matches + 1 end end
    return Matches >= RayMethod.ArgCountRequired
end

local function getDirection(Origin, Position)
    return (Position - Origin).Unit * 1000
end

local function isNPC(obj)
    return obj:IsA("Model") and obj:FindFirstChild("Humanoid") and obj.Humanoid.Health > 0 and obj:FindFirstChild("HumanoidRootPart") and not Players:GetPlayerFromCharacter(obj)
end

function getTargetCategory(character)
    if not character then return "无" end

    if Players:GetPlayerFromCharacter(character) then
        return "玩家"
    end

    if SilentAimSettings.EnableNameTargeting then
        local name = character.Name:lower()
        for _, whitelistedName in ipairs(SilentAimSettings.WhitelistedNames) do
            if whitelistedName and whitelistedName ~= "" and string.find(name, whitelistedName:lower(), 1, true) then
                return "添加的"
            end
        end
    end
    
    for _, path in ipairs(SilentAimSettings.WhitelistPath) do
        local obj = workspace:FindFirstChild(path)
        if obj and obj == character then
            return "路径白名单"
        end
    end
    
    if character:FindFirstChild("Humanoid") then
         return "NPC"
    end

    return "未知"
end

local function updateNPCs()
    local newNpcList = {}
    local addedNpcs = {}

    if SilentAimSettings.EnableNameTargeting and #SilentAimSettings.WhitelistedNames > 0 then
        for _, model in ipairs(workspace:GetDescendants()) do
            if isNPC(model) then
                for _, substring in ipairs(SilentAimSettings.WhitelistedNames) do
                    if substring and substring ~= "" and string.find(model.Name:lower(), substring:lower(), 1, true) then
                        if not addedNpcs[model] then
                            table.insert(newNpcList, model)
                            addedNpcs[model] = true
                            break
                        end
                    end
                end
            end
        end
    end

    for _, path in ipairs(SilentAimSettings.WhitelistPath) do
        local obj = workspace:FindFirstChild(path)
        if obj and isNPC(obj) and not addedNpcs[obj] then
            table.insert(newNpcList, obj)
            addedNpcs[obj] = true
        end
    end

    for _, v in ipairs(workspace:GetChildren()) do
        if isNPC(v) then
            if not addedNpcs[v] then
                table.insert(newNpcList, v)
                addedNpcs[v] = true
            end
        end
    end
    
    npcList = newNpcList
end

local function isBlacklisted(name)
    local lowerName = name:lower()
    for _, blacklistedName in ipairs(SilentAimSettings.BlacklistedNames) do
        if blacklistedName:lower() == lowerName then
            return true
        end
    end
    return false
end

local function isPartVisible(part, customOrigin)
    if not part then return false end
    local localCharacter = LocalPlayer.Character
    if not localCharacter then return false end
    local origin = customOrigin or Camera.CFrame.Position
    local direction = part.Position - origin
    local raycastParams = RaycastParams.new()
    raycastParams.FilterType = Enum.RaycastFilterType.Exclude
    raycastParams.FilterDescendantsInstances = {localCharacter, part.Parent}
    local raycastResult = workspace:Raycast(origin, direction.Unit * direction.Magnitude, raycastParams)
    return not raycastResult
end

local function getClosestPlayer()
    local LocalPlayerCharacter = LocalPlayer.Character
    if not LocalPlayerCharacter or not LocalPlayerCharacter:FindFirstChild("HumanoidRootPart") then return nil end
    local localRoot = LocalPlayerCharacter.HumanoidRootPart
    
    local AimPoint = SilentAimSettings.FixedFOV and (Camera.ViewportSize / 2) or GetMouseLocation(UserInputService)
    local candidates = {}
    
    for _, Player in ipairs(GetPlayers(Players)) do
        if Player ~= LocalPlayer and not (SilentAimSettings.TeamCheck and Player.Team == LocalPlayer.Team) and not isBlacklisted(Player.Name) then
            local Character = Player.Character
            local Humanoid = Character and Character:FindFirstChildOfClass("Humanoid")
            if Character and Humanoid and Humanoid.Health > 0 then
                local partForChecks = Character:FindFirstChild(SilentAimSettings.TargetPart) or Character:FindFirstChild("HumanoidRootPart")
                if not partForChecks then continue end

                if not (SilentAimSettings.VisibleCheck and not isPartVisible(partForChecks, LocalPlayerCharacter.Head.Position)) then
                    local physicalDist = (localRoot.Position - partForChecks.Position).Magnitude
                    if physicalDist <= SilentAimSettings.MaxDistance then
                        if SilentAimSettings.PriorityMode == "最近的人(无FOV)" then
                            table.insert(candidates, {character = Character, fov = math.huge, dist = physicalDist, health = Humanoid.Health})
                        else
                            local ScreenPosition, OnScreen = getPositionOnScreen(partForChecks.Position)
                            if OnScreen then
                                local fovDist = (AimPoint - ScreenPosition).Magnitude
                                if fovDist <= SilentAimSettings.FOVRadius then
                                    table.insert(candidates, {character = Character, fov = fovDist, dist = physicalDist, health = Humanoid.Health})
                                end
                            end
                        end
                    end
                end
            end
        end
    end

    if #candidates == 0 then return nil end
    table.sort(candidates, function(a, b)
        if SilentAimSettings.PriorityMode == "最低血量" then
            return a.health < b.health
        elseif SilentAimSettings.PriorityMode == "距离最近" or SilentAimSettings.PriorityMode == "最近的人(无FOV)" then
            return a.dist < b.dist
        else
            return a.fov < b.fov
        end
    end)
    return candidates[1].character
end

local function getNPCTarget()
    local LocalPlayerCharacter = LocalPlayer.Character
    if not LocalPlayerCharacter or not LocalPlayerCharacter:FindFirstChild("HumanoidRootPart") then return nil end
    local localRoot = LocalPlayerCharacter.HumanoidRootPart

    local AimPoint = SilentAimSettings.FixedFOV and (Camera.ViewportSize / 2) or GetMouseLocation(UserInputService)
    local candidates = {}

    for _, NPCModel in ipairs(npcList) do
        if not (SilentAimSettings.TeamCheck and NPCModel.Team and NPCModel.Team == LocalPlayer.Team) and not isBlacklisted(NPCModel.Name) then
            local Humanoid = NPCModel and NPCModel:FindFirstChildOfClass("Humanoid")
            if NPCModel and Humanoid and Humanoid.Health > 0 then
                local partForChecks = NPCModel:FindFirstChild(SilentAimSettings.TargetPart) or NPCModel.PrimaryPart or NPCModel:FindFirstChild("HumanoidRootPart")
                if not partForChecks then continue end

                if not (SilentAimSettings.VisibleCheck and not isPartVisible(partForChecks, LocalPlayerCharacter.Head.Position)) then
                    local physicalDist = (localRoot.Position - partForChecks.Position).Magnitude
                    if physicalDist <= SilentAimSettings.MaxDistance then
                         if SilentAimSettings.PriorityMode == "最近的人(无FOV)" then
                            table.insert(candidates, {character = NPCModel, fov = math.huge, dist = physicalDist, health = Humanoid.Health})
                        else
                            local ScreenPosition, OnScreen = getPositionOnScreen(partForChecks.Position)
                            if OnScreen then
                                local fovDist = (AimPoint - ScreenPosition).Magnitude
                                if fovDist <= SilentAimSettings.FOVRadius then
                                    table.insert(candidates, {character = NPCModel, fov = fovDist, dist = physicalDist, health = Humanoid.Health})
                                end
                            end
                        end
                    end
                end
            end
        end
    end

    if #candidates == 0 then return nil end
    table.sort(candidates, function(a, b)
        if SilentAimSettings.PriorityMode == "最低血量" then
            return a.health < b.health
        elseif SilentAimSettings.PriorityMode == "距离最近" or SilentAimSettings.PriorityMode == "最近的人(无FOV)" then
            return a.dist < b.dist
        else
            return a.fov < b.fov
        end
    end)
    return candidates[1].character
end

function getPolygonPoints(center, radius, sides)
    local points = {}
    local rotationOffset = SilentAimSettings.IndicatorRotationEnabled and currentRotationAngle or 0
    for i = 1, sides do
        local angle = (i - 1) * (2 * math.pi / sides) - (math.pi / 2) + rotationOffset
        table.insert(points, Vector2.new(center.X + radius * math.cos(angle), center.Y + radius * math.sin(angle)))
    end
    return points
end

function hideAllVisuals()
    target_indicator_circle.Visible = false
    for _, line in ipairs(target_indicator_lines) do line.Visible = false end
    for _, text in pairs(overhead_info_texts) do text.Visible = false end
    panel_info_bg.Visible = false
    for _, text in pairs(panel_info_texts) do text.Visible = false end
    if IndependentPanelFrame then IndependentPanelFrame.Visible = false end
end

local repo = "https://raw.githubusercontent.com/SyndromeXph/NOL-Obsidian/refs/heads/main/"
local Library = loadstring(game:HttpGet(repo .. "Library.lua"))()
local ThemeManager = loadstring(game:HttpGet(repo .. "addons/ThemeManager.lua"))()
local SaveManager = loadstring(game:HttpGet(repo .. "addons/SaveManager.lua"))()

local Options = Library.Options
local Toggles = Library.Toggles

local Window = Library:CreateWindow({ Title = "通用 Slient Aim", Footer = "Yuxin", Center = true, AutoShow = true })

local Tabs = {
    Main = Window:AddTab("主页", "user"),
    Visuals = Window:AddTab("视觉", "camera"),
    Management = Window:AddTab("管理", "users"),
    Misc = Window:AddTab("杂项", "box"),
    ["UI Settings"] = Window:AddTab("UI设置", "settings"),
}

local MainSettingsBox = Tabs.Main:AddLeftGroupbox("主设置")
MainSettingsBox:AddToggle("EnabledToggle", { Text = "启用", Default = SilentAimSettings.Enabled }):AddKeyPicker("EnabledKeybind", { Default = SilentAimSettings.ToggleKey, SyncToggleState = true, Mode = "Toggle" })
Toggles.EnabledToggle:OnChanged(function(Value) SilentAimSettings.Enabled = Value end)
MainSettingsBox:AddToggle("TeamCheckToggle", { Text = "队伍检查", Default = SilentAimSettings.TeamCheck }):OnChanged(function(Value) SilentAimSettings.TeamCheck = Value end)
MainSettingsBox:AddToggle("VisibleCheckToggle", { Text = "可见性检查", Default = SilentAimSettings.VisibleCheck }):OnChanged(function(Value) SilentAimSettings.VisibleCheck = Value end)
MainSettingsBox:AddToggle("WallbangToggle", { Text = "穿墙", Default = SilentAimSettings.Wallbang}):OnChanged(function(Value) SilentAimSettings.Wallbang = Value end)
MainSettingsBox:AddToggle("LeakAndHitToggle", { Text = "漏打模式", Default = SilentAimSettings.LeakAndHitMode}):OnChanged(function(Value) SilentAimSettings.LeakAndHitMode = Value end)
MainSettingsBox:AddSlider('HitChanceSlider', { Text = '命中率', Default = SilentAimSettings.HitChance, Min = 0, Max = 100, Rounding = 1, Suffix = "%" }):OnChanged(function(Value) SilentAimSettings.HitChance = Value end)

local TargetingBox = Tabs.Main:AddRightGroupbox("目标")
TargetingBox:AddDropdown("TargetModeDropdown", { Text = "目标种类", Default = "请选择", Values = {"玩家", "NPC", "所有"} }):OnChanged(function(Value) SilentAimSettings.TargetMode = Value end)
TargetingBox:AddDropdown("TargetPartDropdown", { Values = {"Head", "HumanoidRootPart", "Random"}, Default = SilentAimSettings.TargetPart, Text = "目标部位" }):OnChanged(function(Value) SilentAimSettings.TargetPart = Value end)
TargetingBox:AddDropdown("PriorityModeDropdown", { Text = "优先模式", Default = SilentAimSettings.PriorityMode, Values = {"准星最近", "距离最近", "最低血量", "最近的人(无FOV)"} }):OnChanged(function(Value) SilentAimSettings.PriorityMode = Value end)
TargetingBox:AddSlider('MaxDistanceSlider', { Text = '最大距离', Default = SilentAimSettings.MaxDistance, Min = 10, Max = 2000, Rounding = 0, Suffix = "studs" }):OnChanged(function(Value) SilentAimSettings.MaxDistance = Value end)

local MethodBox = Tabs.Main:AddRightGroupbox("方法")
MethodBox:AddDropdown("MethodDropdown", { Text = "静默瞄准方式", Default = SilentAimSettings.SilentAimMethod, Values = { "Raycast","FindPartOnRay", "FindPartOnRayWithWhitelist", "FindPartOnRayWithIgnoreList", "ScreenPointToRay", "ViewportPointToRay", "Ray", "Mouse.Hit/Target" } }):OnChanged(function(Value) SilentAimSettings.SilentAimMethod = Value end)
MethodBox:AddToggle("PredictionToggle", { Text = "Mouse.Hit/Target 预判", Default = SilentAimSettings.MouseHitPrediction }):OnChanged(function(Value) SilentAimSettings.MouseHitPrediction = Value end)
MethodBox:AddSlider("PredictionAmountSlider", { Text = "预判量", Min = 0, Max = 1, Default = SilentAimSettings.MouseHitPredictionAmount, Rounding = 3 }):OnChanged(function(Value) SilentAimSettings.MouseHitPredictionAmount = Value; PredictionAmount = Value end)
MethodBox:AddToggle("HeadshotChanceToggle", { Text = "启用爆头几率", Default = SilentAimSettings.HeadshotChanceEnabled }):OnChanged(function(Value) SilentAimSettings.HeadshotChanceEnabled = Value end)
MethodBox:AddSlider('HeadshotChanceSlider', { Text = '爆头概率', Default = SilentAimSettings.HeadshotChance, Min = 0, Max = 100, Rounding = 1, Suffix = "%" }):OnChanged(function(Value) SilentAimSettings.HeadshotChance = Value end)

local FovIndicatorBox = Tabs.Visuals:AddLeftGroupbox("范围与指示器")
FovIndicatorBox:AddToggle("FOVVisibleToggle", { Text = "显示FOV圈", Default = SilentAimSettings.FOVVisible }):AddColorPicker("FOVColorPicker", { Default = Color3.fromRGB(54, 57, 241), Title = "FOV圈颜色" })
Toggles.FOVVisibleToggle:OnChanged(function(Value) FOVCircleGui.Enabled = Value; SilentAimSettings.FOVVisible = Value end)
Options.FOVColorPicker:OnChanged(function(Value) FOVStroke.Color = Value end)
FovIndicatorBox:AddSlider("FOVRadiusSlider", { Text = "FOV圈半径", Min = 10, Max = 1000, Default = SilentAimSettings.FOVRadius, Rounding = 0 }):OnChanged(function(Value) FOVCircleFrame.Size = UDim2.fromOffset(Value * 2, Value * 2); SilentAimSettings.FOVRadius = Value end)
FovIndicatorBox:AddToggle("FixedFOVToggle", { Text = "固定FOV (移动端)", Default = SilentAimSettings.FixedFOV }):OnChanged(function(Value) SilentAimSettings.FixedFOV = Value end)
FovIndicatorBox:AddToggle("ShowTargetToggle", { Text = "显示目标", Default = SilentAimSettings.ShowSilentAimTarget }):AddColorPicker("TargetIndicatorColorPicker", { Default = Color3.fromRGB(255,0,0), Title = "指示器颜色" })
Toggles.ShowTargetToggle:OnChanged(function(Value) SilentAimSettings.ShowSilentAimTarget = Value end)
Options.TargetIndicatorColorPicker:OnChanged(function(Value) target_indicator_circle.Color = Value; for _, line in ipairs(target_indicator_lines) do line.Color = Value end end)
FovIndicatorBox:AddDropdown("IndicatorStyleDropdown", { Text = "指示器样式", Values = {"Circle", "Triangle", "Pentagram", "十字准星", "三线准星"}, Default = "Circle" })
FovIndicatorBox:AddSlider("TargetIndicatorRadiusSlider", { Text = "指示器大小(通用)", Min = 5, Max = 50, Default = SilentAimSettings.TargetIndicatorRadius, Rounding = 0 }):OnChanged(function(Value) SilentAimSettings.TargetIndicatorRadius = Value end)
FovIndicatorBox:AddSlider("CrosshairLengthSlider", { Text = "十字准星长度", Min = 5, Max = 100, Default = SilentAimSettings.CrosshairLength, Rounding = 0 }):OnChanged(function(Value) SilentAimSettings.CrosshairLength = Value end)
FovIndicatorBox:AddSlider("CrosshairGapSlider", { Text = "十字准星间隙", Min = 0, Max = 50, Default = SilentAimSettings.CrosshairGap, Rounding = 0 }):OnChanged(function(Value) SilentAimSettings.CrosshairGap = Value end)
FovIndicatorBox:AddToggle("IndicatorRotationToggle", { Text = "指示器旋转", Default = SilentAimSettings.IndicatorRotationEnabled }):OnChanged(function(Value) SilentAimSettings.IndicatorRotationEnabled = Value end)
FovIndicatorBox:AddSlider("IndicatorRotationSpeedSlider", { Text = "旋转速度", Min = 0, Max = 10, Default = SilentAimSettings.IndicatorRotationSpeed, Rounding = 1 }):OnChanged(function(Value) SilentAimSettings.IndicatorRotationSpeed = Value end)
FovIndicatorBox:AddToggle("IndicatorRainbowToggle", { Text = "启用彩虹色", Default = SilentAimSettings.IndicatorRainbowEnabled }):OnChanged(function(Value) SilentAimSettings.IndicatorRainbowEnabled = Value end)
FovIndicatorBox:AddSlider("IndicatorRainbowSpeedSlider", { Text = "颜色变换速度", Min = 0, Max = 10, Default = SilentAimSettings.IndicatorRainbowSpeed, Rounding = 1 }):OnChanged(function(Value) SilentAimSettings.IndicatorRainbowSpeed = Value end)
FovIndicatorBox:AddToggle("IndicatorBreathingToggle", { Text = "启用呼吸效果", Default = SilentAimSettings.IndicatorBreathingEnabled }):OnChanged(function(Value) SilentAimSettings.IndicatorBreathingEnabled = Value end)
FovIndicatorBox:AddSlider("IndicatorBreathingSpeedSlider", { Text = "呼吸速度", Min = 0.1, Max = 5, Default = SilentAimSettings.IndicatorBreathingSpeed, Rounding = 1 }):OnChanged(function(Value) SilentAimSettings.IndicatorBreathingSpeed = Value end)
FovIndicatorBox:AddSlider("IndicatorBreathingMinSlider", { Text = "呼吸最小比例", Min = 0.1, Max = 1, Default = SilentAimSettings.IndicatorBreathingMin, Rounding = 2 }):OnChanged(function(Value) SilentAimSettings.IndicatorBreathingMin = Value end)
FovIndicatorBox:AddSlider("IndicatorBreathingMaxSlider", { Text = "呼吸最大比例", Min = 1, Max = 3, Default = SilentAimSettings.IndicatorBreathingMax, Rounding = 2 }):OnChanged(function(Value) SilentAimSettings.IndicatorBreathingMax = Value end)
FovIndicatorBox:AddToggle("ThreeLineCrosshairToggle", { Text = "启用三线准星", Default = SilentAimSettings.ThreeLineCrosshairEnabled }):OnChanged(function(Value) SilentAimSettings.ThreeLineCrosshairEnabled = Value end)
FovIndicatorBox:AddSlider("ThreeLineCrosshairLengthSlider", { Text = "三线准星长度", Min = 5, Max = 100, Default = SilentAimSettings.ThreeLineCrosshairLength, Rounding = 0 }):OnChanged(function(Value) SilentAimSettings.ThreeLineCrosshairLength = Value end)
FovIndicatorBox:AddSlider("ThreeLineCrosshairGapSlider", { Text = "三线准星间隙", Min = 0, Max = 50, Default = SilentAimSettings.ThreeLineCrosshairGap, Rounding = 0 }):OnChanged(function(Value) SilentAimSettings.ThreeLineCrosshairGap = Value end)

local InfoBox = Tabs.Visuals:AddRightGroupbox("信息")
InfoBox:AddDropdown("TargetInfoStyleDropdown", { Text = "信息显示样式", Default = SilentAimSettings.TargetInfoStyle, Values = {"面板", "头顶", "独立面板"} }):OnChanged(function(Value) SilentAimSettings.TargetInfoStyle = Value end)
InfoBox:AddToggle("ShowTargetNameToggle", { Text = "显示目标名字", Default = SilentAimSettings.ShowTargetName }):OnChanged(function(Value) SilentAimSettings.ShowTargetName = Value end)
InfoBox:AddToggle("ShowTargetHealthToggle", { Text = "显示目标血量", Default = SilentAimSettings.ShowTargetHealth }):OnChanged(function(Value) SilentAimSettings.ShowTargetHealth = Value end)
InfoBox:AddToggle("ShowTargetDistanceToggle", { Text = "显示目标距离", Default = SilentAimSettings.ShowTargetDistance }):OnChanged(function(Value) SilentAimSettings.ShowTargetDistance = Value end)
InfoBox:AddToggle("ShowTargetCategoryToggle", { Text = "显示目标类别", Default = SilentAimSettings.ShowTargetCategory }):OnChanged(function(Value) SilentAimSettings.ShowTargetCategory = Value end)
InfoBox:AddButton("重置独立面板位置", function()
    SilentAimSettings.IndependentPanelPosition = "200,200"
    local pos = SilentAimSettings.IndependentPanelPosition:split(",")
    IndependentPanelFrame.Position = UDim2.fromOffset(tonumber(pos[1]), tonumber(pos[2]))
end)
InfoBox:AddToggle("PinPanelToggle", {Text = "固定面板", Default = SilentAimSettings.IndependentPanelPinned}):OnChanged(function(value)
    SilentAimSettings.IndependentPanelPinned = value
    IndependentPanelFrame.Draggable = not value
end)

local ExtrasBox = Tabs.Visuals:AddRightGroupbox("额外")
ExtrasBox:AddToggle("HighlightToggle", { Text = "启用高亮", Default = SilentAimSettings.HighlightEnabled }):AddColorPicker("HighlightColorPicker", { Default = SilentAimSettings.HighlightColor, Title = "高亮颜色" })
Toggles.HighlightToggle:OnChanged(function(Value) SilentAimSettings.HighlightEnabled = Value end)
Options.HighlightColorPicker:OnChanged(function(Value) SilentAimSettings.HighlightColor = Value end)
ExtrasBox:AddToggle("HighlightRainbowToggle", { Text = "高亮彩虹色", Default = SilentAimSettings.HighlightRainbowEnabled }):OnChanged(function(Value) SilentAimSettings.HighlightRainbowEnabled = Value end)
ExtrasBox:AddToggle("DamageNotifierToggle", { Text = "显示伤害通知", Default = SilentAimSettings.ShowDamageNotifier }):OnChanged(function(Value) SilentAimSettings.ShowDamageNotifier = Value end)
ExtrasBox:AddDropdown('HitSound', { Text = '击中音效', Default = '关闭', Values = {'关闭', 'bell', 'metal', 'click', 'exp'} })
ExtrasBox:AddToggle("ShowTracerToggle", { Text = "显示目标追踪线", Default = SilentAimSettings.ShowTracer }):AddColorPicker("TracerColorPicker", { Default = tracer_line.Color, Title = "追踪线颜色" })
Toggles.ShowTracerToggle:OnChanged(function(Value) SilentAimSettings.ShowTracer = Value end)
Options.TracerColorPicker:OnChanged(function(Value) tracer_line.Color = Value end)
ExtrasBox:AddSlider('TracerYOffsetSlider', { Text = '追踪线Y轴偏移', Default = SilentAimSettings.Tracer_Y_Offset, Min = -10, Max = 10, Rounding = 3, Suffix = " studs" }):OnChanged(function(Value) SilentAimSettings.Tracer_Y_Offset = Value end)

local ManualLockGroupBox = Tabs.Management:AddLeftGroupbox("手动锁定")
ManualLockGroupBox:AddDropdown("TargetSelectorDropdown", { Text = "锁定目标 (无=自动)", Default = "无", Values = {"无"} }):OnChanged(function(selectedName)
    if selectedName == "无" then
        lockedTargetObject = nil
    else
        lockedTargetObject = targetMap[selectedName]
    end
end)
ManualLockGroupBox:AddButton("刷新列表", function()
    targetMap = {}
    local targetNames = {"无"}
    local targetMode = SilentAimSettings.TargetMode
    
    if targetMode == "NPC" or targetMode == "所有" then
        updateNPCs()
    end
    
    if targetMode == "玩家" or targetMode == "所有" then
        for _, player in ipairs(Players:GetPlayers()) do
            if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                if not (SilentAimSettings.TeamCheck and player.Team == LocalPlayer.Team) then
                    table.insert(targetNames, player.Name)
                    targetMap[player.Name] = player
                end
            end
        end
    end
    
    if targetMode == "NPC" or targetMode == "所有" then
        for _, npc in ipairs(npcList) do
            if npc and npc.Name and npc.PrimaryPart then
                table.insert(targetNames, npc.Name)
                targetMap[npc.Name] = npc
            end
        end
    end

    Options.TargetSelectorDropdown:SetValues(targetNames, "无")
    lockedTargetObject = nil
end)

local NameTargetingGroup = Tabs.Management:AddLeftGroupbox("名称索敌")
NameTargetingGroup:AddToggle("EnableNameTargetingToggle", { Text = "启用名称索敌", Default = SilentAimSettings.EnableNameTargeting }):OnChanged(function(Value)
    SilentAimSettings.EnableNameTargeting = Value
end)
local whitelistDataOption = NameTargetingGroup:AddInput("WhitelistData", { Text = "Whitelist Internal Data", Default = "[]" })
whitelistDataOption.Visible = false
local function updateWhitelistData()
    local jsonString = HttpService:JSONEncode(SilentAimSettings.WhitelistedNames)
    whitelistDataOption:SetValue(jsonString)
end
NameTargetingGroup:AddInput("WhitelistNameInput", { Text = "名称", PlaceholderText = "输入要锁定的NPC名称关键字" })
NameTargetingGroup:AddButton("添加到列表", function()
    local name = Options.WhitelistNameInput.Value
    if name and name ~= "" then
        table.insert(SilentAimSettings.WhitelistedNames, name)
        Options.WhitelistDropdown:SetValues(SilentAimSettings.WhitelistedNames)
        Options.WhitelistNameInput:SetValue("")
        updateWhitelistData()
    end
end)
NameTargetingGroup:AddDropdown("WhitelistDropdown", { Text = "名称列表", Values = SilentAimSettings.WhitelistedNames or {} })
NameTargetingGroup:AddButton("从列表中删除", function()
    local selectedName = Options.WhitelistDropdown.Value
    if selectedName then
        for i, name in ipairs(SilentAimSettings.WhitelistedNames) do
            if name == selectedName then
                table.remove(SilentAimSettings.WhitelistedNames, i)
                break
            end
        end
        Options.WhitelistDropdown:SetValues(SilentAimSettings.WhitelistedNames)
        updateWhitelistData()
    end
end)
whitelistDataOption:OnChanged(function(jsonString)
    if not jsonString or jsonString == "" then jsonString = "[]" end
    local success, decoded = pcall(HttpService.JSONDecode, HttpService, jsonString)
    if success and type(decoded) == 'table' then
        SilentAimSettings.WhitelistedNames = decoded
        Options.WhitelistDropdown:SetValues(SilentAimSettings.WhitelistedNames)
    end
end)

local WhitelistPathGroup = Tabs.Management:AddLeftGroupbox("白名单路径管理")
WhitelistPathGroup:AddInput("WhitelistPathInput", { Text = "路径", PlaceholderText = "输入从Workspace开始的路径" })
WhitelistPathGroup:AddButton("添加路径", function()
    local path = Options.WhitelistPathInput.Value
    if path and path ~= "" then
        table.insert(SilentAimSettings.WhitelistPath, path)
        Options.WhitelistPathDropdown:SetValues(SilentAimSettings.WhitelistPath)
        Options.WhitelistPathInput:SetValue("")
    end
end)
WhitelistPathGroup:AddDropdown("WhitelistPathDropdown", { Text = "路径列表", Values = SilentAimSettings.WhitelistPath or {} })
WhitelistPathGroup:AddButton("删除路径", function()
    local selectedPath = Options.WhitelistPathDropdown.Value
    if selectedPath then
        for i, p in ipairs(SilentAimSettings.WhitelistPath) do
            if p == selectedPath then
                table.remove(SilentAimSettings.WhitelistPath, i)
                break
            end
        end
        Options.WhitelistPathDropdown:SetValues(SilentAimSettings.WhitelistPath)
    end
end)

local BlacklistGroup = Tabs.Management:AddRightGroupbox("黑名单管理")
local blacklistDataOption = BlacklistGroup:AddInput("BlacklistData", { Text = "Blacklist Internal Data", Default = "[]" })
blacklistDataOption.Visible = false
local function updateBlacklistData()
    local jsonString = HttpService:JSONEncode(SilentAimSettings.BlacklistedNames)
    blacklistDataOption:SetValue(jsonString)
end
BlacklistGroup:AddInput("BlacklistNameInput", { Text = "名称", PlaceholderText = "输入要拉黑的精确名称" })
BlacklistGroup:AddButton("添加到黑名单", function()
    local name = Options.BlacklistNameInput.Value
    if name and name ~= "" and not isBlacklisted(name) then
        table.insert(SilentAimSettings.BlacklistedNames, name)
        Options.BlacklistDropdown:SetValues(SilentAimSettings.BlacklistedNames)
        Options.BlacklistNameInput:SetValue("")
        updateBlacklistData()
    end
end)
BlacklistGroup:AddDropdown("BlacklistDropdown", { Text = "黑名单列表", Values = SilentAimSettings.BlacklistedNames or {} })
BlacklistGroup:AddButton("从黑名单中删除", function()
    local selectedName = Options.BlacklistDropdown.Value
    if selectedName then
        for i, name in ipairs(SilentAimSettings.BlacklistedNames) do
            if name == selectedName then
                table.remove(SilentAimSettings.BlacklistedNames, i)
                break
            end
        end
        Options.BlacklistDropdown:SetValues(SilentAimSettings.BlacklistedNames)
        updateBlacklistData()
    end
end)
blacklistDataOption:OnChanged(function(jsonString)
    if not jsonString or jsonString == "" then jsonString = "[]" end
    local success, decoded = pcall(HttpService.JSONDecode, HttpService, jsonString)
    if success and type(decoded) == 'table' then
        SilentAimSettings.BlacklistedNames = decoded
        Options.BlacklistDropdown:SetValues(SilentAimSettings.BlacklistedNames)
    end
end)

local CharacterModGroup = Tabs.Misc:AddLeftGroupbox("角色修改")
local originalCharacterData = {}
local transparencyLoopConnection = nil
local function restoreCharacterAppearance()
    for part, data in pairs(originalCharacterData) do
        if part and part.Parent then
            part.Material = data.material
            part.Color = data.color
            part.Transparency = data.transparency
        end
    end
    originalCharacterData = {}
end
local function transparencyLoop()
    if not LocalPlayer.Character then
        if next(originalCharacterData) then
            originalCharacterData = {}
        end
        return
    end
    local isRainbowEnabled = Toggles.TransparentCharacterRainbow.Value
    for _, part in ipairs(LocalPlayer.Character:GetDescendants()) do
        if part:IsA("BasePart") then
            if not originalCharacterData[part] then
                originalCharacterData[part] = {
                    material = part.Material,
                    color = part.Color,
                    transparency = part.Transparency
                }
            end
            part.Material = Enum.Material.ForceField
            if isRainbowEnabled then
                part.Color = rainbowColor
            else
                part.Color = originalCharacterData[part].color
            end
        end
    end
end
CharacterModGroup:AddToggle("TransparentCharacterEnabled", { Text = "人物透明", Default = false }):OnChanged(function(value)
    if value then
        transparencyLoopConnection = RunService.Heartbeat:Connect(transparencyLoop)
    else
        if transparencyLoopConnection then
            transparencyLoopConnection:Disconnect()
            transparencyLoopConnection = nil
        end
        restoreCharacterAppearance()
    end
end)
CharacterModGroup:AddToggle("TransparentCharacterRainbow", { Text = "人物变色", Default = false }):OnChanged(function(value)
    if not value and Toggles.TransparentCharacterEnabled.Value then
        restoreCharacterAppearance()
        task.wait()
        transparencyLoop()
    end
end)

local EntertainmentGroup = Tabs.Misc:AddLeftGroupbox("娱乐")
local spinThread = nil
local spinEnabled = false
local spinSpeed = math.rad(10)
local function spinCharacter()
    while spinEnabled and task.wait() do
        local char = LocalPlayer.Character
        local hrp = char and char:FindFirstChild("HumanoidRootPart")
        if hrp then
            hrp.CFrame = hrp.CFrame * CFrame.Angles(0, spinSpeed, 0)
        else
            break
        end
    end
    spinThread = nil
end
EntertainmentGroup:AddToggle("SpinToggle", { Text = "启用旋转", Default = false }):OnChanged(function(value)
    spinEnabled = value
    if spinEnabled and not spinThread then
        spinThread = coroutine.create(spinCharacter)
        coroutine.resume(spinThread)
    end
end)
EntertainmentGroup:AddSlider("SpinSpeedSlider", { Text = "旋转速度", Default = 10, Min = 1, Max = 100, Rounding = 0 }):OnChanged(function(value)
    spinSpeed = math.rad(value)
end)

FOVCircleGui.Enabled = Toggles.FOVVisibleToggle.Value
FOVStroke.Color = Options.FOVColorPicker.Value
FOVCircleFrame.Size = UDim2.fromOffset(Options.FOVRadiusSlider.Value * 2, Options.FOVRadiusSlider.Value * 2)
IndependentPanelFrame.Draggable = not SilentAimSettings.IndependentPanelPinned

task.spawn(function()
    while task.wait(2) do
        if SilentAimSettings.TargetMode == "NPC" or SilentAimSettings.TargetMode == "所有" then
            updateNPCs()
        end
    end
end)

local lastHealthValues = {}
local damageIndicators = {}
local DAMAGE_INDICATOR_FADE_TIME = 1

local pos = SilentAimSettings.IndependentPanelPosition:split(",")
IndependentPanelFrame.Position = UDim2.fromOffset(tonumber(pos[1]), tonumber(pos[2]))

local lastTargetCharacter = nil
local lockedRandomPart = nil

resume(create(function()
    RenderStepped:Connect(function()
        if SilentAimSettings.IndicatorRotationEnabled then currentRotationAngle = (currentRotationAngle + (SilentAimSettings.IndicatorRotationSpeed / 50)) % (math.pi * 2) end
        if SilentAimSettings.IndicatorRainbowEnabled or SilentAimSettings.HighlightRainbowEnabled or (Toggles.TransparentCharacterRainbow and Toggles.TransparentCharacterRainbow.Value) then currentIndicatorHue = (currentIndicatorHue + (SilentAimSettings.IndicatorRainbowSpeed / 200)) % 1 end
        
        local currentTime = tick()
        for i = #recentShots, 1, -1 do
            if currentTime - recentShots[i].time > 1 then
                table.remove(recentShots, i)
            end
        end

        local isEnabled = Toggles.EnabledToggle.Value
        currentTargetPart = nil
        local currentTargetCharacter = nil

        if isEnabled then
            if lockedTargetObject then
                 if lockedTargetObject.Parent and not isBlacklisted(lockedTargetObject.Name) then
                    if lockedTargetObject:IsA("Player") then
                        currentTargetCharacter = lockedTargetObject.Character
                    elseif lockedTargetObject:IsA("Model") then
                        currentTargetCharacter = lockedTargetObject
                    end
                else
                    lockedTargetObject = nil
                    Options.TargetSelectorDropdown:SetValue("无")
                end
            else
                local targetMode = SilentAimSettings.TargetMode
                local playerTarget, npcTarget
                if targetMode == "玩家" or targetMode == "所有" then playerTarget = getClosestPlayer() end
                if targetMode == "NPC" or targetMode == "所有" then npcTarget = getNPCTarget() end

                if playerTarget and npcTarget then
                    local priority = SilentAimSettings.PriorityMode
                    if priority == "最低血量" then
                        local pHumanoid = playerTarget:FindFirstChildOfClass("Humanoid")
                        local nHumanoid = npcTarget:FindFirstChildOfClass("Humanoid")
                        currentTargetCharacter = (pHumanoid and nHumanoid and pHumanoid.Health <= nHumanoid.Health) and playerTarget or npcTarget
                    else
                        local pDist = (LocalPlayer.Character.HumanoidRootPart.Position - playerTarget.HumanoidRootPart.Position).Magnitude
                        local nDist = (LocalPlayer.Character.HumanoidRootPart.Position - npcTarget.HumanoidRootPart.Position).Magnitude
                        currentTargetCharacter = pDist < nDist and playerTarget or npcTarget
                    end
                else
                    currentTargetCharacter = playerTarget or npcTarget
                end
            end
        end

        if currentTargetCharacter ~= lastTargetCharacter then
            lockedRandomPart = nil
        end
        lastTargetCharacter = currentTargetCharacter

        if currentTargetCharacter then
            local humanoid = currentTargetCharacter:FindFirstChildOfClass("Humanoid")
            if not humanoid or humanoid.Health <= 0 then
                if lockedTargetObject and lockedTargetObject:IsA("Model") and lockedTargetObject == currentTargetCharacter then
                    lockedTargetObject = nil
                    Options.TargetSelectorDropdown:SetValue("无")
                end
                currentTargetCharacter = nil
                currentTargetPart = nil
            else
                local baseTargetPart = nil
                if SilentAimSettings.LeakAndHitMode then
                    for _, part in ipairs(currentTargetCharacter:GetDescendants()) do
                        if part:IsA("BasePart") and part.Parent == currentTargetCharacter then
                            if isPartVisible(part) then
                                baseTargetPart = part
                                break
                            end
                        end
                    end
                else
                    local targetPartName = SilentAimSettings.TargetPart
                    if targetPartName == "Random" then
                        if not lockedRandomPart or not lockedRandomPart.Parent or lockedRandomPart.Parent ~= currentTargetCharacter then
                            lockedRandomPart = currentTargetCharacter[ValidTargetParts[math.random(1, #ValidTargetParts)]]
                        end
                        baseTargetPart = lockedRandomPart
                    else
                        baseTargetPart = currentTargetCharacter:FindFirstChild(targetPartName) or currentTargetCharacter:FindFirstChild("HumanoidRootPart")
                    end
                end

                if baseTargetPart then
                    if SilentAimSettings.HeadshotChanceEnabled and CalculateChance(SilentAimSettings.HeadshotChance) then
                        local headPart = currentTargetCharacter:FindFirstChild("Head")
                        if headPart then
                            currentTargetPart = headPart
                        else
                            currentTargetPart = baseTargetPart
                        end
                    else
                        currentTargetPart = baseTargetPart
                    end
                else
                    currentTargetPart = nil
                end
            end
        end

        if isEnabled and currentTargetPart then
            local humanoid = currentTargetPart.Parent:FindFirstChildOfClass("Humanoid")
            if humanoid then
                local currentHealth = humanoid.Health
                local lastHealth = lastHealthValues[humanoid]
                if lastHealth and currentHealth < lastHealth then
                    local damage = math.floor(lastHealth - currentHealth)
                    if damage > 0 then
                        if not pendingDamage[humanoid] then
                            pendingDamage[humanoid] = { damage = 0, lastUpdate = tick(), position = currentTargetPart.Position }
                        end
                        pendingDamage[humanoid].damage = pendingDamage[humanoid].damage + damage
                        pendingDamage[humanoid].lastUpdate = tick()
                        pendingDamage[humanoid].position = currentTargetPart.Position

                        local selectedSoundName = Options.HitSound.Value
                        if selectedSoundName ~= '关闭' then
                            local soundId = HitSounds[selectedSoundName]
                            if soundId then
                                playHitSound(soundId)
                            end
                        end
                    end
                end
                lastHealthValues[humanoid] = currentHealth
            end
        end
        
        local DAMAGE_ACCUMULATION_WINDOW = 0.15
        for humanoid, data in pairs(pendingDamage) do
            if currentTime - data.lastUpdate > DAMAGE_ACCUMULATION_WINDOW then
                if SilentAimSettings.ShowDamageNotifier and data.damage > 0 then
                    local screenPos, onScreen = getPositionOnScreen(data.position)
                    if onScreen then
                        local indicator = {};
                        indicator.Created = tick();
                        indicator.Position = screenPos;
                        indicator.TextObject = Drawing.new("Text")
                        indicator.TextObject.Font = Drawing.Fonts.Monospace;
                        indicator.TextObject.Text = string.format("-%d", data.damage)
                        indicator.TextObject.Color = Color3.fromRGB(255, 50, 50);
                        indicator.TextObject.Size = 20
                        indicator.TextObject.Center = true;
                        indicator.TextObject.Outline = true
                        table.insert(damageIndicators, indicator)
                    end
                end
                pendingDamage[humanoid] = nil
            end
        end

        for i = #damageIndicators, 1, -1 do
            local indicator = damageIndicators[i]; local age = tick() - indicator.Created
            if age > DAMAGE_INDICATOR_FADE_TIME then
                indicator.TextObject:Remove(); table.remove(damageIndicators, i)
            else
                local progress = age / DAMAGE_INDICATOR_FADE_TIME
                indicator.TextObject.Position = indicator.Position - Vector2.new(0, progress * 40)
                indicator.TextObject.Transparency = progress; indicator.TextObject.Visible = true
            end
        end

        hideAllVisuals()
        
        if currentHighlight and (not currentTargetCharacter or not SilentAimSettings.HighlightEnabled) then
            currentHighlight:Destroy()
            currentHighlight = nil
        end

        if isEnabled and currentTargetCharacter and SilentAimSettings.HighlightEnabled then
             if not currentHighlight then
                currentHighlight = Instance.new("Highlight")
                currentHighlight.Parent = currentTargetCharacter
            end
            currentHighlight.Adornee = currentTargetCharacter
            currentHighlight.Enabled = true
            currentHighlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
            if SilentAimSettings.HighlightRainbowEnabled then
                local rainbowColor = Color3.fromHSV(currentIndicatorHue, 1, 1)
                currentHighlight.FillColor = rainbowColor
                currentHighlight.OutlineColor = rainbowColor
                currentHighlight.FillTransparency = 0.5
                currentHighlight.OutlineTransparency = 0
            else
                currentHighlight.FillColor = SilentAimSettings.HighlightColor
                currentHighlight.OutlineColor = SilentAimSettings.HighlightColor
                currentHighlight.FillTransparency = 0.5
                currentHighlight.OutlineTransparency = 0
            end
        end

        if isEnabled and currentTargetPart then
            local RootToViewportPoint, IsOnScreen = getPositionOnScreen(currentTargetPart.Position)

            if IsOnScreen and Toggles.ShowTargetToggle.Value then
                local indicatorRadius = SilentAimSettings.TargetIndicatorRadius
                local indicatorStyle = Options.IndicatorStyleDropdown.Value
                local finalIndicatorColor; local isTargetVisible = isPartVisible(currentTargetPart)
                if isTargetVisible then finalIndicatorColor = Color3.fromRGB(0, 255, 0); indicatorRadius = indicatorRadius * 0.6
                elseif SilentAimSettings.IndicatorRainbowEnabled then finalIndicatorColor = Color3.fromHSV(currentIndicatorHue, 1, 1)
                else finalIndicatorColor = Options.TargetIndicatorColorPicker.Value end
                
                local breathingScale = 1
                if SilentAimSettings.IndicatorBreathingEnabled then
                    breathingScale = SilentAimSettings.IndicatorBreathingMin + 
                                     (SilentAimSettings.IndicatorBreathingMax - SilentAimSettings.IndicatorBreathingMin) * 
                                     (math.sin(tick() * SilentAimSettings.IndicatorBreathingSpeed * math.pi * 2) * 0.5 + 0.5)
                end
                
                if indicatorStyle == "Circle" then
                    target_indicator_circle.Visible = true; target_indicator_circle.Color = finalIndicatorColor; target_indicator_circle.Radius = indicatorRadius * breathingScale; target_indicator_circle.Position = RootToViewportPoint
                elseif indicatorStyle == "Triangle" then
                    local points = getPolygonPoints(RootToViewportPoint, indicatorRadius * breathingScale, 3)
                    for i = 1, 3 do local line = target_indicator_lines[i]; line.Visible = true; line.Color = finalIndicatorColor; line.From = points[i]; line.To = points[i % 3 + 1] end
                elseif indicatorStyle == "Pentagram" then
                    local points = getPolygonPoints(RootToViewportPoint, indicatorRadius * breathingScale, 5)
                    local pentagram_order = {1, 3, 5, 2, 4}
                    for i = 1, 5 do local line = target_indicator_lines[i]; line.Visible = true; line.Color = finalIndicatorColor; line.From = points[pentagram_order[i]]; line.To = points[pentagram_order[i % 5 + 1]] end
                elseif indicatorStyle == "十字准星" then
                    local length = SilentAimSettings.CrosshairLength * breathingScale
                    local gap = SilentAimSettings.CrosshairGap * breathingScale
                    local center = RootToViewportPoint
                    local rotation = SilentAimSettings.IndicatorRotationEnabled and currentRotationAngle or 0
                    local cos, sin = math.cos(rotation), math.sin(rotation)

                    local function rotate(v)
                        return Vector2.new(v.X * cos - v.Y * sin, v.X * sin + v.Y * cos)
                    end

                    local points = {
                        {From = rotate(Vector2.new(0, -length)) + center, To = rotate(Vector2.new(0, -gap)) + center},
                        {From = rotate(Vector2.new(0, length)) + center, To = rotate(Vector2.new(0, gap)) + center},
                        {From = rotate(Vector2.new(-length, 0)) + center, To = rotate(Vector2.new(-gap, 0)) + center},
                        {From = rotate(Vector2.new(length, 0)) + center, To = rotate(Vector2.new(gap, 0)) + center}
                    }

                    for i = 1, 4 do
                        target_indicator_lines[i].Visible = true
                        target_indicator_lines[i].Color = finalIndicatorColor
                        target_indicator_lines[i].From = points[i].From
                        target_indicator_lines[i].To = points[i].To
                    end
                elseif indicatorStyle == "三线准星" and SilentAimSettings.ThreeLineCrosshairEnabled then
                    local length = SilentAimSettings.ThreeLineCrosshairLength * breathingScale
                    local gap = SilentAimSettings.ThreeLineCrosshairGap * breathingScale
                    local center = RootToViewportPoint
                    local rotation = SilentAimSettings.IndicatorRotationEnabled and currentRotationAngle or 0
                    
                    for i = 1, 3 do
                        local angle = rotation + (i - 1) * (math.pi * 2 / 3)
                        local dir = Vector2.new(math.cos(angle), math.sin(angle))
                        local start = center + dir * gap
                        local endPos = center + dir * length
                        
                        target_indicator_lines[i].Visible = true
                        target_indicator_lines[i].Color = finalIndicatorColor
                        target_indicator_lines[i].From = start
                        target_indicator_lines[i].To = endPos
                    end
                end
            end

            local showAnyInfo = Toggles.ShowTargetNameToggle.Value or Toggles.ShowTargetHealthToggle.Value or Toggles.ShowTargetDistanceToggle.Value or Toggles.ShowTargetCategoryToggle.Value
            if showAnyInfo then
                local player = Players:GetPlayerFromCharacter(currentTargetCharacter)
                local localRoot = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                local humanoid = currentTargetCharacter:FindFirstChildOfClass("Humanoid")
                if humanoid and localRoot then
                    local targetName = player and player.DisplayName or currentTargetCharacter.Name
                    local health = math.floor(humanoid.Health)
                    local maxHealth = humanoid.MaxHealth
                    local dist = math.floor((localRoot.Position - currentTargetPart.Position).Magnitude)
                    local category = getTargetCategory(currentTargetCharacter)
                    local infoStyle = SilentAimSettings.TargetInfoStyle
                    
                    if infoStyle == "独立面板" then
                        IndependentPanelFrame.Visible = true
                        independent_panel_texts.Name.Visible = Toggles.ShowTargetNameToggle.Value
                        independent_panel_texts.Health.Visible = Toggles.ShowTargetHealthToggle.Value
                        independent_panel_texts.Distance.Visible = Toggles.ShowTargetDistanceToggle.Value
                        independent_panel_texts.Category.Visible = Toggles.ShowTargetCategoryToggle.Value
                        if Toggles.ShowTargetNameToggle.Value then independent_panel_texts.Name.Text = "目标: " .. targetName end
                        if Toggles.ShowTargetHealthToggle.Value then independent_panel_texts.Health.Text = string.format("血量: %d", health) end
                        if Toggles.ShowTargetDistanceToggle.Value then independent_panel_texts.Distance.Text = string.format("距离: %dm", dist) end
                        if Toggles.ShowTargetCategoryToggle.Value then independent_panel_texts.Category.Text = "类别: " .. category end
                    elseif infoStyle == "面板" and IsOnScreen then
                        local indicatorRadius = SilentAimSettings.TargetIndicatorRadius
                        local linesDrawn = 0; local lineHeight = 15; local infoPos = RootToViewportPoint + Vector2.new(indicatorRadius + 5, -22)
                        if Toggles.ShowTargetNameToggle.Value then local textObj = panel_info_texts.Name; textObj.Text = targetName; textObj.Position = infoPos + Vector2.new(5, 5 + (linesDrawn * lineHeight)); textObj.Visible = true; linesDrawn = linesDrawn + 1 end
                        if Toggles.ShowTargetHealthToggle.Value then local textObj = panel_info_texts.Health; textObj.Text = string.format("血量: %d", health); textObj.Position = infoPos + Vector2.new(5, 5 + (linesDrawn * lineHeight)); textObj.Visible = true; linesDrawn = linesDrawn + 1 end
                        if Toggles.ShowTargetDistanceToggle.Value then local textObj = panel_info_texts.Distance; textObj.Text = string.format("距离: %dm", dist); textObj.Position = infoPos + Vector2.new(5, 5 + (linesDrawn * lineHeight)); textObj.Visible = true; linesDrawn = linesDrawn + 1 end
                        if Toggles.ShowTargetCategoryToggle.Value then local textObj = panel_info_texts.Category; textObj.Text = "类别: " .. category; textObj.Position = infoPos + Vector2.new(5, 5 + (linesDrawn * lineHeight)); textObj.Visible = true; linesDrawn = linesDrawn + 1 end
                        if linesDrawn > 0 then panel_info_bg.Position = infoPos; panel_info_bg.Size = Vector2.new(120, 10 + (linesDrawn * lineHeight)); panel_info_bg.Visible = true end
                    elseif infoStyle == "头顶" and IsOnScreen then
                        local indicatorRadius = SilentAimSettings.TargetIndicatorRadius
                        local linesDrawn = 0; local lineHeight = 15; local base_y = RootToViewportPoint.Y - indicatorRadius - 10
                        if Toggles.ShowTargetNameToggle.Value then local textObj = overhead_info_texts.Name; textObj.Text = string.format("[%s]", targetName); textObj.Position = Vector2.new(RootToViewportPoint.X, base_y - (linesDrawn * lineHeight)); textObj.Visible = true; linesDrawn = linesDrawn + 1 end
                        if Toggles.ShowTargetHealthToggle.Value then local textObj = overhead_info_texts.Health; textObj.Text = string.format("[%d]", health); textObj.Position = Vector2.new(RootToViewportPoint.X, base_y - (linesDrawn * lineHeight)); textObj.Visible = true; linesDrawn = linesDrawn + 1 end
                        if Toggles.ShowTargetDistanceToggle.Value then local textObj = overhead_info_texts.Distance; textObj.Text = string.format("[%dm]", dist); textObj.Position = Vector2.new(RootToViewportPoint.X, base_y - (linesDrawn * lineHeight)); textObj.Visible = true; linesDrawn = linesDrawn + 1 end
                        if Toggles.ShowTargetCategoryToggle.Value then local textObj = overhead_info_texts.Category; textObj.Text = string.format("[%s]", category); textObj.Position = Vector2.new(RootToViewportPoint.X, base_y - (linesDrawn * lineHeight)); textObj.Visible = true; linesDrawn = linesDrawn + 1 end
                    end
                end
            end
        elseif isEnabled then
            local infoStyle = SilentAimSettings.TargetInfoStyle
            if infoStyle == "独立面板" then
                IndependentPanelFrame.Visible = true
                independent_panel_texts.Name.Visible = true
                independent_panel_texts.Health.Visible = true
                independent_panel_texts.Distance.Visible = false
                independent_panel_texts.Category.Visible = false
                independent_panel_texts.Name.Text = "状态: 自动索敌中..."
                independent_panel_texts.Health.Text = "目标: 无"
            end
        end

        if Toggles.ShowTracerToggle.Value and isEnabled and currentTargetPart then
            local targetHead = currentTargetCharacter and currentTargetCharacter:FindFirstChild("Head")
            local tracerTargetPosition = (targetHead and targetHead.Position) or currentTargetPart.Position
            local y_offset = SilentAimSettings.Tracer_Y_Offset
            local finalTracerPosition = tracerTargetPosition - Vector3.new(0, y_offset, 0)
            local targetScreenPos, IsOnScreen = getPositionOnScreen(finalTracerPosition)
            tracer_line.Visible = IsOnScreen
            if IsOnScreen then tracer_line.From = Camera.ViewportSize / 2; tracer_line.To = targetScreenPos; tracer_line.Color = Options.TracerColorPicker.Value end
        else
            tracer_line.Visible = false
        end
        
        if Toggles.FOVVisibleToggle.Value then
            if Toggles.FixedFOVToggle.Value then FOVCircleFrame.Position = UDim2.fromScale(0.5, 0.5) else local mousePos = GetMouseLocation(UserInputService); FOVCircleFrame.Position = UDim2.fromOffset(mousePos.X, mousePos.Y) end
        end
    end)
end))

local oldNamecall
oldNamecall = hookmetamethod(game, "__namecall", newcclosure(function(...)
    local Method = getnamecallmethod()
    local Arguments = {...}
    local self = Arguments[1]
    if SilentAimSettings.Enabled and not checkcaller() and CalculateChance(SilentAimSettings.HitChance) and currentTargetPart then
        local currentMethod = SilentAimSettings.SilentAimMethod
        local shotOrigin = nil

        if (Method == "FindPartOnRayWithIgnoreList" and currentMethod == Method) or
           (Method == "FindPartOnRayWithWhitelist" and currentMethod == Method) or
           ((Method == "FindPartOnRay" or Method == "findPartOnRay") and currentMethod:lower() == Method:lower()) then
            
            if ValidateArguments(Arguments, ExpectedArguments[Method] or ExpectedArguments["FindPartOnRay"]) then
                shotOrigin = Arguments[2].Origin
                table.insert(recentShots, {origin = shotOrigin, time = tick()})
                if SilentAimSettings.Wallbang then
                    return currentTargetPart, currentTargetPart.Position, currentTargetPart.CFrame.LookVector, currentTargetPart.Material
                end
                Arguments[2] = Ray.new(Arguments[2].Origin, getDirection(Arguments[2].Origin, currentTargetPart.Position))
                return oldNamecall(unpack(Arguments))
            end
        elseif Method == "Raycast" and currentMethod == Method then
            if ValidateArguments(Arguments, ExpectedArguments.Raycast) then
                shotOrigin = Arguments[2]
                table.insert(recentShots, {origin = shotOrigin, time = tick()})
                if SilentAimSettings.Wallbang then
                    local direction = getDirection(shotOrigin, currentTargetPart.Position)
                    local wallbangParams = RaycastParams.new()
                    wallbangParams.FilterType = Enum.RaycastFilterType.Include
                    wallbangParams.FilterDescendantsInstances = {currentTargetPart.Parent}
                    local newArgs = {self, shotOrigin, direction, wallbangParams}
                    return oldNamecall(unpack(newArgs))
                end
                Arguments[3] = getDirection(Arguments[2], currentTargetPart.Position)
                return oldNamecall(unpack(Arguments))
            end
        elseif (Method == "ScreenPointToRay" or Method == "ViewportPointToRay") and currentMethod == Method and self == Camera then
            shotOrigin = Camera.CFrame.Position
            local direction = (currentTargetPart.Position - shotOrigin).Unit
            table.insert(recentShots, {origin = shotOrigin, time = tick()})
            return Ray.new(shotOrigin, direction)
        end
    end
    return oldNamecall(...)
end))

local oldIndex
local oldRayNew
oldIndex = hookmetamethod(game, "__index", newcclosure(function(self, Index)
    if self == Mouse and not checkcaller() and SilentAimSettings.Enabled and SilentAimSettings.SilentAimMethod == "Mouse.Hit/Target" then
        if currentTargetPart then
            if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Head") then
                table.insert(recentShots, {origin = LocalPlayer.Character.Head.Position, time = tick()})
            end
            if Index == "Target" or Index == "target" then
                return currentTargetPart
            elseif Index == "Hit" or Index == "hit" then
                return (SilentAimSettings.MouseHitPrediction and (currentTargetPart.CFrame + (currentTargetPart.Velocity * currentTargetPart.Velocity.magnitude * SilentAimSettings.MouseHitPredictionAmount))) or currentTargetPart.CFrame
            elseif Index == "X" or Index == "x" then
                return self.X
            elseif Index == "Y" or Index == "y" then
                return self.Y
            elseif Index == "UnitRay" then
                return Ray.new(self.Origin, (self.Hit.p - self.Origin.p).Unit)
            end
        end
    end
    return oldIndex(self, Index)
end))

oldRayNew = hookfunction(Ray.new, newcclosure(function(origin, direction)
    if SilentAimSettings.Enabled and SilentAimSettings.SilentAimMethod == "Ray" and currentTargetPart and not checkcaller() and CalculateChance(SilentAimSettings.HitChance) then
        table.insert(recentShots, {origin = origin, time = tick()})
        local newDirectionVector = getDirection(origin, currentTargetPart.Position)
        return oldRayNew(origin, newDirectionVector)
    end
    return oldRayNew(origin, direction)
end))

Library:OnUnload(function()
    FOVCircleGui:Destroy()
    if IndependentPanelGui then
        IndependentPanelGui:Destroy()
    end
    if currentHighlight then
        currentHighlight:Destroy()
    end
    if transparencyLoopConnection then
        transparencyLoopConnection:Disconnect()
        transparencyLoopConnection = nil
        restoreCharacterAppearance()
    end
    hideAllVisuals()
    oldNamecall:UnHook()
    oldIndex:UnHook()
    oldRayNew:UnHook()
end)

ThemeManager:SetLibrary(Library)
SaveManager:SetLibrary(Library)

SaveManager:IgnoreThemeSettings()
SaveManager:SetIgnoreIndexes({ "MenuKeybind" })
SaveManager:SetFolder("UniversalSilentAim/Configs")

SaveManager:BuildConfigSection(Tabs["UI Settings"])
ThemeManager:ApplyToTab(Tabs["UI Settings"])

SaveManager:LoadAutoloadConfig()
    end
})

-- ==================== 柠檬脚本 ====================
Tabs.Lemon:Paragraph({
    Title = "柠檬脚本:",
    Desc = "备注",
    Image = "https://play-lh.googleusercontent.com/7cIIPlWm4m7AGqVpEsIfyL-HW4cQla4ucXnfalMft1TMIYQIlf2vqgmthlZgbNAQoaQ",
    ImageSize = 20,
    ThumbnailSize = 120
})
Tabs.Lemon:Button({
    Title = "卖柠檬1",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Fluxyyy333/HoshiOnTop/main/loader.lua"))()
    end
})
Tabs.Lemon:Button({
    Title = "卖柠檬2",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Kenniel123/Sell-Lemons/refs/heads/main/Sell%20Lemons"))()
    end
})
Tabs.Lemon:Button({
    Title = "卖柠檬3",
    Callback = function()
        loadstring(game:HttpGet("https://rblxscripts.net/raw/axonic-hub-best-script-76ab7a48"))()
    end
})

-- ==================== 踢幸运方块 ====================
Tabs.Lucky:Paragraph({
    Title = "踢一个幸运的方块:",
    Desc = "",
    Image = "https://play-lh.googleusercontent.com/7cIIPlWm4m7AGqVpEsIfyL-HW4cQla4ucXnfalMft1TMIYQIlf2vqgmthlZgbNAQoaQ",
    ImageSize = 20,
    ThumbnailSize = 120
})
Tabs.Lucky:Button({
    Title = "踢幸运方块1",
    Callback = function()
        loadstring(game:HttpGet("https://api.luarmor.net/files/v4/loaders/d130dee84ed1d9ccecfd6a91fc49665b.lua"))()
    end
})
Tabs.Lucky:Button({
    Title = "踢幸运方块2",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/gumanba/Scripts/main/KickaLuckyBlock"))()
    end
})

-- ==================== 迷你战争 ====================
Tabs.MiniWar:Paragraph({
    Title = "迷你战争:",
    Desc = "自动收集选定物品，按自定义市场价格条件出售，升级技能，根据优先级攻击敌人，并领取任务奖励。它还包括突袭追踪、可调节延迟、过滤销售、传送选项、商店工具、服务器功能、杂项工具以及可配置的设置标签页",
    Image = "https://play-lh.googleusercontent.com/7cIIPlWm4m7AGqVpEsIfyL-HW4cQla4ucXnfalMft1TMIYQIlf2vqgmthlZgbNAQoaQ",
    ImageSize = 20,
    ThumbnailSize = 120
})
Tabs.MiniWar:Button({
    Title = "迷你战争1",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/LynX99-9/komtolmmek2script/refs/heads/main/CyraaHub.lua", true))()
    end
})

-- ==================== doors ====================
Tabs.doors:Paragraph({
    Title = "doors:",
    Desc = "功能较多",
    Image = "https://play-lh.googleusercontent.com/7cIIPlWm4m7AGqVpEsIfyL-HW4cQla4ucXnfalMft1TMIYQIlf2vqgmthlZgbNAQoaQ",
    ImageSize = 20,
    ThumbnailSize = 120
})
Tabs.doors:Button({
    Title = "doors1",
    Callback = function()
        loadstring(game:HttpGet("https://api.jnkie.com/api/v1/luascripts/public/ef9b5a30ec84e201b585c3ef1850d264b216441eab77257f0e9184de826cc47e/download"))()
    end
})
Tabs.doors:Button({
    Title = "doors2",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ROSHANDVS2/ROSHAN-HUB-SCRIPTS/refs/heads/main/ROSHAN-DOORS-PAGUE-HUB.lua"))()
    end
})

-- ==================== 刀刃球 ====================
Tabs.dao:Paragraph({
    Title = "刀刃球:",
    Desc = "备注",
    Image = "https://play-lh.googleusercontent.com/7cIIPlWm4m7AGqVpEsIfyL-HW4cQla4ucXnfalMft1TMIYQIlf2vqgmthlZgbNAQoaQ",
    ImageSize = 20,
    ThumbnailSize = 120
})
Tabs.dao:Button({
    Title = "刀刃球1",
    Callback = function()
        loadstring(game:HttpGet('https://levi-hub-x.vercel.app/Loader.lua'))()
    end
})
Tabs.dao:Button({
    Title = "刀刃球2",
    Callback = function()
        loadstring(game:HttpGet('https://levi-hub-x.vercel.app/Loader.lua'))()
    end
})

-- ==================== shen99 ====================
Tabs.shen99:Paragraph({
    Title = "99:",
    Desc = "🌲 树光环重做，⚔️ 杀戮光环滑块变化，📦 Bring Items 重做，🧭 传送清理，🎥 免费摄像头修复，🏃 玩家模组修复，🛰️ ESP清理，🌲 树光环重做",
    Image = "https://play-lh.googleusercontent.com/7cIIPlWm4m7AGqVpEsIfyL-HW4cQla4ucXnfalMft1TMIYQIlf2vqgmthlZgbNAQoaQ",
    ImageSize = 20,
    ThumbnailSize = 120
})
Tabs.shen99:Button({
    Title = "99-1",
    Callback = function()
        loadstring(game:HttpGet("https://rblxscripts.net/raw/99-nights-in-the-forest-foxname-bring-items-god-mode-auto-gr-f4e6400e"))()
    end
})
Tabs.shen99:Button({
    Title = "99-2",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Iceware-RBLX/Roblox/refs/heads/main/loader.lua", true))()
    end
})
Tabs.shen99:Button({
    Title = "99-3",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Kenniel123/99-Nights-in-the-Forest/refs/heads/main/99%20Nights%20in%20the%20Forest"))()
    end
})

-- ==================== 谋杀悬疑2（折叠事件已删除） ====================
local moshaSection = Tabs.mosha:Section({ Title = "谋杀悬疑2", Opened = true })
task.spawn(function()
    task.wait(0.1)
    local toggle = moshaSection:FindFirstChild("SectionToggle")
    if toggle then toggle.Visible = false end
end)

moshaSection:Paragraph({
    Title = "谋杀悬疑2:",
    Desc = "",
    Image = "https://play-lh.googleusercontent.com/7cIIPlWm4m7AGqVpEsIfyL-HW4cQla4ucXnfalMft1TMIYQIlf2vqgmthlZgbNAQoaQ",
    ImageSize = 20,
    ThumbnailSize = 120
})
moshaSection:Button({
    Title = "谋杀悬疑1",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ultimatep568/Spark-Hub/refs/heads/main/SparkHub_Loader.lua"))()
    end
})
moshaSection:Button({
    Title = "谋杀悬疑2",
    Callback = function()
        loadstring(game:HttpGet('https://raw.smokingscripts.org/vertex.lua'))()
    end
})
moshaSection:Button({
    Title = "谋杀悬疑3",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ultimatep568/Spark-Hub/refs/heads/main/SparkHub_Loader.lua"))()
    end
})
moshaSection:Button({
    Title = "谋杀悬疑4",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/renardofficiel/game/refs/heads/main/MurderMystery2/main.lua", true))()
    end
})

-- ============================================================
-- ==================== 极速传奇标签页 ====================
-- ============================================================
local JS = {}

JS.autoXP = false
Tabs.JiSuChuanQi:Toggle({
    Title = "自动刷经验 150",
    Desc = "城市内使用",
    Value = false,
    Callback = function(state)
        JS.autoXP = state
        if state then
            task.spawn(function()
                while JS.autoXP do
                    local orbEvent = ReplicatedStorage:FindFirstChild("rEvents") and ReplicatedStorage.rEvents:FindFirstChild("orbEvent")
                    if orbEvent then
                        for _ = 1, 18 do
                            orbEvent:FireServer("collectOrb", "Orange Orb", "City")
                        end
                    end
                    task.wait(0.1)
                end
            end)
        end
    end
})

JS.cssdkq = false
Tabs.JiSuChuanQi:Toggle({
    Title = "自动刷速度(城市)",
    Desc = "城市内使用",
    Value = false,
    Callback = function(state)
        JS.cssdkq = state
        if state then
            task.spawn(function()
                while JS.cssdkq do
                    local orbEvent = ReplicatedStorage:FindFirstChild("rEvents") and ReplicatedStorage.rEvents:FindFirstChild("orbEvent")
                    if orbEvent then
                        for _ = 1, 18 do
                            orbEvent:FireServer("collectOrb", "Red Orb", "City")
                        end
                    end
                    task.wait(0.0001)
                end
            end)
        end
        WindUI:Notify({
            Title = "HB：",
            Content = state and "已开启自动刷速度(城市)" or "已关闭自动刷速度(城市)",
            Icon = state and "check" or "x",
            Duration = 2
        })
    end
})

JS.bxsdkq = false
Tabs.JiSuChuanQi:Toggle({
    Title = "自动刷速度(白雪城市)",
    Desc = "白雪城市内使用",
    Value = false,
    Callback = function(state)
        JS.bxsdkq = state
        if state then
            task.spawn(function()
                while JS.bxsdkq do
                    local orbEvent = ReplicatedStorage:FindFirstChild("rEvents") and ReplicatedStorage.rEvents:FindFirstChild("orbEvent")
                    if orbEvent then
                        for _ = 1, 18 do
                            orbEvent:FireServer("collectOrb", "Red Orb", "Snow City")
                        end
                    end
                    task.wait(0.0001)
                end
            end)
        end
        WindUI:Notify({
            Title = "HB: ",
            Content = state and "已开启自动刷速度(白雪城市)" or "已关闭自动刷速度(白雪城市)",
            Icon = state and "check" or "x",
            Duration = 2
        })
    end
})

JS.dysdkq = false
Tabs.JiSuChuanQi:Toggle({
    Title = "自动刷速度(岩浆城市)",
    Desc = "岩浆城市内使用",
    Value = false,
    Callback = function(state)
        JS.dysdkq = state
        if state then
            task.spawn(function()
                while JS.dysdkq do
                    local orbEvent = ReplicatedStorage:FindFirstChild("rEvents") and ReplicatedStorage.rEvents:FindFirstChild("orbEvent")
                    if orbEvent then
                        for _ = 1, 16 do
                            orbEvent:FireServer("collectOrb", "Red Orb", "Magma City")
                        end
                    end
                    task.wait(0.0001)
                end
            end)
        end
        WindUI:Notify({
            Title = "HB：",
            Content = state and "已开启自动刷速度(岩浆城市)" or "已关闭自动刷速度(岩浆城市)",
            Icon = state and "check" or "x",
            Duration = 2
        })
    end
})

JS.cqsdkq = false
Tabs.JiSuChuanQi:Toggle({
    Title = "自动刷速度(传奇公路)",
    Desc = "传奇公路内使用",
    Value = false,
    Callback = function(state)
        JS.cqsdkq = state
        if state then
            task.spawn(function()
                while JS.cqsdkq do
                    local orbEvent = ReplicatedStorage:FindFirstChild("rEvents") and ReplicatedStorage.rEvents:FindFirstChild("orbEvent")
                    if orbEvent then
                        for _ = 1, 16 do
                            orbEvent:FireServer("collectOrb", "Red Orb", "Legends Highway")
                        end
                    end
                    task.wait(0.0001)
                end
            end)
        end
        WindUI:Notify({
            Title = "HB：",
            Content = state and "已开启自动刷速度(传奇公路)" or "已关闭自动刷速度(传奇公路)",
            Icon = state and "check" or "x",
            Duration = 2
        })
    end
})

Tabs.JiSuChuanQi:Divider()

JS.cskq = false
Tabs.JiSuChuanQi:Toggle({
    Title = "自动重生",
    Desc = "可重生时将自动重生",
    Value = false,
    Callback = function(state)
        JS.cskq = state
        if state then
            task.spawn(function()
                while JS.cskq do
                    local rebirthEvent = ReplicatedStorage:FindFirstChild("rEvents") and ReplicatedStorage.rEvents:FindFirstChild("rebirthEvent")
                    if rebirthEvent then
                        rebirthEvent:FireServer("rebirthRequest")
                    end
                    task.wait(0.0001)
                end
            end)
        end
        WindUI:Notify({
            Title = "HB：",
            Content = state and "已开启自动重生" or "已关闭自动重生",
            Icon = state and "check" or "x",
            Duration = 2
        })
    end
})

Tabs.JiSuChuanQi:Divider()

JS.cszskq = false
Tabs.JiSuChuanQi:Toggle({
    Title = "自动刷钻石(城市)",
    Desc = "城市内使用",
    Value = false,
    Callback = function(state)
        JS.cszskq = state
        if state then
            task.spawn(function()
                while JS.cszskq do
                    local orbEvent = ReplicatedStorage:FindFirstChild("rEvents") and ReplicatedStorage.rEvents:FindFirstChild("orbEvent")
                    if orbEvent then
                        for _ = 1, 20 do
                            orbEvent:FireServer("collectOrb", "Gem", "City")
                        end
                    end
                    task.wait(0.0001)
                end
            end)
        end
        WindUI:Notify({
            Title = "HB：",
            Content = state and "已开启自动刷钻石(城市)" or "已关闭自动刷钻石(城市)",
            Icon = state and "check" or "x",
            Duration = 2
        })
    end
})

JS.bxzskq = false
Tabs.JiSuChuanQi:Toggle({
    Title = "自动刷钻石(白雪城市)",
    Desc = "白雪城市内使用",
    Value = false,
    Callback = function(state)
        JS.bxzskq = state
        if state then
            task.spawn(function()
                while JS.bxzskq do
                    local orbEvent = ReplicatedStorage:FindFirstChild("rEvents") and ReplicatedStorage.rEvents:FindFirstChild("orbEvent")
                    if orbEvent then
                        for _ = 1, 20 do
                            orbEvent:FireServer("collectOrb", "Gem", "Snow City")
                        end
                    end
                    task.wait(0.0001)
                end
            end)
        end
        WindUI:Notify({
            Title = "HB：",
            Content = state and "已开启自动刷钻石(白雪城市)" or "已关闭自动刷钻石(白雪城市)",
            Icon = state and "check" or "x",
            Duration = 2
        })
    end
})

JS.yjzskq = false
Tabs.JiSuChuanQi:Toggle({
    Title = "自动刷钻石(岩浆城市)",
    Desc = "岩浆城市内使用",
    Value = false,
    Callback = function(state)
        JS.yjzskq = state
        if state then
            task.spawn(function()
                while JS.yjzskq do
                    local orbEvent = ReplicatedStorage:FindFirstChild("rEvents") and ReplicatedStorage.rEvents:FindFirstChild("orbEvent")
                    if orbEvent then
                        for _ = 1, 20 do
                            orbEvent:FireServer("collectOrb", "Gem", "Magma City")
                        end
                    end
                    task.wait(0.0001)
                end
            end)
        end
        WindUI:Notify({
            Title = "HB：",
            Content = state and "已开启自动刷钻石(岩浆城市)" or "已关闭自动刷钻石(岩浆城市)",
            Icon = state and "check" or "x",
            Duration = 2
        })
    end
})

JS.cqzskq = false
Tabs.JiSuChuanQi:Toggle({
    Title = "自动刷钻石(传奇公路)",
    Desc = "传奇公路内使用",
    Value = false,
    Callback = function(state)
        JS.cqzskq = state
        if state then
            task.spawn(function()
                while JS.cqzskq do
                    local orbEvent = ReplicatedStorage:FindFirstChild("rEvents") and ReplicatedStorage.rEvents:FindFirstChild("orbEvent")
                    if orbEvent then
                        for _ = 1, 20 do
                            orbEvent:FireServer("collectOrb", "Gem", "Legends Highway")
                        end
                    end
                    task.wait(0.0001)
                end
            end)
        end
        WindUI:Notify({
            Title = "HB：",
            Content = state and "已开启自动刷钻石(传奇公路)" or "已关闭自动刷钻石(传奇公路)",
            Icon = state and "check" or "x",
            Duration = 2
        })
    end
})

-- 传送功能
local qPoints = {
    CFrame.new(-278.8976135253906, 66.09315490722656, -10946.564453125),
    CFrame.new(3980.05029296875, 159.91925048828125, 5589.21533203125),
    CFrame.new(137.6853485107422, 75.40111541748047, -5972.4873046875),
    CFrame.new(-15376.439453125, 412.2984619140625, 4475.322265625),
    CFrame.new(-489.440673828125, 98.277099609375, 2502.03564453125),
    CFrame.new(-15167.5068359375, 382.1965026855469, 4888.2900390625),
    CFrame.new(2094.217041015625, 251.98931884765625, 12877.951171875),
    CFrame.new(-1645.1728515625, 69.02545928955078, 5337.923828125),
    CFrame.new(-13254.447265625, 222.44158935546875, 4891.56005859375),
    CFrame.new(-533.439208984375, 58.4377326965332, 209.794921875),
    CFrame.new(473.2319641113281, 66.08084106445312, -10867.8388671875),
    CFrame.new(2333.369873046875, 161.6602325439453, 13369.1240234375),
    CFrame.new(5392.5322265625, 297.8348388671875, 5885.2138671875),
    CFrame.new(3806.247802734375, 299.41748046875, 7225.6806640625),
    CFrame.new(1664.3343505859375, 80.900390625, 12589.7109375),
    CFrame.new(1769.7236328125, 80.90105438232422, 12879.7958984375),
    CFrame.new(-11097.05859375, 200.84193420410156, 4465.34375),
    CFrame.new(-13140.974609375, 200.84193420410156, 4465.39599609375),
    CFrame.new(-536.3781127929688, 58.43798065185547, -133.1399688720703),
    CFrame.new(2485.461181640625, 135.55299377441406, 12384.6455078125),
    CFrame.new(1173.287109375, 92.03070831298828, -6024.24365234375),
    CFrame.new(-85.52466583251953, 115.9759750366211, -107.73560333251953),
    CFrame.new(1805.7076416015625, 90.94168853759766, 4617.30712890625),
    CFrame.new(-350.6163330078125, 66.06715393066406, -8732.2490234375),
    CFrame.new(5666.32861328125, 326.5240478515625, 6494.826171875),
    CFrame.new(4516.66845703125, 221.20545959472656, 7181.7421875),
    CFrame.new(-1746.5504150390625, 150.5835418701172, 5372.54248046875),
    CFrame.new(5361.96826171875, 297.8207092285156, 7025.44482421875),
    CFrame.new(4650.1669921875, 221.213134765625, 5608.54345703125),
    CFrame.new(-12993.1826171875, 200.82785034179688, 5222.71337890625),
    CFrame.new(355.5094299316406, 111.75679779052734, -10924.6923828125),
    CFrame.new(1942.0057373046875, 93.18344116210938, -2047.2164306640625),
    CFrame.new(-15156.52734375, 355.08978271484375, 4141.91357421875),
    CFrame.new(2062.114990234375, 159.88404846191406, 4374.28076171875),
    CFrame.new(230.04505920410156, 94.17676544189453, 80.71623229980469),
}

JS.sqkq = false
Tabs.JiSuChuanQi:Toggle({
    Title = "自动刷圈",
    Desc = "传奇公路内使用",
    Value = false,
    Callback = function(state)
        JS.sqkq = state
        if state then
            task.spawn(function()
                while JS.sqkq do
                    for _, zdsq in ipairs(qPoints) do
                        local char = getCharacter()
                        if char and char:FindFirstChild("HumanoidRootPart") then
                            char.HumanoidRootPart.CFrame = zdsq
                        end
                        task.wait(0.0001)
                    end
                    task.wait(0.0001)
                end
            end)
        else
            local char = getCharacter()
            if char and char:FindFirstChild("HumanoidRootPart") then
                char.HumanoidRootPart.CFrame = CFrame.new(-568.6292114257812, 3.1723721027374268, 412.86492919921875)
            end
        end
        WindUI:Notify({
            Title = "HB：",
            Content = state and "已开启自动刷圈" or "已关闭自动刷圈",
            Icon = state and "check" or "x",
            Duration = 2
        })
    end
})

local function teleportTo(cframe)
    local char = getCharacter()
    if char and char:FindFirstChild("HumanoidRootPart") then
        char.HumanoidRootPart.CFrame = cframe
    end
    WindUI:Notify({
        Title = "HB：",
        Content = "传送成功",
        Icon = "bell",
        Duration = 3
    })
end

Tabs.JiSuChuanQi:Button({
    Title = "传送至城市（出生点）",
    Callback = function()
        teleportTo(CFrame.new(-568.6292114257812, 3.1723721027374268, 412.86492919921875))
    end
})
Tabs.JiSuChuanQi:Button({
    Title = "传送至神秘洞穴",
    Callback = function()
        teleportTo(CFrame.new(-9683.048828125, 58.352359771728516, 3136.626953125))
    end
})
Tabs.JiSuChuanQi:Button({
    Title = "传送至白雪城市",
    Callback = function()
        teleportTo(CFrame.new(-866.3868408203125, 3.222372055053711, 2165.70654296875))
    end
})
Tabs.JiSuChuanQi:Button({
    Title = "传送至地狱洞穴",
    Callback = function()
        teleportTo(CFrame.new(-11041.357421875, 58.352359771728516, 4111.8251953125))
    end
})
Tabs.JiSuChuanQi:Button({
    Title = "传送至熔岩城市",
    Callback = function()
        teleportTo(CFrame.new(1616.8270263671875, 3.2723801136016846, 4330.65234375))
    end
})
Tabs.JiSuChuanQi:Button({
    Title = "传送至水手路线",
    Callback = function()
        teleportTo(CFrame.new(-1618.4071044921875, 8.759234428405762, 4892.44091796875))
    end
})
Tabs.JiSuChuanQi:Button({
    Title = "传送至电光洞穴",
    Callback = function()
        teleportTo(CFrame.new(-13107.9892578125, 58.352359771728516, 4099.099609375))
    end
})
Tabs.JiSuChuanQi:Button({
    Title = "传送至传奇公路",
    Callback = function()
        teleportTo(CFrame.new(3673.601318359375, 70.75231170654297, 5588.7958984375))
    end
})
Tabs.JiSuChuanQi:Button({
    Title = "传送至丛林洞穴",
    Callback = function()
        teleportTo(CFrame.new(-15266.7880859375, 239.7072296142578, 3769.77490234375))
    end
})

-- 自动功能
JS.zdbskq = false
Tabs.JiSuChuanQi:Toggle({
    Title = "自动比赛",
    Desc = "当有比赛时自动参加比赛",
    Value = false,
    Callback = function(state)
        JS.zdbskq = state
        if state then
            task.spawn(function()
                while JS.zdbskq do
                    local raceEvent = ReplicatedStorage:FindFirstChild("rEvents") and ReplicatedStorage.rEvents:FindFirstChild("raceEvent")
                    if raceEvent then
                        raceEvent:FireServer("joinRace")
                    end
                    task.wait(0.0001)
                end
            end)
        end
        WindUI:Notify({
            Title = "HB：",
            Content = state and "已开启自动比赛" or "已关闭自动比赛",
            Icon = state and "check" or "x",
            Duration = 2
        })
    end
})

JS.zdsdkq = false
Tabs.JiSuChuanQi:Toggle({
    Title = "自动刷速度V2",
    Desc = "可在任意地方使用（不稳定）",
    Value = false,
    Callback = function(state)
        JS.zdsdkq = state
        if state then
            task.spawn(function()
                while JS.zdsdkq do
                    local questsEvent = ReplicatedStorage:FindFirstChild("rEvents") and ReplicatedStorage.rEvents:FindFirstChild("questsEvent")
                    if questsEvent then
                        for _ = 1, 20 do
                            questsEvent:FireServer("collectQuest", Instance.new("Folder", nil))
                        end
                    end
                    task.wait(0.0001)
                end
            end)
        end
        WindUI:Notify({
            Title = "HB：",
            Content = state and "已开启自动刷速度V2" or "已关闭自动刷速度V2",
            Icon = state and "check" or "x",
            Duration = 2
        })
    end
})

JS.mcwkq = false
Tabs.JiSuChuanQi:Toggle({
    Title = "自动买宠物",
    Desc = "快速获得宠物，消耗钻石",
    Value = false,
    Callback = function(state)
        JS.mcwkq = state
        if state then
            task.spawn(function()
                while JS.mcwkq do
                    local openCrystalRemote = ReplicatedStorage:FindFirstChild("rEvents") and ReplicatedStorage.rEvents:FindFirstChild("openCrystalRemote")
                    if openCrystalRemote then
                        openCrystalRemote:InvokeServer("openCrystal", "Jungle Crystal")
                    end
                    task.wait(0.0001)
                end
            end)
        end
        WindUI:Notify({
            Title = "HB：",
            Content = state and "已开启自动买宠物" or "已关闭自动买宠物",
            Icon = state and "check" or "x",
            Duration = 2
        })
    end
})

JS.mwjkq = false
Tabs.JiSuChuanQi:Toggle({
    Title = "自动买尾迹",
    Desc = "快速获得尾迹，消耗钻石",
    Value = false,
    Callback = function(state)
        JS.mwjkq = state
        if state then
            task.spawn(function()
                while JS.mwjkq do
                    local openCrystalRemote = ReplicatedStorage:FindFirstChild("rEvents") and ReplicatedStorage.rEvents:FindFirstChild("openCrystalRemote")
                    if openCrystalRemote then
                        openCrystalRemote:InvokeServer("openCrystal", "Inferno Crystal")
                    end
                    task.wait(0.0001)
                end
            end)
        end
        WindUI:Notify({
            Title = "HB：",
            Content = state and "已开启自动买尾迹" or "已关闭自动买尾迹",
            Icon = state and "check" or "x",
            Duration = 2
        })
    end
})

-- ============================================================
-- ==================== 汽车营销大亨 ====================
-- ============================================================
local QC = {}

local qcSection1 = Tabs.QiCheYingXiao:Section({ Title = "自动功能" })
local qcSection2 = Tabs.QiCheYingXiao:Section({ Title = "比赛功能" })

QC.Auto = false
qcSection1:Toggle({
    Title = "自动刷钱",
    Desc = "创建平台并自动刷钱",
    Value = false,
    Callback = function(state)
        QC.Auto = state
        if state then
            task.spawn(function()
                local part = Instance.new("Part")
                part.Position = Vector3.new(0, 60, 0)
                part.Size = Vector3.new(1000, 5, 1000)
                part.Anchored = true
                part.Name = "Keaths Platform"
                part.CollisionGroupId = 5
                part.Parent = Workspace

                local part2 = Instance.new("Part")
                part2.Position = Vector3.new(0, 10, 0)
                part2.Size = Vector3.new(1000, 5, 1000)
                part2.Anchored = true
                part2.Name = "Keaths Platform"
                part2.CollisionGroupId = 5
                part2.Parent = Workspace

                local part3 = Instance.new("Part")
                part3.Position = Vector3.new(0, 99, 0)
                part3.Size = Vector3.new(1000, 5, 1000)
                part3.Anchored = true
                part3.Name = "Keaths Platform"
                part3.CollisionGroupId = 5
                part3.Parent = Workspace

                while QC.Auto do
                    task.wait(0.1)
                    local chr = LocalPlayer.Character
                    if chr and chr:FindFirstChild("Humanoid") and chr.Humanoid.SeatPart then
                        local car = chr.Humanoid.SeatPart.Parent.Parent
                        pcall(function()
                            car:PivotTo(CFrame.new(0, 0, 0))
                            task.wait(0.81)
                            car:PivotTo(part.CFrame)
                            task.wait(1)
                            car:PivotTo(part2.CFrame)
                            task.wait(1)
                            car:PivotTo(part3.CFrame)
                        end)
                    end
                end
            end)
        end
    end
})

QC.buyer = false
qcSection1:Toggle({
    Title = "自动建造",
    Desc = "自动购买建筑升级",
    Value = false,
    Callback = function(state)
        QC.buyer = state
        if state then
            task.spawn(function()
                while QC.buyer do
                    task.wait()
                    local function plot()
                        for i, v in pairs(Workspace.Tycoons:GetDescendants()) do
                            if v.Name == "Owner" and v.ClassName == "StringValue" and v.Value == LocalPlayer.Name then
                                return v.Parent
                            end
                        end
                        return nil
                    end
                    pcall(function()
                        local tycoon = plot()
                        if tycoon and tycoon:FindFirstChild("Dealership") and tycoon.Dealership:FindFirstChild("Purchases") then
                            for i, v in pairs(tycoon.Dealership.Purchases:GetChildren()) do
                                if QC.buyer and v:FindFirstChild("TycoonButton") and v.TycoonButton:FindFirstChild("Button") and v.TycoonButton.Button.Transparency == 0 then
                                    ReplicatedStorage.Remotes.Build:FireServer("BuyItem", v.Name)
                                    task.wait(0.3)
                                end
                            end
                        end
                    end)
                end
            end)
        end
    end
})

-- 比赛功能
QC.season = false
qcSection2:Toggle({
    Title = "自动完成赛季11比赛",
    Desc = "自动完成赛季11比赛",
    Value = false,
    Callback = function(state)
        QC.season = state
        if state then
            task.spawn(function()
                while QC.season do
                    local checkpoints = Workspace:FindFirstChild("Races") and Workspace.Races:FindFirstChild("Season") and Workspace.Races.Season:FindFirstChild("Checkpoints")
                    if checkpoints then
                        for i, v in pairs(checkpoints:GetDescendants()) do
                            if v.Name == "IsActive" and v.Value == true then
                                local chr = LocalPlayer.Character
                                if chr and chr:FindFirstChild("Humanoid") and chr.Humanoid.SeatPart then
                                    local car = chr.Humanoid.SeatPart.Parent.Parent
                                    pcall(function()
                                        if v.Parent.Name ~= "20" then
                                            car:PivotTo(CFrame.new(v.Parent.Checkpoint.Position))
                                        else
                                            car:PivotTo(CFrame.new(v.Parent.Checkpoint.Position))
                                            task.wait(0.2)
                                            car:PivotTo(CFrame.new(v.Parent.Parent.Parent.GoalPart.Position))
                                        end
                                    end)
                                end
                                task.wait(0.2)
                            end
                        end
                    end
                    task.wait(0.5)
                end
            end)
        end
    end
})

QC.oval = false
qcSection2:Toggle({
    Title = "自动完成圆形赛",
    Desc = "自动完成圆形赛",
    Value = false,
    Callback = function(state)
        QC.oval = state
        if state then
            task.spawn(function()
                while QC.oval do
                    local checkpoints = Workspace:FindFirstChild("Races") and Workspace.Races:FindFirstChild("Race") and Workspace.Races.Race:FindFirstChild("Oval") and Workspace.Races.Race.Oval:FindFirstChild("Checkpoints")
                    if checkpoints then
                        for i, v in pairs(checkpoints:GetDescendants()) do
                            if v.Name == "IsActive" and v.Value == true then
                                local chr = LocalPlayer.Character
                                if chr and chr:FindFirstChild("Humanoid") and chr.Humanoid.SeatPart then
                                    local car = chr.Humanoid.SeatPart.Parent.Parent
                                    pcall(function()
                                        if v.Parent.Name ~= "4" then
                                            car:PivotTo(CFrame.new(v.Parent.Checkpoint.Position))
                                        else
                                            car:PivotTo(CFrame.new(v.Parent.Checkpoint.Position))
                                            task.wait(0.2)
                                            car:PivotTo(CFrame.new(v.Parent.Parent.Parent.GoalPart.Position))
                                        end
                                    end)
                                end
                                task.wait(0.2)
                            end
                        end
                    end
                    task.wait(0.5)
                end
            end)
        end
    end
})

QC.gokart = false
qcSection2:Toggle({
    Title = "自动完成卡丁车赛",
    Desc = "自动完成卡丁车赛",
    Value = false,
    Callback = function(state)
        QC.gokart = state
        if state then
            task.spawn(function()
                while QC.gokart do
                    local checkpoints = Workspace:FindFirstChild("Races") and Workspace.Races:FindFirstChild("Race") and Workspace.Races.Race:FindFirstChild("Gokart") and Workspace.Races.Race.Gokart:FindFirstChild("Checkpoints")
                    if checkpoints then
                        for i, v in pairs(checkpoints:GetDescendants()) do
                            if v.Name == "IsActive" and v.Value == true then
                                local chr = LocalPlayer.Character
                                if chr and chr:FindFirstChild("Humanoid") and chr.Humanoid.SeatPart then
                                    local car = chr.Humanoid.SeatPart.Parent.Parent
                                    pcall(function()
                                        if v.Parent.Name ~= "9" then
                                            car:PivotTo(CFrame.new(v.Parent.Checkpoint.Position))
                                        else
                                            car:PivotTo(CFrame.new(v.Parent.Checkpoint.Position))
                                            task.wait(0.2)
                                            car:PivotTo(CFrame.new(v.Parent.Parent.Parent.GoalPart.Position))
                                        end
                                    end)
                                end
                                task.wait(0.2)
                            end
                        end
                    end
                    task.wait(0.5)
                end
            end)
        end
    end
})

QC.circuit = false
qcSection2:Toggle({
    Title = "自动完成转圈赛",
    Desc = "自动完成转圈赛",
    Value = false,
    Callback = function(state)
        QC.circuit = state
        if state then
            task.spawn(function()
                while QC.circuit do
                    local checkpoints = Workspace:FindFirstChild("Races") and Workspace.Races:FindFirstChild("Race") and Workspace.Races.Race:FindFirstChild("Circuit") and Workspace.Races.Race.Circuit:FindFirstChild("Checkpoints")
                    if checkpoints then
                        for i, v in pairs(checkpoints:GetDescendants()) do
                            if v.Name == "IsActive" and v.Value == true then
                                local chr = LocalPlayer.Character
                                if chr and chr:FindFirstChild("Humanoid") and chr.Humanoid.SeatPart then
                                    local car = chr.Humanoid.SeatPart.Parent.Parent
                                    pcall(function()
                                        if v.Parent.Name ~= "13" then
                                            car:PivotTo(CFrame.new(v.Parent.Checkpoint.Position))
                                        else
                                            car:PivotTo(CFrame.new(v.Parent.Checkpoint.Position))
                                            task.wait(0.2)
                                            car:PivotTo(CFrame.new(v.Parent.Parent.Parent.GoalPart.Position))
                                        end
                                    end)
                                end
                                task.wait(0.2)
                            end
                        end
                    end
                    task.wait(0.5)
                end
            end)
        end
    end
})

QC.racetest3 = false
qcSection2:Toggle({
    Title = "自动完成漂移赛",
    Desc = "自动完成漂移赛",
    Value = false,
    Callback = function(state)
        QC.racetest3 = state
        if not state then
            local distance = math.huge
            local partvelo = nil
            for a, b in pairs(Workspace.DriftTrack:GetDescendants()) do
                if b.Name == "DriftAsphalt" and b.Parent.Name == "Model" then
                    local Dist = (Vector3.new(-2567.529296875, 601.9335327148438, 2018.6964111328125) - b.Position).magnitude
                    if Dist < distance then
                        distance = Dist
                        partvelo = b
                    end
                end
            end
            if partvelo then
                partvelo.Velocity = LocalPlayer.Character.HumanoidRootPart.CFrame.LookVector * 0
            end
        end
        if state then
            task.spawn(function()
                local partvelo = nil
                while QC.racetest3 do
                    task.wait()
                    if LocalPlayer.PlayerGui:FindFirstChild("Menu") and LocalPlayer.PlayerGui.Menu:FindFirstChild("Race") and LocalPlayer.PlayerGui.Menu.Race.Visible == false then
                        local chr = LocalPlayer.Character
                        if chr and chr:FindFirstChild("Humanoid") and chr.Humanoid.SeatPart then
                            local car = chr.Humanoid.SeatPart.Parent.Parent
                            pcall(function()
                                car:PivotTo(CFrame.new(-2502.25146484375, 601.9251708984375, 2013.3966064453125))
                                car.Engine.Velocity = Vector3.new(0, 0, 0)
                                chr.Head.Anchored = true
                                car.Engine.Velocity = Vector3.new(0, 0, 0)
                                task.wait(1)
                                car.Engine.Velocity = Vector3.new(0, 0, 0)
                                chr.Head.Anchored = false
                                car.Engine.Velocity = Vector3.new(0, 0, 0)
                                task.wait(1)
                                local raceHandler = Workspace:FindFirstChild("Races") and Workspace.Races:FindFirstChild("RaceHandler")
                                if raceHandler and raceHandler:FindFirstChild("StartLobby") then
                                    raceHandler.StartLobby:FireServer("Drift")
                                end
                                partvelo = nil
                                repeat
                                    task.wait()
                                    if LocalPlayer:DistanceFromCharacter(Vector3.new(-2502.25146484375, 601.9251708984375, 2013.3966064453125)) > 10 then
                                        car:PivotTo(CFrame.new(-2502.25146484375, 601.9251708984375, 2013.3966064453125))
                                        car.Engine.Velocity = Vector3.new(0, 0, 0)
                                        task.wait(0.1)
                                        if raceHandler and raceHandler:FindFirstChild("StartLobby") then
                                            raceHandler.StartLobby:FireServer("Drift")
                                        end
                                    end
                                until LocalPlayer.PlayerGui:FindFirstChild("Menu") and LocalPlayer.PlayerGui.Menu:FindFirstChild("Race") and LocalPlayer.PlayerGui.Menu.Race.Visible == true or QC.racetest3 == false
                            end)
                        end
                    elseif LocalPlayer.PlayerGui:FindFirstChild("Menu") and LocalPlayer.PlayerGui.Menu:FindFirstChild("Race") and LocalPlayer.PlayerGui.Menu.Race.Visible == true then
                        if partvelo == nil then
                            local distance = math.huge
                            for a, b in pairs(Workspace.DriftTrack:GetDescendants()) do
                                if b.Name == "DriftAsphalt" and b.Parent.Name == "Model" then
                                    local Dist = (Vector3.new(-2567.529296875, 601.9335327148438, 2018.6964111328125) - b.Position).magnitude
                                    if Dist < distance then
                                        distance = Dist
                                        partvelo = b
                                    end
                                end
                            end
                            if partvelo then
                                partvelo.Velocity = LocalPlayer.Character.HumanoidRootPart.CFrame.LookVector * 1000
                            end
                        end
                        if partvelo and LocalPlayer:DistanceFromCharacter(partvelo.Position) > 10 then
                            local chr = LocalPlayer.Character
                            if chr and chr:FindFirstChild("Humanoid") and chr.Humanoid.SeatPart then
                                local car = chr.Humanoid.SeatPart.Parent.Parent
                                pcall(function()
                                    car:PivotTo(partvelo.CFrame)
                                end)
                            end
                        end
                        task.wait()
                    end
                end
            end)
        end
    end
})

QC.police = false
qcSection2:Toggle({
    Title = "自动完成警察抓小偷赛",
    Desc = "自动完成警察抓小偷赛",
    Value = false,
    Callback = function(state)
        QC.police = state
        if state then
            task.spawn(function()
                while QC.police do
                    local checkpoints = Workspace:FindFirstChild("Races") and Workspace.Races:FindFirstChild("Police") and Workspace.Races.Police:FindFirstChild("Checkpoints")
                    if checkpoints then
                        for i, v in pairs(checkpoints:GetDescendants()) do
                            if v.Name == "IsActive" and v.Value == true then
                                local chr = LocalPlayer.Character
                                if chr and chr:FindFirstChild("Humanoid") and chr.Humanoid.SeatPart then
                                    local car = chr.Humanoid.SeatPart.Parent.Parent
                                    pcall(function()
                                        if v.Parent.Name ~= "18" then
                                            car:PivotTo(CFrame.new(v.Parent.Checkpoint.Position))
                                        else
                                            car:PivotTo(CFrame.new(v.Parent.Checkpoint.Position))
                                            task.wait(0.2)
                                            car:PivotTo(CFrame.new(v.Parent.Parent.Parent.GoalPart.Position))
                                        end
                                    end)
                                end
                                task.wait(0.2)
                            end
                        end
                    end
                    task.wait(0.5)
                end
            end)
        end
    end
})

QC.city = false
qcSection2:Toggle({
    Title = "自动完成城市赛",
    Desc = "自动完成城市赛",
    Value = false,
    Callback = function(state)
        QC.city = state
        if state then
            task.spawn(function()
                while QC.city do
                    local checkpoints = Workspace:FindFirstChild("Races") and Workspace.Races:FindFirstChild("City") and Workspace.Races.City:FindFirstChild("City") and Workspace.Races.City.City:FindFirstChild("Checkpoints")
                    if checkpoints then
                        for i, v in pairs(checkpoints:GetDescendants()) do
                            if v.Name == "IsActive" and v.Value == true then
                                local chr = LocalPlayer.Character
                                if chr and chr:FindFirstChild("Humanoid") and chr.Humanoid.SeatPart then
                                    local car = chr.Humanoid.SeatPart.Parent.Parent
                                    pcall(function()
                                        if v.Parent.Name ~= "17" then
                                            car:PivotTo(CFrame.new(v.Parent.Checkpoint.Position))
                                        else
                                            car:PivotTo(CFrame.new(v.Parent.Checkpoint.Position))
                                            task.wait(0.2)
                                            car:PivotTo(CFrame.new(v.Parent.Parent.Parent.GoalPart.Position))
                                        end
                                    end)
                                end
                                task.wait(0.2)
                            end
                        end
                    end
                    task.wait(0.5)
                end
            end)
        end
    end
})

QC.highway = false
qcSection2:Toggle({
    Title = "自动完成公路赛",
    Desc = "自动完成公路赛",
    Value = false,
    Callback = function(state)
        QC.highway = state
        if state then
            task.spawn(function()
                while QC.highway do
                    local checkpoints = Workspace:FindFirstChild("Races") and Workspace.Races:FindFirstChild("City") and Workspace.Races.City:FindFirstChild("Highway") and Workspace.Races.City.Highway:FindFirstChild("Checkpoints")
                    if checkpoints then
                        for i, v in pairs(checkpoints:GetDescendants()) do
                            if v.Name == "IsActive" and v.Value == true then
                                local chr = LocalPlayer.Character
                                if chr and chr:FindFirstChild("Humanoid") and chr.Humanoid.SeatPart then
                                    local car = chr.Humanoid.SeatPart.Parent.Parent
                                    pcall(function()
                                        if v.Parent.Name ~= "23" then
                                            car:PivotTo(CFrame.new(v.Parent.Checkpoint.Position))
                                        else
                                            car:PivotTo(CFrame.new(v.Parent.Checkpoint.Position))
                                            task.wait(0.2)
                                            car:PivotTo(CFrame.new(v.Parent.Parent.Parent.GoalPart.Position))
                                        end
                                    end)
                                end
                                task.wait(0.2)
                            end
                        end
                    end
                    task.wait(0.5)
                end
            end)
        end
    end
})

QC.mountain = false
qcSection2:Toggle({
    Title = "自动完成山脉赛",
    Desc = "自动完成山脉赛",
    Value = false,
    Callback = function(state)
        QC.mountain = state
        if state then
            task.spawn(function()
                while QC.mountain do
                    local checkpoints = Workspace:FindFirstChild("Races") and Workspace.Races:FindFirstChild("Mountain") and Workspace.Races.Mountain:FindFirstChild("Checkpoints")
                    if checkpoints then
                        for i, v in pairs(checkpoints:GetDescendants()) do
                            if v.Name == "IsActive" and v.Value == true then
                                local chr = LocalPlayer.Character
                                if chr and chr:FindFirstChild("Humanoid") and chr.Humanoid.SeatPart then
                                    local car = chr.Humanoid.SeatPart.Parent.Parent
                                    pcall(function()
                                        if v.Parent.Name ~= "26" then
                                            car:PivotTo(CFrame.new(v.Parent.Checkpoint.Position))
                                        else
                                            car:PivotTo(CFrame.new(v.Parent.Checkpoint.Position))
                                            task.wait(0.2)
                                            car:PivotTo(CFrame.new(v.Parent.Parent.Parent.GoalPart.Position))
                                        end
                                    end)
                                end
                                task.wait(0.2)
                            end
                        end
                    end
                    task.wait(0.5)
                end
            end)
        end
    end
})

QC.Sponge = false
qcSection2:Toggle({
    Title = "自动完成海绵赛",
    Desc = "自动完成海绵宝宝赛",
    Value = false,
    Callback = function(state)
        QC.Sponge = state
        if state then
            task.spawn(function()
                while QC.Sponge do
                    local chr = LocalPlayer.Character
                    if chr and chr:FindFirstChild("Humanoid") and chr.Humanoid.SeatPart then
                        local car = chr.Humanoid.SeatPart.Parent.Parent
                        local spongeRace = Workspace:FindFirstChild("Races") and Workspace.Races:FindFirstChild("SpongeBobRace")
                        if spongeRace and spongeRace:FindFirstChild("Checkpoints") then
                            pcall(function()
                                car:PivotTo(spongeRace.Checkpoints["1"].Checkpoint.CFrame)
                                task.wait(1)
                                car:PivotTo(spongeRace.Checkpoints["2"].Checkpoint.CFrame)
                                task.wait(0.1)
                                car:PivotTo(spongeRace.Checkpoints["3"].Checkpoint.CFrame)
                                task.wait(1)
                                car:PivotTo(spongeRace.Checkpoints["4"].Checkpoint.CFrame)
                                task.wait(0.1)
                                car:PivotTo(spongeRace.Checkpoints["5"].Checkpoint.CFrame)
                                task.wait(1)
                                car:PivotTo(spongeRace.Checkpoints["6"].Checkpoint.CFrame)
                                task.wait(0.1)
                                car:PivotTo(spongeRace.Checkpoints["7"].Checkpoint.CFrame)
                                task.wait(1)
                                car:PivotTo(spongeRace.Checkpoints["8"].Checkpoint.CFrame)
                                car:PivotTo(spongeRace.Checkpoints["9"].Checkpoint.CFrame)
                                task.wait(1)
                                car:PivotTo(spongeRace.Checkpoints["10"].Checkpoint.CFrame)
                                task.wait(0.2)
                            end)
                        end
                    end
                    task.wait(0.5)
                end
            end)
        end
    end
})

-- ============================================================
-- ==================== 成为乞丐 ====================
-- ============================================================
local BG = {}

BG.currentLanguage = "Chinese"
BG.languageChanged = false

local Translations = {
    ["功能"] = "Features",
    ["语言设置"] = "Language Settings",
    ["自动乞讨"] = "Auto Beg",
    ["自动购买员工"] = "Auto Buy Employees",
    ["自动升级"] = "Auto Upgrade",
    ["金钱光环"] = "Money Aura",
    ["当前语言"] = "Current Language",
    ["中文"] = "Chinese",
    ["英文"] = "English",
    ["应用语言"] = "Apply Language",
    ["语言更改"] = "Language Change",
    ["成功"] = "Success",
    ["语言"] = "Language",
    ["当前语言已经是"] = "Current language is already",
    ["请重启脚本以使更改生效"] = "Please restart the script for changes to take effect"
}

local function translateText(text)
    if not text or type(text) ~= "string" then return text end
    if BG.currentLanguage == "English" then
        return Translations[text] or text
    else
        for cn, en in pairs(Translations) do
            if text == en then
                return cn
            end
        end
        return text
    end
end

local function translateGUI(gui)
    if (gui:IsA("TextLabel") or gui:IsA("TextButton") or gui:IsA("TextBox")) then
        pcall(function()
            local text = gui.Text
            if text and text ~= "" then
                local translatedText = translateText(text)
                if translatedText ~= text then
                    gui.Text = translatedText
                end
            end
        end)
    end
end

local function scanAndTranslate()
    for _, gui in ipairs(game:GetService("CoreGui"):GetDescendants()) do
        translateGUI(gui)
    end
    if LocalPlayer and LocalPlayer:FindFirstChild("PlayerGui") then
        for _, gui in ipairs(LocalPlayer.PlayerGui:GetDescendants()) do
            translateGUI(gui)
        end
    end
end

local function setupDescendantListener(parent)
    parent.DescendantAdded:Connect(function(descendant)
        if descendant:IsA("TextLabel") or descendant:IsA("TextButton") or descendant:IsA("TextBox") then
            task.wait(0.1)
            translateGUI(descendant)
        end
    end)
end

local function setupTranslationEngine()
    pcall(setupDescendantListener, game:GetService("CoreGui"))
    if LocalPlayer and LocalPlayer:FindFirstChild("PlayerGui") then
        pcall(setupDescendantListener, LocalPlayer.PlayerGui)
    end
    scanAndTranslate()
    while true do
        scanAndTranslate()
        task.wait(3)
    end
end

task.spawn(function()
    task.wait(2)
    setupTranslationEngine()
end)

local bgLangSection = Tabs.ChengWeiQiGai:Section({ Title = "语言设置" })
bgLangSection:Dropdown({
    Title = "当前语言",
    Values = {"中文", "English"},
    Value = "中文",
    Callback = function(option)
        if option == "English" then
            BG.currentLanguage = "English"
        else
            BG.currentLanguage = "Chinese"
        end
        BG.languageChanged = true
    end
})

bgLangSection:Button({
    Title = "应用语言",
    Callback = function()
        if BG.languageChanged then
            WindUI:Notify({
                Title = "语言更改",
                Content = "请重启脚本以使更改生效",
                Duration = 5,
                Icon = "info"
            })
            BG.languageChanged = false
        else
            WindUI:Notify({
                Title = "语言",
                Content = "当前语言已经是 " .. BG.currentLanguage,
                Duration = 3,
                Icon = "info"
            })
        end
    end
})

local bgFeatureSection = Tabs.ChengWeiQiGai:Section({ Title = "功能" })

BG.AutoFastMoney = false
bgFeatureSection:Toggle({
    Title = "自动乞讨",
    Desc = "自动乞讨获取金钱",
    Value = false,
    Callback = function(state)
        BG.AutoFastMoney = state
        if state then
            task.spawn(function()
                local bases = Workspace:FindFirstChild("Bases")
                local rs = ReplicatedStorage
                if not bases or not rs then return end
                local ev = rs:FindFirstChild("Remotes") and rs.Remotes:FindFirstChild("MinigameEvent")
                if not ev then return end

                local function findBase()
                    for _, b in pairs(bases:GetChildren()) do
                        local o = b:FindFirstChild("Owner")
                        if o then
                            local v = o.Value
                            if v == LocalPlayer or tostring(v) == LocalPlayer.Name or tonumber(v) == LocalPlayer.UserId then
                                return b
                            end
                        end
                    end
                    return nil
                end

                local b = findBase()
                if b then
                    local beg = b:FindFirstChild("BegPrompt")
                    if beg then
                        local prompt = beg:FindFirstChild("ProximityPrompt")
                        if prompt then
                            local char = getCharacter()
                            if char and char:FindFirstChild("HumanoidRootPart") then
                                char.HumanoidRootPart.CFrame = beg.CFrame + Vector3.new(0, 3, 0)
                                fireproximityprompt(prompt)
                            end
                            while BG.AutoFastMoney do
                                RunService.RenderStepped:Wait()
                                ev:FireServer(true)
                            end
                        end
                    end
                end
            end)
        end
    end
})

BG.AutoBuyEmployees = false
bgFeatureSection:Toggle({
    Title = "自动购买员工",
    Desc = "自动购买所有员工",
    Value = false,
    Callback = function(state)
        BG.AutoBuyEmployees = state
        if state then
            task.spawn(function()
                local BuyEmployee = ReplicatedStorage:FindFirstChild("Remotes") and ReplicatedStorage.Remotes:FindFirstChild("BuyEmployee")
                if not BuyEmployee then return end
                while BG.AutoBuyEmployees do
                    for i = 1, 75 do
                        if i ~= 13 and i ~= 14 then
                            BuyEmployee:FireServer(i)
                            task.wait(0.3)
                        end
                    end
                    task.wait(0.5)
                end
            end)
        end
    end
})

BG.AutoBuyUpgrades = false
bgFeatureSection:Toggle({
    Title = "自动升级",
    Desc = "自动升级所有项目",
    Value = false,
    Callback = function(state)
        BG.AutoBuyUpgrades = state
        if state then
            task.spawn(function()
                local Upgrade = ReplicatedStorage:FindFirstChild("Remotes") and ReplicatedStorage.Remotes:FindFirstChild("Upgrade")
                if not Upgrade then return end
                while BG.AutoBuyUpgrades do
                    task.wait(0.1)
                    Upgrade:FireServer("Beg Power")
                    Upgrade:FireServer("Income")
                    Upgrade:FireServer("Box Tier")
                    Upgrade:FireServer("Alley Tier")
                end
            end)
        end
    end
})

BG.MoneyAura = false
bgFeatureSection:Toggle({
    Title = "金钱光环",
    Desc = "自动收集金钱",
    Value = false,
    Callback = function(state)
        BG.MoneyAura = state
        if state then
            task.spawn(function()
                local Money = Workspace:FindFirstChild("Money")
                if not Money then return end
                while BG.MoneyAura do
                    local char = getCharacter()
                    if char and char:FindFirstChild("HumanoidRootPart") then
                        local HRP = char.HumanoidRootPart
                        local OldCFrame = HRP.CFrame
                        for _, v in pairs(Money:GetDescendants()) do
                            if v:IsA("ProximityPrompt") and v.Parent and v.Parent:IsA("BasePart") then
                                HRP.CFrame = v.Parent.CFrame + Vector3.new(0, 3, 0)
                                fireproximityprompt(v, 0, true)
                            end
                        end
                        HRP.CFrame = OldCFrame
                    end
                    task.wait(0.5)
                end
            end)
        end
    end
})

-- ============================================================
-- ==================== 在超市生活一周 ====================
-- ============================================================
local CS = {}
local csSection = Tabs.ZaiChaoShi:Section({ Title = "自动收集功能" })

CS.collectFood = false
csSection:Toggle({
    Title = "自动收集食物",
    Value = false,
    Callback = function(state)
        CS.collectFood = state
        if state then
            task.spawn(function()
                while CS.collectFood do
                    for _, v in next, Workspace.Map.Util.Items:GetChildren() do
                        if v.ToolStats and v.ToolStats.ItemType and v.ToolStats.ItemType.Value == "Food" then
                            ReplicatedStorage.Remotes.RequestPickupItem:FireServer(v)
                        end
                    end
                    task.wait()
                end
            end)
        end
    end
})

CS.collectFlashlight = false
csSection:Toggle({
    Title = "自动收集手电筒",
    Value = false,
    Callback = function(state)
        CS.collectFlashlight = state
        if state then
            task.spawn(function()
                while CS.collectFlashlight do
                    for _, v in next, Workspace.Map.Util.Items:GetChildren() do
                        if v.ToolStats and v.ToolStats.ItemType and v.ToolStats.ItemType.Value == "Flashlight" then
                            ReplicatedStorage.Remotes.RequestPickupItem:FireServer(v)
                        end
                    end
                    task.wait()
                end
            end)
        end
    end
})

CS.collectMelee = false
csSection:Toggle({
    Title = "自动收集近战武器",
    Value = false,
    Callback = function(state)
        CS.collectMelee = state
        if state then
            task.spawn(function()
                while CS.collectMelee do
                    for _, v in next, Workspace.Map.Util.Items:GetChildren() do
                        if v.ToolStats and v.ToolStats.ItemType and v.ToolStats.ItemType.Value == "Melee" then
                            ReplicatedStorage.Remotes.RequestPickupItem:FireServer(v)
                        end
                    end
                    task.wait()
                end
            end)
        end
    end
})

CS.collectGun = false
csSection:Toggle({
    Title = "自动收集枪",
    Value = false,
    Callback = function(state)
        CS.collectGun = state
        if state then
            task.spawn(function()
                while CS.collectGun do
                    for _, v in next, Workspace.Map.Util.Items:GetChildren() do
                        if v.ToolStats and v.ToolStats.ItemType and v.ToolStats.ItemType.Value == "Gun" then
                            ReplicatedStorage.Remotes.RequestPickupItem:FireServer(v)
                        end
                    end
                    task.wait()
                end
            end)
        end
    end
})

CS.collectHealth = false
csSection:Toggle({
    Title = "自动收集药品",
    Value = false,
    Callback = function(state)
        CS.collectHealth = state
        if state then
            task.spawn(function()
                while CS.collectHealth do
                    for _, v in next, Workspace.Map.Util.Items:GetChildren() do
                        if v.ToolStats and v.ToolStats.ItemType and v.ToolStats.ItemType.Value == "Health" then
                            ReplicatedStorage.Remotes.RequestPickupItem:FireServer(v)
                        end
                    end
                    task.wait()
                end
            end)
        end
    end
})

CS.autoReload = false
csSection:Toggle({
    Title = "自动装弹",
    Value = false,
    Callback = function(state)
        CS.autoReload = state
        if state then
            task.spawn(function()
                while CS.autoReload do
                    ReplicatedStorage.Remotes.Weapon.GunReloaded:FireServer(nil, 1)
                    task.wait()
                end
            end)
        end
    end
})

CS.autoShoot = false
csSection:Toggle({
    Title = "自动开枪",
    Value = false,
    Callback = function(state)
        CS.autoShoot = state
        if state then
            task.spawn(function()
                while CS.autoShoot do
                    for _, v in next, LocalPlayer.Backpack:GetChildren() do
                        if v:FindFirstChild("ToolStats") and v.ToolStats:FindFirstChild("Ammo") then
                            for _, e in next, Workspace.Enemies:GetChildren() do
                                if e and e:FindFirstChild("Humanoid") and e.Humanoid.Health > 0 then
                                    local BulletsPerShot = v.ToolStats.BulletsPerShot.Value
                                    local DirectionTbl = {}
                                    for i = 1, BulletsPerShot do
                                        table.insert(DirectionTbl, Vector3.new(e.Head.Position.X, e.Head.Position.Y, e.Head.Position.Z).Unit)
                                    end
                                    local args = {
                                        [1] = {
                                            ["FiringPlayer"] = LocalPlayer,
                                            ["FiredTime"] = os.time(),
                                            ["FiringPlayerUserId"] = LocalPlayer.UserId,
                                            ["Origin"] = Vector3.new(LocalPlayer.Character:GetPivot().Position),
                                            ["UID"] = LocalPlayer.UserId .. "_1",
                                            ["WeaponInstance"] = v,
                                            ["ThisBulletProperties"] = {
                                                ["BulletSpread"] = v.ToolStats.BulletSpread.Value,
                                                ["BulletsPerShot"] = v.ToolStats.BulletsPerShot.Value,
                                                ["BulletPenetration"] = v.ToolStats.BulletPenetration.Value,
                                                ["BulletSpeed"] = v.ToolStats.BulletSpeed.Value,
                                                ["FireSound"] = v.ToolStats.FireSound.Value,
                                                ["BulletSize"] = v.ToolStats.BulletSize.Value
                                            },
                                            ["DirectionTbl"] = DirectionTbl
                                        }
                                    }
                                    ReplicatedStorage.Remotes.Weapon.GunFired:FireServer(unpack(args))
                                end
                            end
                        end
                    end
                    task.wait()
                end
            end)
        end
    end
})

CS.superGun = false
csSection:Toggle({
    Title = "修改超级枪",
    Value = false,
    Callback = function(state)
        CS.superGun = state
        if state then
            task.spawn(function()
                while CS.superGun do
                    for _, v in next, LocalPlayer.Backpack:GetChildren() do
                        if v.ToolStats and v.ToolStats:FindFirstChild("Ammo") then
                            v.ToolStats.ReloadTime.Value = 0
                            v.ToolStats.FireDelay.Value = 0
                            v.ToolStats.Ammo.Value = math.huge
                            v.ToolStats.Damage.Value = math.huge
                        end
                    end
                    task.wait()
                end
            end)
        end
    end
})

CS.infiniteStats = false
csSection:Toggle({
    Title = "无限体力和饥饿度",
    Value = false,
    Callback = function(state)
        CS.infiniteStats = state
        if state then
            task.spawn(function()
                while CS.infiniteStats do
                    local char = getCharacter()
                    if char and char:FindFirstChild("CharacterData") then
                        char.CharacterData.MaxStamina.Value = math.huge
                        char.CharacterData.MaxEnergy.Value = math.huge
                        char.CharacterData.Energy.Value = char.CharacterData.MaxEnergy.Value
                        char.CharacterData.Stamina.Value = char.CharacterData.MaxStamina.Value
                    end
                    task.wait()
                end
            end)
        end
    end
})

CS.nightHide = false
csSection:Toggle({
    Title = "夜晚自动躲避",
    Value = false,
    Callback = function(state)
        CS.nightHide = state
        if state then
            task.spawn(function()
                local oldpos = nil
                while CS.nightHide do
                    if ReplicatedStorage.GameInfo.TimeOfDay.Value == "Night" then
                        oldpos = LocalPlayer.Character:GetPivot().Position
                        repeat
                            task.wait()
                            LocalPlayer.Character:PivotTo(CFrame.new(306.18927001953125, 36.67450714111328, -519.2435913085938))
                            if LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                                LocalPlayer.Character.HumanoidRootPart.Anchored = true
                            end
                        until ReplicatedStorage.GameInfo.TimeOfDay.Value ~= "Night"
                        if LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                            LocalPlayer.Character.HumanoidRootPart.Anchored = false
                        end
                        if oldpos then
                            LocalPlayer.Character:PivotTo(CFrame.new(oldpos))
                        end
                    else
                        task.wait()
                    end
                end
            end)
        end
    end
})

-- ============================================================
-- ==================== 元素力量大亨 ====================
-- ============================================================
local YS = {}
local ysSection = Tabs.YuanSuLiLiang:Section({ Title = "自动功能" })

YS.autobuild = false
ysSection:Toggle({
    Title = "自动建造",
    Value = false,
    Callback = function(state)
        YS.autobuild = state
        if state then
            task.spawn(function()
                while YS.autobuild do
                    for _, v in next, Workspace.Tycoons:GetChildren() do
                        if v.Name == LocalPlayer.Name then
                            for _, a in next, v.Buttons:GetChildren() do
                                if a.Button and a.Button.Color == Color3.fromRGB(0, 127, 0) then
                                    local char = getCharacter()
                                    if char and char:FindFirstChild("HumanoidRootPart") then
                                        char.HumanoidRootPart.CFrame = a.Button.CFrame
                                    end
                                end
                            end
                        end
                    end
                    task.wait()
                end
            end)
        end
    end
})

YS.autocollect = false
ysSection:Toggle({
    Title = "自动收集钱",
    Value = false,
    Callback = function(state)
        YS.autocollect = state
        if state then
            task.spawn(function()
                while YS.autocollect do
                    for _, v in next, Workspace.Tycoons:GetChildren() do
                        if v.Name == LocalPlayer.Name then
                            local char = getCharacter()
                            if char and char:FindFirstChild("HumanoidRootPart") then
                                char.HumanoidRootPart.CFrame = v.Auxiliary.Collector.Collect.CFrame
                            end
                        end
                    end
                    task.wait(5)
                end
            end)
        end
    end
})

YS.autocollectcrate = false
ysSection:Toggle({
    Title = "自动收集钱箱",
    Value = false,
    Callback = function(state)
        YS.autocollectcrate = state
        if state then
            task.spawn(function()
                while YS.autocollectcrate do
                    for _, v in next, Workspace:GetChildren() do
                        if v.Name == "BalloonCrate" and v:FindFirstChild("Crate") and v.Crate:FindFirstChild("ProximityPrompt") then
                            local char = getCharacter()
                            if char and char:FindFirstChild("HumanoidRootPart") then
                                char.HumanoidRootPart.CFrame = v.Crate.CFrame
                                fireproximityprompt(v.Crate.ProximityPrompt)
                            end
                        end
                    end
                    task.wait()
                end
            end)
        end
    end
})

YS.autocollectdollar = false
ysSection:Toggle({
    Title = "自动收集boss掉的钱",
    Value = false,
    Callback = function(state)
        YS.autocollectdollar = state
        if state then
            task.spawn(function()
                while YS.autocollectdollar do
                    for _, v in next, Workspace:GetChildren() do
                        if v.Name == "Dollar" then
                            local char = getCharacter()
                            if char and char:FindFirstChild("HumanoidRootPart") then
                                char.HumanoidRootPart.CFrame = v.CFrame
                            end
                        end
                    end
                    task.wait()
                end
            end)
        end
    end
})

YS.autocollectchest = false
ysSection:Toggle({
    Title = "自动收集宝箱",
    Value = false,
    Callback = function(state)
        YS.autocollectchest = state
        if state then
            task.spawn(function()
                while YS.autocollectchest do
                    for _, v in pairs(Workspace.Treasure.Chests:GetChildren()) do
                        if v.Name == "Chest" and v:FindFirstChild("ProximityPrompt") then
                            local char = getCharacter()
                            if char and char:FindFirstChild("HumanoidRootPart") then
                                char.HumanoidRootPart.CFrame = v.CFrame
                                fireproximityprompt(v.ProximityPrompt)
                            end
                        end
                    end
                    task.wait()
                end
            end)
        end
    end
})

ysSection:Button({
    Title = "传送一次中心",
    Callback = function()
        local char = getCharacter()
        if char and char:FindFirstChild("HumanoidRootPart") then
            local oldpos = char.HumanoidRootPart.CFrame
            task.wait(0.5)
            char.HumanoidRootPart.CFrame = Workspace.Map.Center.CFrame
            task.wait(0.3)
            char.HumanoidRootPart.CFrame = oldpos
        end
    end
})

-- ============================================================
-- ==================== 建造你的基地 ====================
-- ============================================================
local JD = {}
local jdSection = Tabs.JianZaoJiDi:Section({ Title = "战斗功能" })

JD.autoPunch = false
jdSection:Toggle({
    Title = "自动挥舞拳头",
    Value = false,
    Callback = function(state)
        JD.autoPunch = state
        if state then
            task.spawn(function()
                while JD.autoPunch do
                    local args = {
                        [1] = true,
                        [2] = Vector3.new(0, 0, 0),
                        [3] = 50,
                        [4] = Enum.Material.Water,
                        [5] = "RangeAttack"
                    }
                    ReplicatedStorage.Remotes.Events.ToolState:FireServer(unpack(args))
                    task.wait()
                end
            end)
        end
    end
})

JD.rangeAttack = false
jdSection:Toggle({
    Title = "范围攻击",
    Value = false,
    Callback = function(state)
        JD.rangeAttack = state
        if state then
            task.spawn(function()
                while JD.rangeAttack do
                    for _, enemy in next, Workspace.Characters:GetChildren() do
                        if enemy:IsA("Model") and enemy:FindFirstChild("HumanoidRootPart") and enemy:FindFirstChild("Humanoid") then
                            if enemy ~= LocalPlayer.Character and enemy.Humanoid.Health > 0 then
                                local char = getCharacter()
                                if char and char:FindFirstChild("HumanoidRootPart") then
                                    local distance = (char.HumanoidRootPart.Position - enemy.HumanoidRootPart.Position).Magnitude
                                    if distance <= 999 then
                                        local args = {
                                            [1] = true,
                                            [2] = enemy.HumanoidRootPart.Position,
                                            [3] = 50,
                                            [4] = Enum.Material.Water,
                                            [5] = "RangeAttack"
                                        }
                                        pcall(function()
                                            ReplicatedStorage.Remotes.Events.ToolState:FireServer(unpack(args))
                                        end)
                                    end
                                end
                            end
                        end
                    end
                    task.wait()
                end
            end)
        end
    end
})

-- ============================================================
-- ==================== 正在寻求 ====================
-- ============================================================
local ZQ = {}
local SCRIPT_URL = "https://raw.githubusercontent.com/YunLua/Lua/refs/heads/main/ATM.lua"
local AUTO_FOLDER = "HB脚本"
local AUTO_RELOAD_FILE = AUTO_FOLDER .. "/auto_reload.txt"
local STATE_FILE = AUTO_FOLDER .. "/atm_state.txt"

if not isfolder(AUTO_FOLDER) then
    makefolder(AUTO_FOLDER)
end

ZQ.ATTACK_REGISTER = true
ZQ.ATTACK_ATM = true
ZQ.RUN = false

if isfile(STATE_FILE) then
    ZQ.RUN = readfile(STATE_FILE) == "1"
end

local function saveState()
    writefile(STATE_FILE, ZQ.RUN and "1" or "0")
end

local zqSection = Tabs.ZhengZaiXunQiu:Section({ Title = "主要功能" })

zqSection:Toggle({
    Title = "打击目标收银机",
    Value = ZQ.ATTACK_REGISTER,
    Callback = function(state)
        ZQ.ATTACK_REGISTER = state
    end
})

zqSection:Toggle({
    Title = "打击目标ATM",
    Value = ZQ.ATTACK_ATM,
    Callback = function(state)
        ZQ.ATTACK_ATM = state
    end
})

zqSection:Toggle({
    Title = "自动打击",
    Desc = "自动寻找目标并打击，未找到自动换服后自动重载",
    Value = ZQ.RUN,
    Callback = function(state)
        ZQ.RUN = state
        saveState()
        if state then
            task.spawn(function()
                local VIM = game:GetService("VirtualInputManager")
                local TeleportService = game:GetService("TeleportService")
                local HttpService = game:GetService("HttpService")
                local GizmosFolder = Workspace.Local.Gizmos.White
                local NO_ATM_TIME = 0
                local SERVER_HOP_TIME = 25
                local RANDOM_POS = {
                    Vector3.new(-1137, 78, -1953),
                    Vector3.new(-44, 63, -2083),
                    Vector3.new(194, 60, -2884),
                    Vector3.new(-412, 106, -1301),
                    Vector3.new(-377, 410, -741),
                    Vector3.new(-985, 380, -1145),
                    Vector3.new(-854, 406, -1505)
                }

                local function getPart(obj)
                    if obj:IsA("BasePart") then return obj end
                    for _, v in ipairs(obj:GetDescendants()) do
                        if v:IsA("BasePart") then
                            return v
                        end
                    end
                end

                local function isATM(obj)
                    local t = obj:GetAttribute("gizmoType")
                    if t == "ATM" and ZQ.ATTACK_ATM then
                        return true
                    elseif t == "Register" and ZQ.ATTACK_REGISTER then
                        return true
                    end
                    return false
                end

                local function getNearestATM()
                    local nearest, dist = nil, math.huge
                    for _, gizmo in ipairs(GizmosFolder:GetChildren()) do
                        if isATM(gizmo) then
                            local part = getPart(gizmo)
                            if part then
                                local char = getCharacter()
                                if char and char:FindFirstChild("HumanoidRootPart") then
                                    local d = (char.HumanoidRootPart.Position - part.Position).Magnitude
                                    if d < dist then
                                        nearest, dist = part, d
                                    end
                                end
                            end
                        end
                    end
                    return nearest
                end

                local function teleportTo(target)
                    local char = getCharacter()
                    if char and char:FindFirstChild("HumanoidRootPart") then
                        if typeof(target) == "Vector3" then
                            char.HumanoidRootPart.CFrame = CFrame.new(target)
                        elseif typeof(target) == "Instance" then
                            char.HumanoidRootPart.CFrame = target.CFrame * CFrame.new(0, 5, 0)
                        end
                    end
                end

                local function pressE(time)
                    local start = tick()
                    while tick() - start < time do
                        VIM:SendKeyEvent(true, Enum.KeyCode.E, false, game)
                        VIM:SendKeyEvent(false, Enum.KeyCode.E, false, game)
                        task.wait(0.05)
                    end
                end

                local function collectATM(atm)
                    local start = tick()
                    while tick() - start < 3 and atm.Parent and not atm:GetAttribute("Collected") do
                        task.wait(0.1)
                    end
                    pressE(1.5)
                end

                local function serverHop()
                    writefile(AUTO_RELOAD_FILE, "1")
                    saveState()
                    local placeId = game.PlaceId
                    local ok, data = pcall(function()
                        local url = ("https://games.roblox.com/v1/games/%d/servers/Public?sortOrder=Asc&limit=100"):format(placeId)
                        return HttpService:JSONDecode(game:HttpGet(url)).data
                    end)
                    if not ok then return end
                    local servers = {}
                    for _, s in pairs(data) do
                        if s.playing < s.maxPlayers and s.id ~= game.JobId then
                            table.insert(servers, s.id)
                        end
                    end
                    if #servers > 0 then
                        TeleportService:TeleportToPlaceInstance(placeId, servers[math.random(#servers)], LocalPlayer)
                    end
                end

                while ZQ.RUN do
                    local atm = getNearestATM()
                    if atm then
                        teleportTo(atm)
                        task.wait(0.3)
                        pressE(1.5)
                        collectATM(atm)
                        NO_ATM_TIME = 0
                    else
                        NO_ATM_TIME = NO_ATM_TIME + 0.7
                        teleportTo(RANDOM_POS[math.random(#RANDOM_POS)])
                        if NO_ATM_TIME >= SERVER_HOP_TIME then
                            warn("25秒未找到目标，正在换服")
                            task.wait(1)
                            ZQ.RUN = false
                            saveState()
                            queue_on_teleport([[
                                loadstring(game:HttpGet("https://raw.githubusercontent.com/YunLua/Lua/refs/heads/main/ATM.lua"))()
                            ]])
                            wait()
                            serverHop()
                            break
                        end
                    end
                    task.wait(0.7)
                end
            end)
        end
    end
})

-- ============================================================
-- ==================== 种植花园 ====================
-- ============================================================
local ZZ = {}
local zzSection = Tabs.ZhongZhiHuaYuan:Section({ Title = "功能" })

ZZ.MaxFruits = 10
zzSection:Slider({
    Title = "售卖要求最低背包数量",
    Desc = "背包数量超过此值才会售卖",
    Value = { Min = 0, Max = 100, Default = 10 },
    Step = 1,
    IsTextbox = true,
    Callback = function(value)
        ZZ.MaxFruits = value
    end
})

ZZ.AutoCollectAndSell = false
zzSection:Toggle({
    Title = "自动收集加售卖",
    Value = false,
    Callback = function(state)
        ZZ.AutoCollectAndSell = state
        if state then
            task.spawn(function()
                while ZZ.AutoCollectAndSell do
                    pcall(function()
                        local char = getCharacter()
                        if char and char:FindFirstChild("HumanoidRootPart") then
                            if #LocalPlayer.Backpack:GetChildren() > ZZ.MaxFruits then
                                local oldpos = char.HumanoidRootPart.CFrame
                                char.HumanoidRootPart.CFrame = Workspace.NPCS["Sell Stands"]["Shop Stand"].CFrame * CFrame.new(0, 0, 3)
                                task.wait(0.5)
                                ReplicatedStorage.GameEvents.Sell_Inventory:FireServer()
                                task.wait(1)
                                char.HumanoidRootPart.CFrame = oldpos
                            end
                            for _, plot in pairs(Workspace.Farm:GetChildren()) do
                                local important = plot:FindFirstChild("Important") or plot:FindFirstChild("Importanert")
                                if important and important:FindFirstChild("Data") and important.Data:FindFirstChild("Owner") then
                                    if important.Data.Owner.Value == LocalPlayer.Name then
                                        for _, prompt in ipairs(important.Plants_Physical:GetDescendants()) do
                                            if prompt:IsA("ProximityPrompt") then
                                                prompt.MaxActivationDistance = math.huge
                                                fireproximityprompt(prompt)
                                            end
                                        end
                                        break
                                    end
                                end
                            end
                        end
                    end)
                    task.wait(1)
                end
            end)
        end
    end
})

ZZ.AutoCollect = false
zzSection:Toggle({
    Title = "自动收集",
    Value = false,
    Callback = function(state)
        ZZ.AutoCollect = state
        if state then
            task.spawn(function()
                while ZZ.AutoCollect do
                    pcall(function()
                        local char = getCharacter()
                        if char and char:FindFirstChild("HumanoidRootPart") then
                            for _, plot in pairs(Workspace.Farm:GetChildren()) do
                                local important = plot:FindFirstChild("Important") or plot:FindFirstChild("Importanert")
                                if important and important:FindFirstChild("Data") and important.Data:FindFirstChild("Owner") then
                                    if important.Data.Owner.Value == LocalPlayer.Name then
                                        for _, prompt in ipairs(important.Plants_Physical:GetDescendants()) do
                                            if prompt:IsA("ProximityPrompt") then
                                                prompt.MaxActivationDistance = math.huge
                                                fireproximityprompt(prompt)
                                            end
                                        end
                                        break
                                    end
                                end
                            end
                        end
                    end)
                    task.wait(1)
                end
            end)
        end
    end
})

ZZ.AutoCollect2 = false
zzSection:Toggle({
    Title = "自动收集2.0",
    Value = false,
    Callback = function(state)
        ZZ.AutoCollect2 = state
        if state then
            task.spawn(function()
                while ZZ.AutoCollect2 do
                    pcall(function()
                        local char = getCharacter()
                        if char and char:FindFirstChild("Humanoid") then
                            for _, plot in pairs(Workspace.Farm:GetChildren()) do
                                local important = plot:FindFirstChild("Important") or plot:FindFirstChild("Importanert")
                                if important and important:FindFirstChild("Data") and important.Data:FindFirstChild("Owner") then
                                    if important.Data.Owner.Value == LocalPlayer.Name then
                                        for _, prompt in ipairs(important.Plants_Physical:GetDescendants()) do
                                            if prompt:IsA("ProximityPrompt") then
                                                char.Humanoid:MoveTo(prompt.Parent.Position)
                                                prompt.MaxActivationDistance = math.huge
                                                fireproximityprompt(prompt)
                                            end
                                        end
                                        break
                                    end
                                end
                            end
                        end
                    end)
                    task.wait(1)
                end
            end)
        end
    end
})

ZZ.AutoSell = false
zzSection:Toggle({
    Title = "自动售卖",
    Value = false,
    Callback = function(state)
        ZZ.AutoSell = state
        if state then
            task.spawn(function()
                while ZZ.AutoSell do
                    pcall(function()
                        local char = getCharacter()
                        if char and char:FindFirstChild("HumanoidRootPart") then
                            if #LocalPlayer.Backpack:GetChildren() > ZZ.MaxFruits then
                                local oldpos = char.HumanoidRootPart.CFrame
                                char.HumanoidRootPart.CFrame = Workspace.NPCS["Sell Stands"]["Shop Stand"].CFrame * CFrame.new(0, 0, 3)
                                task.wait(0.5)
                                ReplicatedStorage.GameEvents.Sell_Item:FireServer()
                                ReplicatedStorage.GameEvents.Sell_Inventory:FireServer()
                                task.wait(1)
                                char.HumanoidRootPart.CFrame = oldpos
                            end
                        end
                    end)
                    task.wait(1)
                end
            end)
        end
    end
})

ZZ.AutoPlant = false
zzSection:Toggle({
    Title = "自动种植",
    Value = false,
    Callback = function(state)
        ZZ.AutoPlant = state
        if state then
            task.spawn(function()
                while ZZ.AutoPlant do
                    pcall(function()
                        local char = getCharacter()
                        if char and char:FindFirstChild("HumanoidRootPart") then
                            local tool = nil
                            local seedType = nil
                            for _, item in ipairs(char:GetChildren()) do
                                if item:IsA("Tool") and item.Name:find("Seed") then
                                    seedType = item.Name:match("^(.-) Seed")
                                    tool = item
                                    break
                                end
                            end
                            if not tool then
                                for _, item in ipairs(LocalPlayer.Backpack:GetChildren()) do
                                    if item:IsA("Tool") and item.Name:find("Seed") then
                                        seedType = item.Name:match("^(.-) Seed")
                                        tool = item
                                        break
                                    end
                                end
                            end
                            if tool and seedType then
                                if tool.Parent == LocalPlayer.Backpack then
                                    char.Humanoid:EquipTool(tool)
                                    repeat task.wait() until tool.Parent == char
                                end
                                ReplicatedStorage.GameEvents.Plant_RE:FireServer(
                                    Vector3.new(math.floor(char.HumanoidRootPart.Position.X), 0.1, math.floor(char.HumanoidRootPart.Position.Z)),
                                    seedType
                                )
                            end
                        end
                    end)
                    task.wait(1)
                end
            end)
        end
    end
})

ZZ.showSeedTimer = false
local seedTimerActive = false
zzSection:Toggle({
    Title = "显示种子刷新时间",
    Value = false,
    Callback = function(state)
        ZZ.showSeedTimer = state
        if state then
            if not seedTimerActive then
                seedTimerActive = true
                local TimeGui = Instance.new("ScreenGui")
                TimeGui.Name = "TimeGui"
                TimeGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
                TimeGui.Parent = game:GetService("CoreGui")

                local TimeLabel = Instance.new("TextLabel")
                TimeLabel.Name = "TimeLabel"
                TimeLabel.BackgroundTransparency = 1
                TimeLabel.BorderColor3 = Color3.new(0, 0, 0)
                TimeLabel.Position = UDim2.new(0.80, 0, 0.00090, 0)
                TimeLabel.Size = UDim2.new(0, 135, 0, 50)
                TimeLabel.Font = Enum.Font.GothamSemibold
                TimeLabel.Text = "种子下次更新时间: "
                TimeLabel.TextColor3 = Color3.new(1, 1, 1)
                TimeLabel.TextScaled = true
                TimeLabel.TextSize = 14
                TimeLabel.TextWrapped = true
                TimeLabel.Parent = TimeGui

                local UIGradient = Instance.new("UIGradient")
                UIGradient.Color = ColorSequence.new{
                    ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 0, 0)),
                    ColorSequenceKeypoint.new(0.10, Color3.fromRGB(255, 127, 0)),
                    ColorSequenceKeypoint.new(0.20, Color3.fromRGB(255, 255, 0)),
                    ColorSequenceKeypoint.new(0.30, Color3.fromRGB(0, 255, 0)),
                    ColorSequenceKeypoint.new(0.40, Color3.fromRGB(0, 255, 255)),
                    ColorSequenceKeypoint.new(0.50, Color3.fromRGB(0, 0, 255)),
                    ColorSequenceKeypoint.new(0.60, Color3.fromRGB(139, 0, 255)),
                    ColorSequenceKeypoint.new(0.70, Color3.fromRGB(255, 0, 0)),
                    ColorSequenceKeypoint.new(0.80, Color3.fromRGB(255, 127, 0)),
                    ColorSequenceKeypoint.new(0.90, Color3.fromRGB(255, 255, 0)),
                    ColorSequenceKeypoint.new(1.00, Color3.fromRGB(0, 255, 0))
                }
                UIGradient.Rotation = 360
                UIGradient.Parent = TimeLabel

                local TweenService = game:GetService("TweenService")
                local tweeninfo = TweenInfo.new(7, Enum.EasingStyle.Linear, Enum.EasingDirection.In, -1)
                local tween = TweenService:Create(UIGradient, tweeninfo, {Rotation = 360})
                tween:Play()

                task.spawn(function()
                    while ZZ.showSeedTimer do
                        task.wait()
                        pcall(function()
                            if LocalPlayer.PlayerGui and LocalPlayer.PlayerGui.Seed_Shop and LocalPlayer.PlayerGui.Seed_Shop.Frame and LocalPlayer.PlayerGui.Seed_Shop.Frame.Frame and LocalPlayer.PlayerGui.Seed_Shop.Frame.Frame.Timer then
                                TimeLabel.Text = "时间: " .. LocalPlayer.PlayerGui.Seed_Shop.Frame.Frame.Timer.Text
                            end
                        end)
                    end
                    TimeGui:Destroy()
                    seedTimerActive = false
                end)
            end
        else
            seedTimerActive = false
        end
    end
})

ZZ.selectedSeed = "Carrot"
zzSection:Dropdown({
    Title = "选择种子",
    Values = {"Carrot", "Strawberry", "Blueberry", "Orange Tulip", "Tomato", "Corn", "Daffodil", "Watermelon", "Pumpkin", "Apple", "Bamboo", "Coconut", "Cactus", "Dragon Fruit", "Mango", "Grape"},
    Value = "Carrot",
    Callback = function(value)
        ZZ.selectedSeed = value
    end
})

ZZ.AutoBuySeeds = false
zzSection:Toggle({
    Title = "自动购买种子",
    Value = false,
    Callback = function(state)
        ZZ.AutoBuySeeds = state
        if state then
            task.spawn(function()
                while ZZ.AutoBuySeeds do
                    pcall(function()
                        ReplicatedStorage.GameEvents.BuySeedStock:FireServer(ZZ.selectedSeed)
                    end)
                    task.wait(0.2)
                end
            end)
        end
    end
})

zzSection:Button({
    Title = "购买种子",
    Callback = function()
        ReplicatedStorage.GameEvents.BuySeedStock:FireServer(ZZ.selectedSeed)
    end
})

ZZ.AutoBuyWateringCan = false
zzSection:Toggle({
    Title = "自动购买水壶",
    Value = false,
    Callback = function(state)
        ZZ.AutoBuyWateringCan = state
        if state then
            task.spawn(function()
                while ZZ.AutoBuyWateringCan do
                    pcall(function()
                        ReplicatedStorage.GameEvents.BuyGearStock:FireServer("Watering Can")
                    end)
                    task.wait(1)
                end
            end)
        end
    end
})

-- ============================================================
-- ==================== 自然灾害 ====================
-- ============================================================
local ZR = {}
local zrSection = Tabs.ZiRanZaiHai:Section({ Title = "功能" })

zrSection:Button({
    Title = "指南针",
    Desc = "要使用的话就必须买指南针",
    Callback = function()
        local p = LocalPlayer
        local r = ReplicatedStorage.Remotes.Compass
        local c = p.Backpack:FindFirstChild("Compass")
        local h = p.Character:FindFirstChild("Humanoid")
        if c and h then
            h:EquipTool(c)
            task.wait()
            r:FireServer("Vote Map", 3)
            r:FireServer("Vote Map", 4)
            task.wait()
            h:UnequipTools()
            WindUI:Notify({
                Title = "通知",
                Content = "加载成功",
                Duration = 1,
                Icon = "check",
            })
        end
    end
})

zrSection:Button({
    Title = "黑洞",
    Desc = "点击加载",
    Callback = function()
        loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Super-ring-Parts-V6-28581"))()
        WindUI:Notify({
            Title = "通知",
            Content = "加载成功",
            Duration = 3,
            Icon = "check",
        })
    end
})

zrSection:Button({
    Title = "物理磁铁",
    Desc = "可以把下面的东西吸上来可以踩",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/cytj777i/6669178/main/%E5%8D%95%E4%B8%80%E7%89%A9%E4%BD%93%E9%A3%9E%E8%A1%8C%E8%BD%BD%E8%87%AA%E5%B7%B1%E6%9C%80%E7%BB%88%E4%BC%98%E5%8C%96%E7%89%88"))()
        WindUI:Notify({
            Title = "通知",
            Content = "加载成功",
            Duration = 1,
            Icon = "check",
        })
    end
})

zrSection:Button({
    Title = "无敌少侠",
    Desc = "用了它，你就会变成城市超人",
    Callback = function()
        loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Invinicible-Flight-R15-45414"))()
        WindUI:Notify({
            Title = "通知",
            Content = "加载成功",
            Duration = 1,
            Icon = "check",
        })
    end
})

zrSection:Button({
    Title = "防止摔跤伤害",
    Desc = "就算掉下去了，也毫发无伤，掉到水里面也会死的",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/cytj777i/Fall-injury/main/%E9%98%B2%E6%AD%A2%E6%91%94%E8%90%BD%E4%BC%A4%E5%AE%B3"))()
        WindUI:Notify({
            Title = "通知",
            Content = "加载成功",
            Duration = 1,
            Icon = "check",
        })
    end
})

-- ============================================================
-- ==================== 最强战场 ====================
-- ============================================================
local ZC = {}
local zcSection = Tabs.ZuiQiangZhanChang:Section({ Title = "战斗功能" })

zcSection:Button({
    Title = "执行连招(Flowing Water + Lethal Whirlwind Stream)",
    Desc = "点击后执行一套连招",
    Callback = function()
        local player = LocalPlayer
        local char = player.Character
        if not char or not char:FindFirstChild("HumanoidRootPart") then return end
        local hrp = char.HumanoidRootPart
        local TweenService = game:GetService("TweenService")

        local args1 = {
            [1] = {
                ["Tool"] = player.Backpack:FindFirstChild("Flowing Water"),
                ["Goal"] = "Console Move"
            }
        }
        char.Communicate:FireServer(unpack(args1))

        task.wait(2.15)

        local forward = hrp.CFrame.LookVector.Unit
        local distance = 20
        local duration = 0.1
        local goalPos = hrp.Position + forward * distance
        local tween = TweenService:Create(hrp, TweenInfo.new(duration), {
            CFrame = CFrame.new(goalPos, goalPos + forward)
        })
        tween:Play()
        tween.Completed:Wait()

        hrp.CFrame = hrp.CFrame * CFrame.Angles(0, math.rad(180), 0)

        local args2 = {
            [1] = {
                ["Tool"] = player.Backpack:FindFirstChild("Lethal Whirlwind Stream"),
                ["Goal"] = "Console Move"
            }
        }
        char.Communicate:FireServer(unpack(args2))

        WindUI:Notify({
            Title = "通知",
            Content = "连招执行成功",
            Duration = 2,
            Icon = "check",
        })
    end
})

-- ============================================================
-- ==================== 躲避标签页 ====================
-- ============================================================
local tp = Tabs.tp:Section({ Title = "躲避" })

tp:Toggle({
    Title = "自动获胜",
    Default = false,
    Callback = function(state)
        ActiveAutoWin = state
        if ActiveAutoWin then
            WindUI:Notify({
                Title = "提示提示",
                Content = "自动获胜已开启",
                Duration = 4
            })
            
            spawn(function()
                while ActiveAutoWin do
                    local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
                    local rootPart = character:FindFirstChild("HumanoidRootPart")

                    if character and rootPart then
                        if character:GetAttribute("Downed") then
                            ReplicatedStorage.Events.Player.ChangePlayerMode:FireServer(true)
                            task.wait(0.5)
                        end

                        if not character:GetAttribute("Downed") then
                            local securityPart = Instance.new("Part")
                            securityPart.Name = "SecurityPartTemp"
                            securityPart.Size = Vector3.new(10, 1, 10)
                            securityPart.Position = Vector3.new(0, 500, 0)
                            securityPart.Anchored = true
                            securityPart.Transparency = 1
                            securityPart.CanCollide = true
                            securityPart.Parent = Workspace

                            rootPart.CFrame = securityPart.CFrame + Vector3.new(0, 3, 0)
                            task.wait(0.5)
                            securityPart:Destroy()
                        end
                    end
                    task.wait(0.1)
                end
            end)
        else
            WindUI:Notify({
                Title = "提示提示",
                Content = "自动获胜已关闭",
                Duration = 4
            })
        end
    end
})

tp:Toggle({
    Title = "自动刷钱",
    Default = false,
    Callback = function(state)
        ActiveAutoFarmMoney = state
        if ActiveAutoFarmMoney then
            WindUI:Notify({
                Title = "提示提示",
                Content = "自动刷钱已开启",
                Duration = 4
            })
            
            spawn(function()
                while ActiveAutoFarmMoney do
                    local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
                    local rootPart = character and character:FindFirstChild("HumanoidRootPart")

                    if character and rootPart then
                        if character:GetAttribute("Downed") then
                            ReplicatedStorage.Events.Player.ChangePlayerMode:FireServer(true)
                            task.wait(0.5)
                        end

                        local downedPlayerFound = false
                        local playersInGame = Workspace:FindFirstChild("Game") and Workspace.Game:FindFirstChild("Players")
                        if playersInGame then
                            for _, v in pairs(playersInGame:GetChildren()) do
                                if v:IsA("Model") and v:FindFirstChildOfClass("Humanoid") and v:GetAttribute("Downed") then
                                    rootPart.CFrame = v.HumanoidRootPart.CFrame + Vector3.new(0, 3, 0)
                                    ReplicatedStorage.Events.Character.Interact:FireServer("Revive", true, v)
                                    task.wait(0.5)
                                    downedPlayerFound = true
                                    break
                                end
                            end
                        end

                        if not downedPlayerFound then
                        
                        end

                        local securityPart = Instance.new("Part")
                        securityPart.Name = "SecurityPartTemp"
                        securityPart.Size = Vector3.new(10, 1, 10)
                        securityPart.Position = Vector3.new(0, 500, 0)
                        securityPart.Anchored = true
                        securityPart.Transparency = 1
                        securityPart.CanCollide = true
                        securityPart.Parent = Workspace
                        rootPart.CFrame = securityPart.CFrame + Vector3.new(0, 3, 0)

                    else
                    
                    end
                    task.wait(1)
                end
            end)
        else
            WindUI:Notify({
                Title = "提示提示",
                Content = "自动刷钱已关闭",
                Duration = 4
            })
        end
    end
})

tp:Toggle({
    Title = "自动复活自己",
    Default = false,
    Callback = function(state)
        autoReviveEnabled = state
        if autoReviveEnabled then
            WindUI:Notify({
                Title = "提示提示",
                Content = "自动复活已开启",
                Duration = 4
            })
        else
            WindUI:Notify({
                Title = "提示提示",
                Content = "自动复活已关闭",
                Duration = 4
            })
        end
    end
})

tp:Button({
    Title = "复活自己",
    Callback = function()
        local player = LocalPlayer
        local character = player.Character
        if character and character:GetAttribute("Downed") then
            ReplicatedStorage.Events.Player.ChangePlayerMode:FireServer(true)
            WindUI:Notify({
                Title = "提示提示",
                Content = "✅已复活!",
                Duration = 4
            })
        else
            WindUI:Notify({
                Title = "提示提示",
                Content = "你还没有倒地!",
                Duration = 4
            })
        end
    end
})
----------------------zw-----------------------------------zw-------------
local zw = {}
local zwSection = Tabs.zw:Section({ Title = "主要功能" })

zwSection:Toggle({
  Title = "杀戮光环",
  Icon = "check",
  Default = false,
  Callback = function(Value)
    _G.AutoAttack = Value
    if Value then
      local RS = game:GetService("ReplicatedStorage")
      local Event = RS.Remotes.AttacksServer.WeaponAttack
      local Players = game:GetService("Players")
      local Player = Players.LocalPlayer
      local Char = Player.Character or Player.CharacterAdded:Wait()
      local HRP = Char:WaitForChild("HumanoidRootPart")

      Player.CharacterAdded:Connect(function(c)
        Char = c
        HRP = c:WaitForChild("HumanoidRootPart")
      end)

      task.spawn(function()
        while _G.AutoAttack do
          local targets = {}
          for _, mob in ipairs(workspace.ScriptedMap.Brainrots:GetChildren()) do
            local pp = mob.PrimaryPart or mob:FindFirstChild("HumanoidRootPart")
            if pp and (pp.Position - HRP.Position).Magnitude <= DistanceForKillAura then
              table.insert(targets, mob.Name)
            end
          end
          if #targets > 0 then
            Event:FireServer(targets)
          end
          task.wait()
        end
      end)
    end
  end
})

zwSection:Input({
  Title = "攻击范围[20默认]",
  Value = tostring(DefaultKillAuraDistance),
  Callback = function(value)
    local numValue = tonumber(value)
    if numValue then
      DistanceForKillAura = numValue
     else
    end
  end
})

local autoSell = false
zwSection:Section({Title = "出售脑红"})
zwSection:Toggle({
  Title = "自动出售脑红",
  Default = false,
  Callback = function(state)
    autoSell = state
    if autoSell then
      task.spawn(function()
        while autoSell do

          local success, errorMsg = pcall(function()
            game:GetService("ReplicatedStorage").Remotes.ItemSell:FireServer()
          end)

          if not success then

          end


          task.wait(0.1)
        end
      end)
    end
  end
})
local sellInterval = 0.1
zwSection:Slider({
  Title = "出售间隔",
  Value = {
    Min = 0.05,
    Max = 1,
    Default = 0.1
  },
  Callback = function(Value)
    sellInterval = Value
  end
})

local autoSell = false
zwSection:Section({Title = "出售植物"})
zwSection:Toggle({
  Title = "自动出售植物",
  Default = false,
  Callback = function(state)
    autoSell = state
    if autoSell then
      task.spawn(function()
        while autoSell do
          local success, errorMsg = pcall(function()
            local args = {
              [2] = true
            }
            game:GetService("ReplicatedStorage").Remotes.ItemSell:FireServer(unpack(args))
          end)

          if not success then

          end

          task.wait(sellInterval)
        end
      end)
    end
  end
})

local sellInterval = 0.1
zwSection:Slider({
  Title = "出售间隔",
  Value = {
    Min = 0.05,
    Max = 1,
    Default = 0.1
  },
  Callback = function(Value)
    sellInterval = Value
  end
})

local chineseNames = {
  ["Cactus Seed"] = "仙人掌种子",
  ["Strawberry Seed"] = "草莓种子",
  ["Pumpkin Seed"] = "南瓜种子",
  ["Sunflower Seed"] = "向日葵种子",
  ["Dragon Fruit Seed"] = "火龙果种子",
  ["Eggplant Seed"] = "茄子种子",
  ["Watermelon Seed"] = "西瓜种子",
  ["Grape Seed"] = "葡萄种子",
  ["Cocotank Seed"] = "可可坦克种子",
  ["Carnivorous Plant Seed"] = "食人植物种子",
  ["Mr Carrot Seed"] = "胡萝卜先生种子",
  ["Tomatrio Seed"] = "番茄三重奏种子",
  ["Shroombino Seed"] = "蘑菇宾诺种子",
  ["Mango Seed"] = "芒果种子",
  ["King Limone Seed"] = "柠檬王种子"
}
local chineseSeedOptions = {}
for engName, chsName in pairs(chineseNames) do
  chineseSeedOptions[chsName] = engName
end
local chineseSeedList = {}
for _, chsName in pairs(chineseNames) do
  table.insert(chineseSeedList, chsName)
end
local selectedSeeds = {}
zwSection:Dropdown({
  Title = "选择要购买的种子",
  Values = chineseSeedList,
  Value = {},
  Multi = true,
  Callback = function(selectedChineseNames)
    selectedSeeds = {}
    for _, chsName in ipairs(selectedChineseNames) do
      local engName = chineseSeedOptions[chsName]
      if engName then
        table.insert(selectedSeeds, engName)
      end
    end
  end
})
zwSection:Button({
  Title = "购买一次选中种子",
  Callback = function()
    for _, seedName in ipairs(selectedSeeds) do
      local args = {
        [1] = seedName,
        [2] = true
      }
      game:GetService("ReplicatedStorage").Remotes.BuyItem:FireServer(unpack(args))

      WindUI:Notify({
        Title = "购买成功",
        Content = "已购买: " .. chineseNames[seedName],
        Duration = 2,
        Icon = "shopping-cart"
      })

      task.wait(0.1)
    end
  end
})

zwSection:Toggle({
  Title = "自动购买选中种子",
  Value = false,
  Callback = function(state)
    autoBuyEnabled = state
    if buyConnection then
      buyConnection:Disconnect()
      buyConnection = nil
    end
    if state then
      buyConnection = RunService.Heartbeat:Connect(function()
        for _, seedName in ipairs(selectedSeeds) do
          local args = {
            [1] = seedName,
            [2] = true
          }
          game:GetService("ReplicatedStorage").RemoteEvents.BuySeed:FireServer(unpack(args))
          task.wait(0.2)
        end
      end)
    end
  end
})

-- 原AutoBuySeeds:Button → buySection:Button
zwSection:Button({
  Title = "强制停止自动购买[防bug可不用]",
  Callback = function()
    autoBuyEnabled = false
    if buyConnection then
      buyConnection:Disconnect()
      buyConnection = nil
    end
    WindUI:Notify({
      Title = "已停止",
      Content = "已停止自动购买",
      Duration = 2,
      Icon = "stop-circle"
    })
  end
})
------矿井--------
local kg = {}
local kgSection = Tabs.kg:Section({ Title = "主要功能" })

kgSection:Toggle({
     Title = "自动收集矿物",
     Desc = "",
     Value = false,
     Callback = function(state)
         while state and task.wait() do
             for _, v in pairs(workspace.Items:GetChildren()) do
                 if v then
                     local args = {v.Name}
                     game:GetService("ReplicatedStorage"):FindFirstChild("shared/network/MiningNetwork@GlobalMiningEvents").CollectItem:FireServer(unpack(args))
                 end
             end
         end
     end
 })

kgSection:Toggle({
     Title = "自动收集矿物2有bug❌",
     Desc = "",
     Value = false,
     Callback = function(state)
         while state and task.wait() do
             for _, v in pairs(workspace:GetChildren()) do
                 if v:IsA("Model") and v:GetAttribute("Name") == "Trader Tom" then
                     game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame = v:FindFirstChild("HumanoidRootPart").CFrame
                     game:GetService("ReplicatedStorage").Ml.SellInventory:FireServer()
                     break
                 end
             end
         end
     end
 })

-- ============================================================
-- ========== 启动自动获取公告 ==========
-- ============================================================
task.spawn(function()
    task.wait(0.5)
    GG.fetchAnnounce()
end)

-- ============================================================
-- ========== 统一替换所有标签页图标 ==========
-- ============================================================
task.spawn(function()
    task.wait(0.3)
    local mainFrame = Window.UIElements and Window.UIElements.Main
    if not mainFrame then
        mainFrame = game.CoreGui:FindFirstChild("WindUI") and game.CoreGui.WindUI:FindFirstChild("Window")
        if mainFrame then
            mainFrame = mainFrame:FindFirstChild("Main")
        end
    end
    if mainFrame then
        local side = mainFrame:FindFirstChild("Side")
        if side then
            local tabBtns = side:FindFirstChild("TabBtns")
            if tabBtns then
                for _, child in ipairs(tabBtns:GetChildren()) do
                    if child:IsA("ImageLabel") and child:FindFirstChild("TabText") then
                        child.Image = sjzIcon
                        child.ImageRectSize = nil
                        child.ImageRectOffset = nil
                        child.ScaleType = Enum.ScaleType.Fit
                        child.Size = UDim2.new(0, 24, 0, 24)
                    end
                end
                print("✅ 所有标签页图标已替换为自定义图片")
            end
        end
    end
end)

Window:SelectTab(2) 