require 'spec_helper'

describe Rubino::Uploader, '#upload' do

  subject { object.upload }

  let(:object) { described_class.new( :file => file ) }

  let_mock(:file)

  let(:args) do
    [
      "avrdude",
      "-V",
      "-F",
      "-c", "arduino",
      "-b", "115200",
      "-p", "atmega328p",
      "-P", "/dev/ttyACM0",
      "-U", "flash:w:#{file}",
      "-C", "/etc/avrdude.conf"
    ]
  end

  before do
    ::Kernel.stub(:system => true)
  end

  it { should be object }

  its(:command) { should eq args }


  it 'should call Kernel::system' do
    ::Kernel.should_receive(:system)
    #.with(*args)
    
    subject
  end
end
