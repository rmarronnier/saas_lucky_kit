# Load .env file before any other config or app code.
require "lucky_env"

# If you use .env files in production or test environments, adjust this accordingly.
env_file = Lucky::Env.test? ? ".env.test" : ".env"
LuckyEnv.load(env_file)
# LuckyEnv.load(".env") # if Lucky::Env.development?

# Require your shards here
require "avram"
require "lucky"
require "carbon"
require "authentic"
require "jwt"
require "multi_auth"
require "stripe"

# https://github.com/crystal-i18n/i18n if i18n required
