RegisterNetEvent('mdev-notify:SendNotify')
AddEventHandler('mdev-notify:SendNotify', function(source, title, message, time, type)
    TriggerClientEvent('mdev-notify:SendNotify', source, title, message, time, type)
end)

RegisterCommand('testnotify', function(source, args, rawCommand)
    local title = args[1] or 'M Development Notify'
    local message = args[2] or 'Dit is een test bericht'
    local time = tonumber(args[3]) or 5000
    local type = args[4] or 'info'

    if time < 1000 then time = 1000 end
    if not (type == 'info' or type == 'error' or type == 'success' or type == 'warning') then
        type = 'info'
    end

    TriggerClientEvent('mdev-notify:SendNotify', source, title, message, time, type)
end, false)

TriggerEvent('chat:addSuggestion', '/testnotify', 'Verzend een notificatie', {
    { name = 'title', help = 'De titel van de notificatie (Gebruik "" voor meerdere woorden)' },
    { name = 'message', help = 'Het bericht van de notificatie (Gebruik "" voor meerdere woorden)' },
    { name = 'time', help = 'Hoe lang de notificatie zichtbaar moet zijn in ms (minimaal 1000)' },
    { name = 'type', help = 'Type van de notificatie (info, error, success, warning)' }
})