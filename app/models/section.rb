class Section < ActiveRecord::Base
	
	belongs_to :page
    has_many :section_edits

 after_save :touch_page

 acts_as_list :scope => :page


CONTENT_TYPES = ['text','HTML']

  validates_presence_of :name
validates_length_of :name, :maximum => 25

validates_inclusion_of :content_type, :in => CONTENT_TYPES,
:message => "must be one of: #{CONTENT_TYPES.join(',')}"

 validates_presence_of :content

	scope :visible, lambda{ where(:visible=>true)}

    scope :invisible, lambda{ where(:visible=>false)}
    #scope :sorted, lambda{ order("subjects.position ASC")}
    scope :sorted, lambda{ order("sections.position DESC")}

    scope :newest_first, lambda{order("sections.created_at DESC")}

    scope :search, lambda{|query| where (["name like ?","%#{query}%"])}


    private

      def touch_page
        # it updates the updated time
      	page.touch
      end
end
