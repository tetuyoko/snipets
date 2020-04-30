#!/usr/bin/env ruby
#
content = ''
File.foreach(ARGV[0]) do |line|
  unless line =~ /(\s+)expect\(find\((.+?)\)\.(text|value)\).to (eq|match|include|have_content)(?:\(|\s+)['"]([^'"]+)/
    content << line
    next
  end

  indent = $1
  locator = $2
  method = $3
  matcher = $4
  value = $5

  if method == 'value'
    unless locator.match?(/\A['"]#\S+\z/)
      # Not supported
      content << line
      next
    end
    if matcher == 'eq'
      content << %Q{#{indent}expect(page).to have_field(#{locator.sub('#', '')}, with: "#{value}")\n}
    else
      new_line = %Q{#{indent}expect(page).to have_field(#{locator.sub('#', '')}, with: /#{value}/)\n}
      content << new_line
      if value.include?('/')
        $stderr.puts "The value at line #{$.} include '/', so please fix it manually\n#{new_line}"
      end
    end
  else
    if matcher == 'eq'
      content << %Q{#{indent}expect(page).to have_css(#{locator}, text: "#{value}")\n}
    else
      content << %Q{#{indent}expect(page).to have_css(#{locator}, text: /#{value}/)\n}
      if value.include?('/')
        $stderr.puts "The value at line #{$.} include '/', so please fix it manually\n#{new_line}"
      end
    end
  end
end

File.write(ARGV[0], content)
