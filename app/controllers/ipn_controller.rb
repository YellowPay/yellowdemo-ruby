class IpnController < ApplicationController
  def ipn
    yellow = Yellow::Client.new(ENV["API_KEY"], ENV["API_SECRET"])
    
    request_url = JSON.parse(request.body.read)['callback']
    reqeust_signature = request.headers['HTTP_API_SIGN']
    request_nonce = request.headers['HTTP_API_NONCE']
    
    is_verified = yellow.verify_ipn(request_url, reqeust_signature, request_nonce, request.body.read)

    if is_verified
        puts "Request Verified"
        render status: 200
    else
        puts "Request NOT Verified"
        render status: 403
    end
  end
end
