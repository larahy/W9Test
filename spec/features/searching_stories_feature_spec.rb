require 'spec_helper'

describe 'searching' do

  before do
    create(:story, title: 'Foo')
    create(:story, title: 'Food')
    create(:story, title: 'Bar')
  end

  it 'should do partial matching on the title' do
    visit '/'
    fill_in 'search', with: 'Foo'
    expect(page).to have_content 'Foo'
    expect(page).to have_content 'Food'
    expect(page).not_to have_content 'Bar'
  end

end