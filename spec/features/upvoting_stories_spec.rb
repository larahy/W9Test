require 'spec_helper'

describe 'Voting on stories' do 

  before do
    login
    @story = create(:story)
  end


  context 'upvoting once' do 

    it 'should register the vote to the story' do 
      visit '/stories'
      click_link 'Thumbs Up'
      expect(@story.votes.count).to eq(1)
    end

  end

  context 'upvoting twice' do 

    it 'should not show upvote link' do 
      visit '/stories'
      click_link 'Thumbs Up'
      expect(@story.votes.count).to eq(1)
      expect(page).not_to have_content('Thumbs Up')   
    end

  end

  context 'downvote' do 

    it 'should not show upvote link' do 
      visit '/stories'
      click_link 'Thumbs Up'
      expect(@story.votes.count).to eq(1)
      click_link 'Thumbs Down'
      expect(@story.votes.count).to eq(0)
    end

  end

end