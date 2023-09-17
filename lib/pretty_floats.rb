class Float
  # changes numbers like 1234567 to "1,234,567"
  # or:
  #
  #  > -13321.23.prettify(num_places: 2)
  # => "-13,321.77"
  def prettify(place_sep: ',', radix_sep: '.', num_places: -1)
    sign = self < 0 ? '-' : ''

    int = self
      .abs
      .to_i
      .to_s
      .chars
      .reverse
      .each_slice(3)
      .map{|slice| slice.join }
      .join(place_sep)
      .reverse

    max_precision = num_places == -1 ? self.to_s.split('.').last.length : num_places
    float = self % 1
    float = ("%.#{max_precision}f" % float)
      .split('.')
      .last

    sign + int + radix_sep + float
  end
end
