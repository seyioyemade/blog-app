require 'rails_helper'

RSpec.describe "user_names/edit", type: :view do
  let(:user_name) {
    UserName.create!(
      first_name: "MyString",
      last_name: "MyString"
    )
  }

  before(:each) do
    assign(:user_name, user_name)
  end

  it "renders the edit user_name form" do
    render

    assert_select "form[action=?][method=?]", user_name_path(user_name), "post" do

      assert_select "input[name=?]", "user_name[first_name]"

      assert_select "input[name=?]", "user_name[last_name]"
    end
  end
end
