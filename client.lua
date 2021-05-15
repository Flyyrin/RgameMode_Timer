function subtext(text, duration)
  BeginTextCommandPrint("CELL_EMAIL_BCON") 
  AddTextComponentSubstringPlayerName(text) 
  EndTextCommandPrint(duration, true)
end

function helpMessage(text)
  SetTextComponentFormat("STRING")
  AddTextComponentString(text)
  DisplayHelpTextFromStringLabel(0,0,0,-1)
end

function stringsplit(inputstr, sep)
	if sep == nil then
		sep = "%s"
	end
	local t={}
	i=1
	for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
		t[i] = str i = i + 1
	end
	return t
end

RegisterCommand("gm1", function(source, args, rawCommand)
  RgameMode('gm1', args[1])
end, false)

function RgameMode(gm, time)
  if gm == 'gm1' then
    local active = true
    Citizen.CreateThread(function()
      while active do
        Citizen.Wait(1)
        subtext('Kill the ~r~target')
      end
    end)

    --TIMER
    local timer = tonumber(time)
    while timer > 0 do
      Wait(1000) 
      timer = timer - 0.01
      local textDisplay = timer
      local time_display = stringsplit(tostring(timer), ".")
      local mm = tonumber(time_display[1])
      local ss = tonumber(time_display[2])
      
      if mm < 10 then
        mm = '0'..mm
      end

      if ss < 10 then
        ss = '0'..ss
      end

      textDisplay = mm..':'..ss
      helpMessage(textDisplay)
    end
    active = false
    ClearHelp(true)
  end

end


