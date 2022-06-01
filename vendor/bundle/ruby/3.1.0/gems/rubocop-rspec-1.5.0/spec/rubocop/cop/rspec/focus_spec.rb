# encoding: utf-8

describe RuboCop::Cop::RSpec::Focus do
  subject(:cop) { described_class.new }

  [
    :example_group, :describe, :context, :xdescribe, :xcontext,
    :it, :example, :specify, :xit, :xexample, :xspecify,
    :feature, :scenario, :xfeature, :xscenario
  ].each do |block_type|
    it "finds `#{block_type}` blocks with `focus: true`" do
      inspect_source(
        cop,
        [
          "#{block_type} 'test', focus: true do",
          'end'
        ]
      )
      expect(cop.offenses.size).to eq(1)
      expect(cop.offenses.map(&:line).sort).to eq([1])
      expect(cop.messages).to eq(['Focused spec found.'])
      expect(cop.highlights).to eq(['focus: true'])
    end

    it "finds `#{block_type}` blocks with `:focus`" do
      inspect_source(
        cop,
        [
          "#{block_type} 'test', :focus do",
          'end'
        ]
      )
      expect(cop.offenses.size).to eq(1)
      expect(cop.offenses.map(&:line).sort).to eq([1])
      expect(cop.messages).to eq(['Focused spec found.'])
      expect(cop.highlights).to eq([':focus'])
    end

    it 'detects no offense when spec is not focused' do
      inspect_source(
        cop,
        [
          "#{block_type} 'test' do",
          'end'
        ]
      )
      expect(subject.messages).to be_empty
    end
  end

  [
    :fdescribe, :fcontext,
    :focus, :fexample, :fit, :fspecify,
    :ffeature, :fscenario
  ].each do |block_type|
    it "finds `#{block_type}` blocks" do
      inspect_source(
        cop,
        [
          "#{block_type} 'test' do",
          'end'
        ]
      )
      expect(cop.offenses.size).to eq(1)
      expect(cop.offenses.map(&:line).sort).to eq([1])
      expect(cop.messages).to eq(['Focused spec found.'])
      expect(cop.highlights).to eq(["#{block_type} 'test'"])
    end
  end
end
