require 'faraday'
require 'json'

module Ruboty
  module Kaiwa
    module Actions
      class Chat < Ruboty::Actions::Base
        def call
          message.reply(chat(message[:body]))
        end

        private

        URL = 'https://api.apigw.smt.docomo.ne.jp/naturalChatting/v1/dialogue'

        def client
          @client ||= Faraday.new(url: URL) do |faraday|
            faraday.adapter Faraday.default_adapter
          end
        end

        def post(message)
          client.post do |req|
            req.params[:APIKEY] = ENV['DOCOMO_APIKEY']
            req.headers['Content-Type'] = 'application/json'
            req.body = {
              language: 'ja-JP',
              botId: 'Chatting',
              appId: ENV['DOCOMO_APPID'],
              voiceText: message
            }.to_json
          end
        end

        def chat(message)
          res = post(message)
          get_message(res.body)
        end

        def get_message(response)
          res = JSON.parse(response)
          res['systemText']['expression']
        end
      end
    end
  end
end
