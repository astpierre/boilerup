#!/usr/bin/env ruby

require 'aws-sdk-s3'
require 'tty-prompt'
require 'tty-command'

puts "#BoilerUp!"

prompt = TTY::Prompt.new

languages = %w(python3 ruby C )
functions= %w(default script oop)

language = prompt.select("Language?", languages)
function = prompt.select("Function?", functions)

s3 = Aws::S3::Resource.new(region: 'us-west-2')

case language
when "python3"
   if function == "oop"
       obj = s3.bucket('boilerup').object('python3-oop')
       obj.get(response_target: './main.py')
       puts "Retrieved 'main.py' from S3. #BoilerUp!"
   else
       obj = s3.bucket('boilerup').object('python3-default')
       obj.get(response_target: './main.py')
       puts "Retrieved 'main.py' from S3. #BoilerUp!"
   end
when "ruby"
    puts "ruby case"

when "C"
    puts "C case"

else
    puts "none"
end

=begin
cmd = TTY::Command.new
cmd.run('ls -la')
puts "\n\n\n"
exec('ls -la')
=end
