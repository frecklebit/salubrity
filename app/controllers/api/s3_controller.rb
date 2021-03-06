class Api::S3Controller < Api::BaseController
  def token
    render json: {
        policy:    s3_upload_policy,
        signature: s3_upload_signature,
        key:       ENV['AWS_S3_KEY']
      }
  end

  private

  def s3_upload_policy
    @policy ||= create_s3_upload_policy
  end

  def create_s3_upload_policy
    Base64.encode64(
      {
        "expiration" => 1.hour.from_now.utc.xmlschema,
        "conditions" => [ 
          { "bucket" =>  ENV['AWS_S3_BUCKET'] },
          [ "starts-with", "$key", "" ],
          { "acl" => "public-read" },
          [ "starts-with", "$Content-Type", "" ],
          [ "content-length-range", 0, 10 * 1024 * 1024 ]
        ]
      }.to_json).gsub(/\n/,'')
  end

  def s3_upload_signature
    Base64.encode64(OpenSSL::HMAC.digest(OpenSSL::Digest::Digest.new('sha1'), ENV['AWS_S3_SECRET'], s3_upload_policy)).gsub("\n","")
  end
end
