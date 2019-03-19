require "ruboty/kaiwa/actions/chat"

module Ruboty
  module Handlers
    class Kaiwa < Base
      env :DOCOMO_APIKEY, 'Docomo API key'
      env :DOCOMO_APPID, 'Docomo natural chatting user id'

      on(
        /(?<body>.+)/,
        description: "Talk with you if given message didn't match any other handlers",
        missing: true,
        name: "kaiwa",
      )

      def kaiwa(message)
        Ruboty::Kaiwa::Actions::Chat.new(message).call
      end
    end
  end
end
