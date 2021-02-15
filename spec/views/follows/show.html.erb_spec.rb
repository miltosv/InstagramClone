require 'rails_helper'

RSpec.describe "follows/show", type: :view do
  before(:each) do
    @follow = assign(:follow, Follow.create!(
      :user_id => 2,
      :followee_id => 3
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
  end
end
