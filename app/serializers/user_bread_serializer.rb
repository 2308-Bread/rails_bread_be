class UserBreadSerializer
  def initialize(user_bread)
    @user_bread = user_bread
    # require 'pry';binding.pry
  end

  def serialized_response
    {
    data: [
      {
        id: @user_bread.id,
        attributes: [
          {
            user_attributes: {
              user_name: @user_bread.user.name,
              email: @user_bread.user.email,
            },
            user_bread_attributes: @user_bread.user.breads.map do |bread|
              {
                bread_attributes: {
                  bread_name: bread.name,
                  description: bread.description,
                  recipe: bread.recipe,
                  bread_country: bread.country.name
                }
              }
            end  
            }
          ]
        }
      ]
    }
  end
end
