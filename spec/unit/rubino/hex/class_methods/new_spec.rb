require 'spec_helper'

describe Rubino::Hex, '.new' do

  subject { object.new(attributes) }

  let(:object) { described_class }

  let_mock(:source)

  context 'with defaults' do
  
    let(:attributes) do
      {
        :source => source
      }
    end

    its(:source) { should be source }

    its(:arduino_port) { should eq '/dev/ttyACM0' }

    its(:avrdude_path) { should eq 'avrdude' }
    
    its(:avrdude_config) { should eq '/etc/avrdude.conf' }

    its(:programmer_id) { should eq 'arduino' }

    its(:baudrate) { should eq 115200 }

    its(:mcu_type) { should eq 'atmega328p' }

  end

  context 'without defaults' do
    
    let_mock(:arduino_port)
    let_mock(:avrdude_path)
    let_mock(:avrdude_config)
    let_mock(:programmer_id)
    let_mock(:baudrate)
    let_mock(:mcu_type)

    let(:attributes) do
      {
        :source => source,
        :arduino_port => arduino_port,
        :avrdude_path => avrdude_path,
        :avrdude_config => avrdude_config,
        :programmer_id => programmer_id,
        :baudrate => baudrate,
        :mcu_type => mcu_type
      }
    end

    its(:source) { should be source }

    its(:arduino_port) { should be arduino_port }

    its(:avrdude_path) { should be avrdude_path }
    
    its(:avrdude_config) { should be avrdude_config }

    its(:programmer_id) { should be programmer_id }

    its(:baudrate) { should be baudrate }

    its(:mcu_type) { should be mcu_type }
    
  end
end
