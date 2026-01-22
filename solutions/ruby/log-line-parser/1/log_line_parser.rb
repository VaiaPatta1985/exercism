# log line format: "[x]: y"
# where x is one of: INFO, WARNING, ERROR
# and y is a string.

class LogLineParser
  def initialize(line)
    @line = line
  end

  def message
    return @line.gsub(/\[[A-Z]*\]:/,'').strip
  end

  def log_level
    return @line.gsub(/\]:.*/,'')[1,@line.size-2].downcase.strip
  end

  def reformat
    return "#{message} (#{log_level})"
  end
end
