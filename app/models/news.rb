class News < ApplicationRecord
    # has_one_attached :image
    has_many_attached :images
    belongs_to :user
    
    validates :title, presence: true
    validates :body, presence: true
    validates :date, presence: true
    
   
    # def image_url
    #     Rails.application.routes.url_helpers.url_for(images) if images.attached?
    # end

    def image_url
        if images.attached?
          images.map { |image| Rails.application.routes.url_helpers.url_for(image) }
        else
          nil
        end
      end
      
    
end
