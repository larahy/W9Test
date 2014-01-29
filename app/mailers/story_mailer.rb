class StoryMailer < ActionMailer::Base
  default from: "larahy@gmail.com"

  def new_story(story, user)
    @story = story
    mail to: user.email, subject: story.title
  end

end
