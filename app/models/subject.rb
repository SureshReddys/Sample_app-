class Subject < ActiveRecord::Base

#has_one :page
has_many :pages

acts_as_list


validates_presence_of :name
validates_length_of :name, :maximum => 25


#scope :visible, lambda{ where("visible"= true)}

scope :visible, lambda{ where(:visible=>true)}

scope :invisible, lambda{ where(:visible=>false)}
#scope :sorted, lambda{ order("subjects.position ASC")}
scope :sorted, lambda{ order("subjects.position ASC")}

scope :newest_first, lambda{order("subjects.created_at DESC")}

scope :search, lambda{|query| where (["name like ?","%#{query}%"])} 

end
