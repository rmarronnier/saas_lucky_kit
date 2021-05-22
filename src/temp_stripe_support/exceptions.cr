class SignatureVerificationError < Exception
  property message : String?
  property param : String?
  property header : String?

  def initialize(@message, @param, @header)
  end
end
