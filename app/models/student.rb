class Student < ActiveRecord::Base

	#Model validations
	validates :enroll_no,:first_name,:last_name,:email,:status, presence: true
	validates :gender, inclusion: { in: ['male', 'female'] }
	validates :status, inclusion: { in: ['active', 'inactive'] }
	validates :enroll_no,:email, uniqueness: true
	validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
	validates :email, length: { maximum: 60, too_long: "%{count} characters is the maximum allowed" }
  validates :enroll_no,:first_name,:last_name, length: { maximum: 30, too_long: "%{count} characters is the maximum allowed" }
  validates :city,:country, length: { maximum: 50, too_long: "%{count} characters is the maximum allowed" } 

	# Enum attributes
	enum status: { active: 1, inactive: 0 }
	enum gender: [ :male, :female ]
	
	# Model scopes

	# default_scope { where(deleted: false) }
	scope :active, -> { where(status: 1,deleted: false) }
	scope :inactive, -> { where(status: 0,deleted: false) }
	scope :deleted, -> { where(deleted: true) }

	def initialize(attributes=nil, *args)
    super
    initialized = (attributes || {}).stringify_keys
    if !initialized.key?('enroll_no')
      self.enroll_no = Student.next_enroll_no || "STU-001"
    end    
  end

  def name
  	first_name+" "+last_name
  end

  def enroll_no=(enroll_no)
    super unless enroll_no_frozen?
  end

  def enroll_no_frozen?
    errors[:enroll_no].nil? && !(new_record? || enroll_no.blank?)
  end

  # Returns an auto-generated Student enroll number based on the last enroll number` used
  def self.next_enroll_no
    p = Student.order(created_at: 'DESC').first
    p.nil? ? nil : p.enroll_no.to_s.succ
  end

  # Soft deleting the record based on deleted attribute
  def deleted!
  	update_attribute('deleted',true) unless deleted?
  end
end

#== Schema Information
#
# Table name: students
#
#  id         :integer          not null, primary key
#  string   "enroll_no",     limit: 30,  default: "",    null: false
#  string   "first_name",    limit: 30,  default: "",    null: false
#  string   "last_name",     limit: 30,  default: "",    null: false
#  string   "email",         limit: 60,  default: "",    null: false
#  integer  "gender",        limit: 4
#  date     "date_of_birth"
#  string   "phone",         limit: 255
#  string   "address1",      limit: 255, default: "",    null: false
#  string   "address2",      limit: 255, default: "",    null: false
#  string   "city",          limit: 50
#  string   "country",       limit: 50
#  string   "postcode",      limit: 10,  default: "",    null: false
#  string   "avatar",        limit: 255
#  integer  "status",        limit: 4,   default: 1,     null: false
#  boolean  "deleted",                   default: false, null: false
#  datetime "created_at"
#  datetime "updated_at"