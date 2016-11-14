require 'rspec/expectations'

## matcher to validate if all elements in list are equals
RSpec::Matchers.define :all_list_elements_eq do |expected|
  match do |actual|
    actual.each do |i|
      expect(i).to eq(expected)
    end
  end
  failure_message_for_should do |actual|
    "expected that all elements in #{actual} list would be equals #{expected}"
  end
end

## matcher to validate if all elements is contained in
RSpec::Matchers.define :have_all_elements do |expected|
  match do |actual|
    actual.each do |i|
      expect(expected.include? i).to be true
    end
  end
  failure_message do |actual|
    "expected that all elements in #{actual} is contained in #{expected}"
  end
  description do
    "have all elements in #{expected}"
  end
end

RSpec::Matchers.define :visual_match do |expected|
  match do |actual|
    base_path = File.expand_path(".", Dir.pwd) + '/screenshots/'
    file_atual = File.join(base_path, 'current_images/') + actual + '.png'
    file_baseline = File.join(base_path, 'baseline/') + expected + '.png'
    file_diff = File.join(base_path, 'diffs/') + actual + '_diff_' + expected + '.png'
    comparison = IMATCHER.compare(file_atual, file_baseline)
    @score = comparison.score
    if comparison.match? != true
      comparison.difference_image.save(file_diff)
    end
    expect(comparison.match?).to be true
  end
  failure_message_for_should do |actual|
    "expected that two images are equals, but they are #{@score} different"
  end
end
