#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

require 'rss'
require 'idobata'

Idobata.hook_url = ENV['IDOBATA_END']

msg = ""
HATEBU_USERS.each { |user|
  # Flush cache RSS before downloading
  `curl -H 'Pragma: no-cache' -L b.hatena.ne.jp/#{user}/rss`

  rss = RSS::Parser.parse("http://www.freee.co.jp/blog/feed")

  # NOTE: Heroku Scheduler's frequency should be set to "Every 10 minutes"
  bookmarks = rss.items.select do |item|
    (Time.now - item.date) / 60 <= 10
  end

  msg << bookmarks.map {|b|
    p "<a href='#{b.link}'>#{b.title}</a> by <span class='label label-info'>freee</span><br /> <b>#{b.description}<b/>"
  }.join("<br/>")
}

Idobata::Message.create(source: msg, format: :html) unless msg.empty?
