require 'spec_helper'

describe 'Creating story' do 

  context 'with user signed in' do 

  before do
    login
  end

    it 'should allow the user to post a story' do 
      visit '/stories' 
      click_link 'Share Story'
      fill_in 'Title', with: 'Hard Times'
      fill_in 'Url', with: 'http://www.literaturepage.com/read/dickens-hard-times-1.html'
      click_button 'Share Story'
      expect(current_path).to eq '/stories'
      expect(page).to have_content 'Hard Times'
    end

  end

  context 'without signing in' do 

    it 'should encourage user to sign in to post a story' do 
      visit '/stories' 
      click_link 'Share Story'
      expect(page).to have_content 'You need to sign in or sign up before continuing.'
    end

  end

end

