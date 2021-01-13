class ThemeFollow < ApplicationRecord
    validates:user_id,{presence:true}
    validates:theme_id,{presence:true}
end
