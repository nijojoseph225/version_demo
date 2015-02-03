class Product
  include Mongoid::Document
	include Mongoid::Timestamps
	include Mongoid::Paperclip
	include Mongoid::Versioning


  field :name, type: String
  field :description, type: String
	field :_id, type: String, default: ->{ name.to_s.parameterize }
#	field :user,type: String, default:  current_user.email   

	has_mongoid_attached_file :photo,
    :url => "/system/attachments/:id/:style/:basename.:extension", 
		 :keep_old_files => true , 
		:keep_old_files => :version_condition_met?,
    :path => ":rails_root/public/system/attachments/:id/:style/:basename.:extension", 
    :styles => {
      :original => ['1920x1680>', :jpg],
      :small    => ['100x100#',   :jpg],
      :medium   => ['250x250',    :jpg],
      :large    => ['500x500>',   :jpg]
    },
    :convert_options => { :all => '-background white -flatten +matte' }
	validates :name, :presence => true
	validates :description, :presence => true
	validates_attachment_content_type :photo, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

	#track_history   :on => [:name, :description,:photo],       # track name,description and photo fields only, default is :all
              #    :modifier_field => :modifier, # adds "belongs_to :modifier" to track who made the change, default is :modifier
             #     :modifier_field_inverse_of => :nil, # adds an ":inverse_of" option to the "belongs_to :modifier" relation, default is not set
              #    :version_field => :version,   # adds "field :version, :type => Integer" to track current version, default is :version
             #     :track_create   =>  false,    # track document creation, default is false
              #    :track_update   =>  true,     # track document updates, default is true
               #   :track_destroy  =>  false     # track document destruction, default is false
end
