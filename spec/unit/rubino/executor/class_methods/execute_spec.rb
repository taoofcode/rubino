require 'spec_helper'

describe Rubino::Executor, '.execute' do

  subject { object.execute(args) }
  
  let(:object) { described_class }

  let_mock(:args)

  before do
    Kernel.stub(:system => true)
  end

  it 'should call Kernel::system' do
    Kernel.should_receive(:system).
      with(*args)

    subject
  end
end
