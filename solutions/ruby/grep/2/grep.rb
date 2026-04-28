module Grep
  def self.grep(input, flags, files)
    input = Regexp.escape(input)
    input = '^' + input + '$' if flags.include?('-x')
    pattern = flags.include?('-i') ? Regexp.new(input, 'i') : Regexp.new(input)
    many_files = (files.size > 1)
    line_numbers = flags.include?('-n')
    files.each_with_object('') { |file, result|
      File.read(file).split("\n").each_with_index { |line, index|
        line_matches = (not line.scan(pattern).empty?)
        if (flags.include?('-v') ^ line_matches)
          if (flags.include?('-l'))
            result << file + "\n"
            break
          else
            result << file + ':' if many_files
            result << (index + 1).to_s + ':' if line_numbers
            result << line + "\n"
          end
        end
      }
    }[0...-1]  # remove last newline
  end
end
