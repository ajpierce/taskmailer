#!/usr/bin/env ruby

$LOAD_PATH.unshift("#{File.dirname(__FILE__)}/lib")
require 'taskmailer'

tm = TaskMailer.new
tm.email
