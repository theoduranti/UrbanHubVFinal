class Event < ApplicationRecord

    belongs_to :creator, class_name: "Ele"
    has_and_belongs_to_many :attendees, class_name: "Ele"
    
    belongs_to :creator, class_name: "Pro"
    has_and_belongs_to_many :attendees, class_name: "Pro"

end
