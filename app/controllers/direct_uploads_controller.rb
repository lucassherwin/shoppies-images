class DirectUploadsController < ActiveStorage::DirectUploadsController
    skip_before_action :verify_authenticity_token

    # def create
    #     blob = ActiveStorage::Blob.create_before_direct_upload!(blob_args)
    #     render json: direct_upload_json(blob)
    # end

    # private

    # def direct_upload_json(blob)
    #     blob.as_json(root: false, methods: :signed_id).merge(service_url: url_for(blob)).merge(direct_upload: {
    #         url: blob.service_url_for_direct_upload,
    #         headers: blob.service_headers_for_direct_upload
    #     })
    # end

    # from https://gist.github.com/elliott-king/12bc6c9ff9a69b5f04d74ebb263ba702
    # def create
    #     response = generate_direct_upload(blob_params)
    #     render json: response
    #   end
    
    #   private
    #   def blob_params
    #     params.require(:file).permit(:filename, :byte_size, :checksum, :content_type, metadata: {})
    #   end
    
    #   def generate_direct_upload(blob_args)
    #     blob = create_blob(blob_args)
    #     response = signed_url(blob)
    #     response[:blob_signed_id] = blob.signed_id
    #     response
    #   end
    
    #   def create_blob(blob_args)
    #     blob = ActiveStorage::Blob.create_before_direct_upload!(blob_args.to_h.deep_symbolize_keys)
    #     pdf_id = SecureRandom.uuid # the name of the file will just be a UUID
    #     blob.update_attribute(:key, "uploads/#{pdf_id}") # will put it in the uploads folder
    #     blob
    #   end
    
    #   def signed_url(blob)
    #     expiration_time = 10.minutes
    #     response_signature(
    #       blob.service_url_for_direct_upload(expires_in: expiration_time),
    #       headers: blob.service_headers_for_direct_upload
    #     )
    #   end
    
    #   def response_signature(url, **params)
    #     {
    #       direct_upload: {
    #         url: url
    #       }.merge(params)
    #     }
    #   end
end