require 'rails_helper'

RSpec.describe "follows/index", type: :view do
  before(:each) do
    assign(:follows, [
      Follow.create!(
        :user_id => 2,
        :followee_id => 3
      ),
      Follow.create!(
        :user_id => 2,
        :followee_id => 3
      )
    ])
  end

  it "renders a list of follows" do
    render
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end
