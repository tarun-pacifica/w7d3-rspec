# == Schema Information
#
# Table name: fruits
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  name       :string(255)
#  type       :string(255)
#

class Fruit < ActiveRecord::Base
  attr_accessible :name
  validates :name, :presence => true

  belongs_to :stair

  def squishy?
    true
  end

  def dietary_fibre
    0.7
  end

  def deliciousness
    0.9
  end

end
