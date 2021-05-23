class SignatureVerificationError < Exception
  property message : String?
  property param : String?
  property header : String?

  def initialize(@message, @param, @header)
  end
end

class PayloadParsingError < Exception
  property message : String
  property payload : String

  def initialize(@message, @payload)
  end
end
