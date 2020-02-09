class MeccaComment < ApplicationRecord
	belongs_to :user #User:MeccaComment => 1:多
    belongs_to :mecca #Mecca:MeccaComment => 1:多
end
