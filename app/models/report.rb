# == Schema Information
#
# Table name: reports
#
#  id          :integer          not null, primary key
#  report_type :string
#  filename    :string
#  link        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Report < ApplicationRecord
  validates_presence_of :report_type, :filename, :link

  def self.reports
    self.all.group_by &:report_type
  end
end
