
B_MN_VERSION = "1.0"


-------------------------------------------------------------------------------


--[[
	Print text in the chat frame
	Argument: msg - the text that you want to print
]]
function B_MN_Print(msg)
	DEFAULT_CHAT_FRAME:AddMessage(msg, 0.37, 1, 0)
end

-------------------------------------------------------------------------------


function B_MN_OnLoad()
	this:RegisterEvent("ADDON_LOADED")
	this:RegisterEvent("UPDATE_PENDING_MAIL")
end

function B_MN_OnEvent()
	if (event == "ADDON_LOADED") then
		if (string.lower(arg1) == "mailnotifier") then
			B_MN_Print("MailNotifier " .. B_MN_VERSION .. " loaded.")
		end
	elseif (event == "UPDATE_PENDING_MAIL") then
		if HasNewMail() then
			B_MN_Frame:Show()
		end
	end
end

function B_MN_OnMouseDown()
	B_MN_Frame:Hide()
end