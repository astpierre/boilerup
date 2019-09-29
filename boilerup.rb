#!/usr/bin/env ruby

require 'aws-sdk-s3'
require 'tty-prompt'
require 'tty-command'

puts "#BoilerUp!"

prompt = TTY::Prompt.new

languages = %w(python3 ruby C )

language = prompt.select("Language?", languages)
s3 = Aws::S3::Resource.new(region: 'us-west-2')

case language
when "python3"
    functions= %w(default oop)
    function = prompt.select("Boiler plate?", functions)
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
    functions= %w(module strategy)
    function = prompt.select("Boiler plate?", functions)
    if function == "strategy"
        obj = s3.bucket('boilerup').object('ruby-strategy')
        obj.get(response_target: './main.rb')
        puts "Retrieved 'main.rb' from S3. #BoilerUp!"
    else
        obj = s3.bucket('boilerup').object('ruby-module')
        obj.get(response_target: './main.rb')
        puts "Retrieved 'main.rb' from S3. #BoilerUp!"
    end

when "C"
    functions= %w(general Makefile)
    function = prompt.multi_select("Boiler plate?", functions)
    function.each do |f|
        case f
        when "general"
            obj = s3.bucket('boilerup').object('c-main')
            obj.get(response_target: './main.c')
            puts "Retrieved 'main.c' from S3. #BoilerUp!"
        when "Makefile"
            obj = s3.bucket('boilerup').object('c-makefile')
            obj.get(response_target: './Makefile')
            puts "Retrieved 'Makefile' from S3. #BoilerUp!"
        end
    end

end

=begin
cmd = TTY::Command.new
cmd.run('ls -la')
puts "\n\n\n"
exec('ls -la')
=end
