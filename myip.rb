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

  fb = alfred.feedback

  #query1 = ARGV[0]
  #ARGV.shift
  #type = ARGV[0]

 # if (type =~ /[d|h|c]/) == nil 
 #   raise Alfred::InvalidFormat, "Usage: ascii [d|h|c] args"
 # end 

  result = IPSocket.getaddress(Socket.gethostname);
  show_chars(fb, result)
  
  puts fb.to_xml
end

