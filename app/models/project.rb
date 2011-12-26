class Project < ActiveRecord::Base
has_and_belongs_to_many :developers
has_attached_file :image, :styles =>{ :medium => "300x300>", :thumb => "100x100>" }
#validates_attachment_presence :image
#validates_attachment_content_type :jpg/png
#validates_attachment_size:image, :less_than => 3.megabytes 
end
