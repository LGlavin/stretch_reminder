require 'spec_helper'

describe Reminder do
  
  it { should have_valid(:description).when("What did you stretch?") }
  it { should_not have_valid(:description).when(nil, '') }

  it { should have_valid(:dispatch_time).when(Time.now) }
  it { should_not have_valid(:dispatch_time).when(nil, '') }

  it { should belong_to(:user) }
end
