class ConfController < ApplicationController
    @@path = 'D:\Docs\studia\semestr 4\ruby\lab5\zlozone\aplikacja_rspec\config\application.rb'
    def index
        @config = []
        File.open(@@path, 'r') do |infile|
            infile.each_line do |line|
                line = line.strip
                if line[0] == '#'
                    next
                end
                if line.index('config.') == 0
                    field = line.split[0][7..]
                    value = if line.split[1] != '=' then line.split[1] else line.split[2] end
                    puts "field: #{field}\tvalue: #{value}"
                    if not ['true', 'false'].include?(value)
                        @config.push({'name' => field, 'value' => value, 'predefined' => false})
                    else
                        @config.push({'name' => field, 'value' => value, 'predefined' => true, 'values' => ['true', 'false']})
                    end
                end
            end
        end
    end

    def create
        new_name = params[:name]
        new_value = params[:value]
        old_content = nil
        new_content = nil

        File.open(@@path, 'r') do |infile|
            old_content = infile.read
            infile.rewind
            infile.each_line do |line|
                line_unstripped = line.rstrip
                line = line.strip
                if line[0] != '#'
                    if line.index('config.') == 0
                        old_line = line_unstripped
                        indent = line_unstripped.index('config.')
                        new_line = "\n" + ' ' * indent + "config.#{new_name} = #{new_value}\n"
                        new_content = old_content.sub(old_line, old_line + new_line)
                        break
                    end
                end
            end
        end
        if new_content
            File.open(@@path, 'w') do |outfile|
                outfile.puts new_content
            end
        end
        redirect_to conf_index_path
    end

    def update
        updated = if params[:format] == nil then params[:id] else [params[:id], params[:format]].join('.') end
        puts updated
        new_value = params[updated]
        puts new_value
        old_content = nil
        new_content = nil

        File.open(@@path, 'r') do |infile|
            old_content = infile.read
            infile.rewind
            infile.each_line do |line|
                line_unstripped = line.rstrip
                line = line.strip
                if line[0] != '#'
                    if line.index('config.') == 0
                        field = line.split[0][7..]
                        if field == updated
                            old_line = line_unstripped
                            indent = line_unstripped.index('config.')
                            value = if line.split[1] != '=' then line.split[1] else line.split[2] end
                            new_line = ' ' * indent + line.reverse.sub(value.reverse, new_value.reverse).reverse
                            new_content = old_content.sub(old_line, new_line)
                        end
                    end
                end
            end
        end
        if new_content
            File.open(@@path, 'w') do |outfile|
                outfile.puts new_content
            end
        end
        redirect_to conf_index_path
    end

    def destroy
        destroyed = if params[:format] == nil then params[:id] else [params[:id], params[:format]].join('.') end
        puts destroyed
        old_content = nil
        new_content = nil

        File.open(@@path, 'r') do |infile|
            old_content = infile.read
            infile.rewind
            infile.each_line do |line|
                line_unstripped = line
                line = line.strip
                if line[0] != '#'
                    if line.index('config.') == 0
                        field = line.split[0][7..]
                        if field == destroyed
                            old_line = line_unstripped
                            new_line = ''
                            new_content = old_content.sub(old_line, new_line)
                        end
                    end
                end
            end
        end
        if new_content
            File.open(@@path, 'w') do |outfile|
                outfile.puts new_content
            end
        end
        redirect_to conf_index_path
    end
end
