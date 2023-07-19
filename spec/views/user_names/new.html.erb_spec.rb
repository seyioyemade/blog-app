require 'rails_helper'

RSpec.describe "user_names/new", type: :view do
  before(:each) do
    assign(:user_name, UserName.new(
      first_name: "MyString",
      last_name: "MyString"
    ))
  end

  it "renders new user_name form" do
    render

    assert_select "form[action=?][method=?]", user_names_path, "post" do

      assert_select "input[name=?]", "user_name[first_name]"

      assert_select "input[name=?]", "user_name[last_name]"
    end
  end
end
