class Task < ApplicationRecord
  validates :name, presence: true, length: { maximum: 30 }
  validates :content, presence: true, length: { maximum: 150 }
  belongs_to :user

  scope :recent, -> { order(created_at: :desc) }

  def self.ransackable_attributes(auth_object = nil)
    %w[name content]
  end

  def self.ransackable_associations(auth = nil)
    []
  end

  def self.csv_attributes
    ["name", "content", "created_at", "updated_at"]
  end

  def self.generate_csv
    bom = "\uFEFF"
    CSV.generate(bom) do |csv|
      csv << csv_attributes
      all.each do |task|
        csv << csv_attributes.map{|attr| task.send(attr) }
      end
    end
  end
end