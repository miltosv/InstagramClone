require 'rails_helper'

RSpec.describe "follows/new", type: :view do
  before(:each) do
    assign(:follow, Follow.new(
      :user_id => 1,
      :followee_id => 1
    ))
  end

  it "renders new follow form" do
    render

    assert_select "form[action=?][method=?]", follows_path, "post" do

      assert_select "input#follow_user_id[name=?]", "follow[user_id]"

      assert_select "input#follow_followee_id[name=?]", "follow[followee_id]"
    end
  end
end
