require 'rails_helper'

RSpec.describe "user_names/index", type: :view do
  before(:each) do
    assign(:user_names, [
      UserName.create!(
        first_name: "First Name",
        last_name: "Last Name"
      ),
      UserName.create!(
        first_name: "First Name",
        last_name: "Last Name"
      )
    ])
  end

  it "renders a list of user_names" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("First Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Last Name".to_s), count: 2
  end
end
