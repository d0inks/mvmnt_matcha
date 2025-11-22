local pos = Vector2.new(950, 750)--txt pos
local txtcolor = Color3.new(1, 1, 1) --white
local txtcolor2 = Color3.new(0,255,0)--green
local txtcolor3 = Color3.new(255,0,0) --red
local txtcolor4 = Color3.new(250, 137, 0) --orange
local velo = Drawing.new("Text")
velo.Visible = true
velo.Position = pos
velo.Color = txtcolor
local function velocity()
	local pre = 0
    local root = game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart")
    local speed = root.AssemblyLinearVelocity
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
	velo.Color = txtcolor
	end
wait(0.001)
	pre = totalVel
end

while true do
	velocity()
end

