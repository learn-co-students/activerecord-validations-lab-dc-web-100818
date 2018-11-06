require 'pry'
class ClickBaitValidator < ActiveModel::Validator
  def validate(post)

    triggers = ["Won't Believe", "Secret", "Top", "Guess"]

    triggers.each do |trigger|
      if post.title != nil && post.title.include?(trigger)
        return
      end
    end
    post.errors[:title] << false
  end
end

class Post < ActiveRecord::Base
  include ActiveModel::Validations
  validates_with ClickBaitValidator
  validates :title, presence: true
  validates :content, length: {minimum: 200}
  validates :summary, length: {maximum: 30}
  validates :category, inclusion: {in: %w(Fiction)}

end
