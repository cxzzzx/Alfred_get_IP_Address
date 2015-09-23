#!/usr/bin/env ruby
# encoding: utf-8

require "rubygems" unless defined? Gem
require "./bundle/bundler/setup"
require "alfred"
require 'socket';



def show_chars(fb, result)
  fb.add_item({
    :uid      => "",
    :title    => "本机IP: #{result}",
    :subtitle => "按回车复制",
    :arg      => "#{result}",
    :valid    => "yes",
  })
end


Alfred.with_friendly_error do |alfred|
  alfred.with_rescue_feedback = true

  #fb = alfred.feedback
  fb1 = alfred.feedback


  #result = IPSocket.getaddress(Socket.gethostname);
  local_ip = UDPSocket.open {|s| s.connect("64.233.187.99", 1); s.addr.last}
  #show_chars(fb, result)
  show_chars(fb1, local_ip)
  #puts fb.to_xml
  puts fb1.to_xml
end

