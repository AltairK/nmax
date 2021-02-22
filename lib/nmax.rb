module Nmax
  autoload :VERSION, 'nmax/version'

  def self.get(stdin:, count:)
    chars = stdin.each_char
    grouped_numbers = chars.chunk { |c| c =~ /\d/ }

    numbers = grouped_numbers.inject([]) do |memo, (_, digits)|
      memo << digits.join.to_i
      memo = memo.sort.last(count) if memo.size > count
      memo
    end

    numbers.sort.last(count)
  end
end
