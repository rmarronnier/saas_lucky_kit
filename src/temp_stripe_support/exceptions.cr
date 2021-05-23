class SignatureVerificationError < Exception
  include JSON::Serializable
  property message : String?
  property param : String?
  property header : String?

  def initialize(@message, @param, @header)
  end
end
