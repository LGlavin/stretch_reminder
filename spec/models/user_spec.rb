require 'spec_helper'

describe User do
  it { should have_valid(:name).when('zombie83') }
  it { should_not have_valid(:name).when(nil, '') }

  it { should have_valid(:phone_number).when('5088133898') }
  it { should_not have_valid(:phone_number).when("1", "1234567891011") }

  it { should have_valid(:email).when('zombie@example.com') }
  it { should_not have_valid(:email).when(nil, '') }

  it 'has a matching password confirmation for the password' do
    user = User.new
    user.password = 'password'
    user.password_confirmation = 'anotherpassword'

    expect(user).to_not be_valid
    expect(user.errors[:password_confirmation]).to_not be_blank
  end
end
