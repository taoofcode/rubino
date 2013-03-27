require 'spec_helper'

describe Rubino::Elf, '#to_hex' do

  subject { object.to_hex }

  let(:object) { described_class.new( :source => source ) }

  let(:source) { "example.elf" }

  let(:target) { "example.hex" }

  let(:args) do
    [
      "avr-objcopy",
      "-O", "ihex",
      "-R", ".eeprom",
      source,
      target
    ]
  end

  before do
    Rubino::Executor.stub(:execute => true)
  end

  it { object.send(:command) == args }

  it { should eq Rubino::Hex.new(:source => target) }

  it 'should call Executor.execute' do
    Rubino::Executor.should_receive(:execute)
    .with(args)
    subject
  end
end
