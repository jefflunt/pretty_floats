class Float
  # changes numbers like 1234567 to "1,234,567"
  def prettify(place_sep=',', radix_sep='.')
    int = self
      .to_i
      .to_s
      .chars
      .reverse
      .each_slice(3)
      .map{|slice| slice.join }
      .join(place_sep)
      .reverse

    max_digits = self.to_s.split('.').last.length
    float = (self % 1)
      .round(max_digits)
      .to_s
      .split('.')
      .last

    int + radix_sep + float
  end
end
