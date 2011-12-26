class Developer < ActiveRecord::Base
has_and_belongs_to_many :projects
validates :developer_name, :developer_email,:developer_platform,:date_of_join, :image_path ,:presence => true
end
