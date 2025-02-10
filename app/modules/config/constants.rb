module Config
  class Constants
    PASSWORD_FORMAT = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&]).{8,}$/
  end
end
