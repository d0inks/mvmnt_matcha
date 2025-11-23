local edging = false
local psing = false
local bhop = true --set to false when doing gui - doink
local playerS = game:GetService("Players")
local player = playerS.LocalPlayer.Character
local hrp = player:WaitForChild("HumanoidRootPart")
local white = Color3.new(1, 1, 1) --white
local pos = Vector2.new(950, 720)--txt pos
local txtcolor2 = Color3.new(0,255,0)--green
local txtcolor3 = Color3.new(255,0,0) --red
local txtcolor4 = Color3.new(250, 137, 0) --orange

local velo = Drawing.new("Text")
velo.Visible = true
velo.Position = pos
velo.Color = white

local ebTxt = Drawing.new("Text")
ebTxt.Position = Vector2.new(960, 750)
ebTxt.Text = "EB"
ebTxt.Color = white
ebTxt.Visible = false

local PsTxt = Drawing.new("Text")
PsTxt.Position = Vector2.new(980, 750)
PsTxt.Text = "PS"
PsTxt.Color = white
PsTxt.Visible = false

print("moon.lua by doink :)")
print("discord server -- https://discord.gg/BxAWmtP7cp")
--loop--
local function velocity()
	local pre = 0
    local speed = hrp.AssemblyLinearVelocity
    local bx = math.abs(speed.X^2)
    local by = math.abs(speed.Y^2)
    local bz = math.abs(speed.Z^2)
    local totalVel = math.sqrt(bx + by + bz) --calcs total velocity
    local toVel = string.format("%.2f", totalVel)
    velo.Text = toVel
if totalVel > pre and totalVel > 1 then
	velo.Color = txtcolor2
elseif totalVel < pre and totalVel > 1 then
	velo.Color = txtcolor4
elseif totalVel < 1 then
	velo.Color = white
	end
	pre = totalVel
end
while true do
    local EBpressed = iskeypressed(CFG.EB)
    local Pspressed = iskeypressed(CFG.ps)
    if  iskeypressed(0x20) and bhop then
        if player then
            keypress(0x20)
            task.wait()
        end
    end
    if EBpressed then
        if player and not edging then
            ebTxt.Visible = true
            edging = true
            local dir = hrp.AssemblyLinearVelocity
             for i=1,5 do
                 wait()
                    hrp.AssemblyLinearVelocity = Vector3.new(dir.X * 1.25, dir.Y * 0, dir.Z * 1.3) - Vector3.new(0,18,0)
                end
                wait()
                hrp.AssemblyLinearVelocity = Vector3.new(hrp.AssemblyLinearVelocity.X * 1.8, hrp.AssemblyLinearVelocity.Y * 1, hrp.AssemblyLinearVelocity.Z * 2)
                spawn(function()
                    wait(0.1)
                    edging = false
                    ebTxt.Visible = false
                end)
        end
    end
    if Pspressed then
        if player and not psing then
            local vel = hrp.AssemblyLinearVelocity
            local absX = math.abs(vel.X)
            local absZ = math.abs(vel.Z)
            psing = true
            PsTxt.Visible = true
            if absX < absZ then
                for i=1,40 do
                    hrp.AssemblyLinearVelocity = Vector3.new(0,0,vel.Z*1.5)
                    task.wait()
                end
            elseif absX > absZ then
                for i=1,40 do
                    hrp.AssemblyLinearVelocity = Vector3.new(vel.X*1.5,0,0)
                    task.wait()
                end
            end
            wait()
            hrp.AssemblyLinearVelocity = Vector3.new(hrp.AssemblyLinearVelocity.X * 1, hrp.AssemblyLinearVelocity.Y * 1, hrp.AssemblyLinearVelocity.Z * 2)
        end
    else
        psing = false
        PsTxt.Visible = false
        end
    velocity()
   wait(0.0001)
end
