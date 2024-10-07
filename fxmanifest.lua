fx_version 'cerulean'
game 'gta5'

author 'Milo | M Development'
description 'M Development | Notify script'
version '1.0.0'

client_scripts {
  'client.lua'
}
server_scripts {
  'server.lua'
}

ui_page 'html/ui.html'

files {
    'html/ui.html',
    'html/style.css',
    'html/script.js'
}

exports {
    'SendNotify'
}