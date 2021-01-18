class Post < ApplicationRecord
    belongs_to :user
    has_many_attached :images

    # def images_url
    #     if images.attached?
    #         images.blob.service_url
    #     end
    # end
end
