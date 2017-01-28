class Job < ApplicationRecord
  validates :title, presence: true
  validates :wage_upper_bound, presence: true
  validates :wage_lower_bound, presence: true
  validates :wage_lower_bound, numericality: {greater_than: 0}
  validates :wage_lower_bound, numericality: {less_than: :wage_upper_bound, message: "'薪资下限'不可高于'薪资上限'"}


  scope :published, -> { where(is_hidden: false) }
  scope :recent, -> { order('created_at DESC') }
  has_many :resumes

  def publish!
    self.is_hidden = false
    self.save
  end

  def hide!
    self.is_hidden = true
    self.save
  end

end
