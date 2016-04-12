#!/usr/bin/env ruby
require "hipchat"

room =  ENV['HCROOM']
server = ENV['HCHOST']

name = "ToDoが追加されました"
message = "test message"
client = HipChat::Client.new(API_TOKEN, api_version: 'v2', server_url: server)
color = 'green'
notify = false
client[room].send(name, message, color: color, notify: notify)
