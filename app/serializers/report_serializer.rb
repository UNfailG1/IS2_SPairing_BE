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

class ReportSerializer < ActiveModel::Serializer
  attributes :id, :report_type, :filename, :link
end
