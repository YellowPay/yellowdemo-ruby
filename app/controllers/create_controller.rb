class CreateController < ApplicationController
  def create
    yellow = Yellow::Client.new(ENV["API_KEY"], ENV["API_SECRET"])

    options = {
        :base_ccy => 'USD',
        :base_price => '0.03',
        :callback => ENV["DEMO_HOST"] + '/ipn'
    }

    @url = yellow.create_invoice(options)['url']
    render "create"
  end
end
