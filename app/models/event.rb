class Event < ApplicationRecord

    belongs_to :creator, class_name: "Ele", optional: true
    has_and_belongs_to_many :eleattendees, class_name: "Ele"
    has_and_belongs_to_many :eleinvitatees, class_name: "Ele"
    
    belongs_to :creator, class_name: "Pro", optional: true
    belongs_to :professor, class_name: "Pro", optional: true
    has_and_belongs_to_many :proattendees, class_name: "Pro"
    has_and_belongs_to_many :proinvitatees, class_name: "Pro"

end
