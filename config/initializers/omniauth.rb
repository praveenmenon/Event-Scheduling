OmniAuth.config.logger = Rails.logger   
Rails.application.config.middleware.use OmniAuth::Builder do
provider :twitter, 'YHtSRVmjoEloNxgAGk2c5gF3u', 'No0nMMSQrGueYiuSitD6frwpeCgy90NA1giHKRbZw5f8iSxKEx'                
end

OmniAuth.config.on_failure = Proc.new { |env|
  OmniAuth::FailureEndpoint.new(env).redirect_to_failure
}