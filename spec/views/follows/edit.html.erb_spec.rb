require 'rails_helper'

RSpec.describe "follows/edit", type: :view do
  before(:each) do
    @follow = assign(:follow, Follow.create!(
      :user_id => 1,
      :followee_id => 1
    ))
  end

  it "renders the edit follow form" do
    render

    assert_select "form[action=?][method=?]", follow_path(@follow), "post" do

      assert_select "input#follow_user_id[name=?]", "follow[user_id]"

      assert_select "input#follow_followee_id[name=?]", "follow[followee_id]"
    end
  end
end
