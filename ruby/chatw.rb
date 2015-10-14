#!/usr/bin/env ruby
require "chatwork"
require "date"
require "time"

ROOM_ID = '39273114' # project savepoint
USER_ID = '1130542'

ChatWork.api_key = CHATWORK_TOKEN

# message
ChatWork::Message.create(room_id: ROOM_ID, body: "[To:#{USER_ID}]  TEST")

# task
ChatWork::Task.create(
  room_id: ROOM_ID,
  body:    "【自動投稿】出勤しなさい",
  to_ids:  USER_ID,
  limit:   Time.parse(Date.today.to_s).to_i
)

