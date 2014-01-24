require 'spec_helper'

describe 'Viewing story' do 

  before do
    login
  end

  context 'with title and url' do 

    it 'should display the new story title as a link' do 
      visit '/stories/new' 
      fill_in 'Title', with: 'Hard Times'
      fill_in 'Url', with: 'http://www.literaturepage.com/read/dickens-hard-times-1.html'
      click_button 'Share Story'
      expect(current_path).to eq '/stories'
      expect(page).to have_content 'Hard Times'
    end

    it 'should display stories in order of popularity' do
      story1 = create(:story)
      story2 = create(:story, title: 'Lord Lundy')
      vote1 = create(:vote, story_id: story1.id)
      visit '/stories'
      expect(page).to have_css 'h1:first', text: 'My Boy Jack'
    end


  end

end
