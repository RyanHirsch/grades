require 'spec_helper'

describe "sections/edit" do
  before(:each) do
    @section = assign(:section, stub_model(Section,
      :name => "MyString",
      :term => nil,
      :course => nil
    ))
  end

  it "renders the edit section form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", section_path(@section), "post" do
      assert_select "input#section_name[name=?]", "section[name]"
      assert_select "input#section_term[name=?]", "section[term]"
      assert_select "input#section_course[name=?]", "section[course]"
    end
  end
end
