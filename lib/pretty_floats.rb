class Float
  # changes numbers like 1234567 to "1,234,567"
  def prettify(place_sep: ',', radix_sep: '.', num_places: -1)
    int = self
      .to_i
      .to_s
      .chars
      .reverse
      .each_slice(3)
      .map{|slice| slice.join }
      .join(place_sep)
      .reverse

    max_digits = num_places == -1 ? self.to_s.split('.').last.length : num_places
    float = (self % 1)
      .round(max_digits)
      .to_s
      .split('.')
      .last

    int + radix_sep + float
  end
end
