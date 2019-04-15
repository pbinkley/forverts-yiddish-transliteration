require 'json'
require 'byebug'

class YiddishTransliterate
  def initialize()
    file = File.read 'lib/yiddish.json'
    @data = JSON.parse(file)
  #  @data = @data.sort_by { |pair| pair[0].length }.reverse
  end

  def transliterate(source)
    target = source.dup
    @data.each do |phoneme|
      target.gsub!(phoneme[0], phoneme[1])
    end
    target
  end
end
