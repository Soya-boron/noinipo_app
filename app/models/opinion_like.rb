class OpinionLike < ApplicationRecord
    validates:user_id,{presence:true}
    validates:opinion_id,{presence:true}
end
