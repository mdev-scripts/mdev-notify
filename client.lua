RegisterNetEvent('mdev-notify:SendNotify')
AddEventHandler('mdev-notify:SendNotify', function(title, message, time, type)
    SendNUIMessage({
        action = 'showNotify',
        title = title,
        message = message,
        type = type or 'info',
        time = time or '5000'
    })
end)

exports('SendNotify', function(title, message, time, type)
    SendNUIMessage({
        action = 'showNotify',
        title = title,
        message = message,
        type = type or 'info',
        time = time or '5000'
    })
end)