class AdminUser < ActiveRecord::Base

	has_and_belongs_to_many :pages
	has_many :section_edits

	has_secure_password

	self.per_page = 5


	EMAIL_REGIX = /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\Z/i
	FORBIDDEN_USERNAMES = ['littlebopeep','humptydumpty','marymary']

	 validates_presence_of :first_name
	 validates_length_of :first_name, :maximum => 25
	 validates_presence_of :last_name
	 validates_length_of :last_name, :maximum => 50
	 validates_presence_of :username 
	 validates_length_of :username, :within => 3..25
	 validates_uniqueness_of :username
	 validates_presence_of :email
	 validates_length_of :email, :maximum => 100
	 validates_format_of :email, :with => EMAIL_REGIX
	 validates_confirmation_of :email

	 # new validations 

	 # validates :first_name, :presence => true,
	 #                        :length => {:maximum => 50}

	 #  validates :email, :presence => true,
	 #                    :length => {:maximum => 25},
	 #                    :format => EMAIL_REGIX,
	 #                    :confirmation => true
    scope :sorted,lambda{order("last_name ASC,first_name ASC")}


    validate :username_is_allowed
    validate :no_new_users_on_saturday, :on => :create


      def name
      	"#{first_name} #{last_name}"
      end

    def username_is_allowed
    	if FORBIDDEN_USERNAMES.include?(username)
    		errors.add(:username,"has been restricted from Use.")
    	end

    end
     
     def no_new_users_on_saturday
	  if Time.now.wday ==  5
	    errors[:base] << "No new users on Saturdays."
	  end
	 end

end
