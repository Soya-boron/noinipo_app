class Theme < ApplicationRecord
    validates:user_id,{presence:true}
    validates:name,{presence:true}
end
