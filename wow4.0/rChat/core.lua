
  -- // rChat
  -- // zork - 2010

  -----------------------------
  -- INIT
  -----------------------------

  local _G = _G

  -----------------------------
  -- FUNCTIONS
  -----------------------------

	for i = 1, 23 do
		CHAT_FONT_HEIGHTS[i] = i+7
	end

  for i = 1, NUM_CHAT_WINDOWS do
    local bf = _G['ChatFrame'..i..'ButtonFrame']
    if bf then
      bf:Hide()
      bf:HookScript("OnShow", function(s) s:Hide(); end)
    end
    local ebtl = _G['ChatFrame'..i..'EditBoxLeft']
    if ebtl then ebtl:Hide() end
    local ebtm = _G['ChatFrame'..i..'EditBoxMid']
    if ebtm then ebtm:Hide() end
    local ebtr = _G['ChatFrame'..i..'EditBoxRight']
    if ebtr then ebtr:Hide() end
    local cf = _G['ChatFrame'..i]
    if cf then
      cf:SetFont(NAMEPLATE_FONT, 12, "THINOUTLINE")
      cf:SetShadowOffset(1,-1)
      cf:SetShadowColor(0,0,0,0.6)
      cf:SetFrameStrata("LOW")
      cf:SetFrameLevel(2)
    end
    local eb = _G['ChatFrame'..i..'EditBox']
    if eb and cf then
      cf:SetClampRectInsets(0,0,0,0)
      --cf:SetFading(false)
      eb:SetAltArrowKeyMode(false)
      eb:ClearAllPoints()
      eb:SetPoint("BOTTOM",cf,"TOP",0,22)
      eb:SetPoint("LEFT",cf,-5,0)
      eb:SetPoint("RIGHT",cf,10,0)
    end
    local tab = _G['ChatFrame'..i..'Tab']
    if tab then
      tab:GetFontString():SetFont(NAMEPLATE_FONT, 11, "THINOUTLINE")
      --fix for color and alpha of undocked frames
      tab:GetFontString():SetTextColor(1,0.7,0)
      tab:GetFontString():SetShadowOffset(1,-1)
      tab:GetFontString():SetShadowColor(0,0,0,0.6)
      tab:SetAlpha(1)
    end
  end

  local function init()

    local mb = _G['ChatFrameMenuButton']
    if mb then
      mb:Hide()
      mb:HookScript("OnShow", function(s) s:Hide(); end)
    end

    local fmb = _G['FriendsMicroButton']
    if fmb then
      fmb:Hide()
      fmb:HookScript("OnShow", function(s) s:Hide(); end)
    end

    ChatFontNormal:SetFont(NAMEPLATE_FONT, 12, "THINOUTLINE")
    ChatFontNormal:SetShadowOffset(1,-1)
    ChatFontNormal:SetShadowColor(0,0,0,0.6)

    --don't cut the toastframe
    BNToastFrame:SetClampedToScreen(true)
    BNToastFrame:SetClampRectInsets(-15,15,15,-15)

    local bcq = _G["CombatLogQuickButtonFrame_Custom"];
    if bcq then
      bcq:Hide()
      bcq:HookScript("OnShow", function(s) s:Hide(); end)
      bcq:SetHeight(0)
    end

  end

  local a = CreateFrame("Frame")

  a:SetScript("OnEvent", function(self, event)
    if(event=="PLAYER_LOGIN") then
      init()
    end
  end)

  a:RegisterEvent("PLAYER_LOGIN")

