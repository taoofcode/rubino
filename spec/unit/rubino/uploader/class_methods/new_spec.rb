require 'spec_helper'

describe Rubino::Uploader, '.new' do

  subject { object.new(attributes) }

  let(:object) { described_class }

  let_mock(:file)

  context 'with defaults' do
  
    let(:attributes) do
      {
        :file => file
      }
    end

    its(:file) { should be file }

    its(:arduino_port) { should eq '/dev/ttyACM0' }

    its(:avrdude_basedir) { should eq '/usr/share/arduino/hardware/tools' }

    its(:programmer_id) { should eq 'arduino' }

    its(:baudrate) { should eq 115200 }

    its(:mcu_type) { should eq 'atmega328p' }

  end

  context 'without defaults' do
    
    let_mock(:arduino_port)
    let_mock(:avrdude_basedir)
    let_mock(:programmer_id)
    let_mock(:baudrate)
    let_mock(:mcu_type)

    let(:attributes) do
      {
        :file => file,
        :arduino_port => arduino_port,
        :avrdude_basedir => avrdude_basedir,
        :programmer_id => programmer_id,
        :baudrate => baudrate,
        :mcu_type => mcu_type
      }
    end

    its(:file) { should be file }

    its(:arduino_port) { should be arduino_port }

    its(:avrdude_basedir) { should be avrdude_basedir }

    its(:programmer_id) { should be programmer_id }

    its(:baudrate) { should be baudrate }

    its(:mcu_type) { should be mcu_type }
    
  end
end
