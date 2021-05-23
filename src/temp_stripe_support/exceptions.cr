class SignatureVerificationError < Exception
  include JSON::Serializable
  property message : String?
  property param : String?
  property header : String?

  def initialize(@message, @param, @header)
  end
end

class PayloadParsingError < Exception
  include JSON::Serializable
  property message : String?
  property payload : String

  property parsing_error : String

  def initialize(@message, @payload, @parsing_error)
  end
end
