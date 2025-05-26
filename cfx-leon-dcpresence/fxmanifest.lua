fx_version 'cerulean'
game 'gta5' 


author 'Masterrr'
description 'ESX Discord rich presence'
version '1.0.0'

shared_script {
	'@es_extended/imports.lua',
	'config.lua'
}

client_script {
	'client/main.lua'
}

server_script{
	'@mysql-async/lib/MySQL.lua',
	'server/main.lua'
}
