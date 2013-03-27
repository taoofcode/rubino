require 'spec_helper'

describe Rubino::Hex, '#upload' do

  subject { object.upload }

  let(:object) { described_class.new( :source => source ) }

  let_mock(:source)

  let(:args) do
    [
      "avrdude",
      "-V",
      "-F",
      "-c", "arduino",
      "-b", "115200",
      "-p", "atmega328p",
      "-P", "/dev/ttyACM0",
      "-U", "flash:w:#{source}",
      "-C", "/etc/avrdude.conf"
    ]
  end

  before do
    Rubino::Executor.stub(:execute => true)
  end

  it { should be object }

  its(:command) { should eq args }


  it 'should call Executor.execute' do
    Rubino::Executor.should_receive(:execute)
    .with(args)
    
    subject
  end
end
