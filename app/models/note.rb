class Note < ApplicationRecord
  validates :title, presence: true, length: { maximum: 30 }
  validates :content, presence: true
  validates :maintag, presence: true, length: { maximum: 30 }

  belongs_to :user

  scope :recent, -> { order(created_at: :desc) }
  
  def self.ransackable_attributes(auth_object = nil)
    %w[title maintag]
  end

  def self.ransackable_associations(auth = nil)
    []
  end

  def self.csv_attributes
    ["title", "content", "maintag", "subtag1", "subtag2", "created_at", "updated_at"]
  end

  def self.generate_csv
    bom = "\uFEFF"
    CSV.generate(bom) do |csv|
      csv << csv_attributes
      all.each do |note|
        csv << csv_attributes.map{|attr| note.send(attr) }
      end
    end
  end
end