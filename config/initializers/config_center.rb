module ConfigCenter

  module GeneralValidations

    # Email format
    EMAIL_FORMAT_REG_EXP = /\A(|(([A-Za-z0-9]+_+)|([A-Za-z0-9]+\-+)|([A-Za-z0-9]+\.+)|([A-Za-z0-9]+\++))*[A-Za-z0-9]+@((\w+\-+)|(\w+\.))*\w{1,63}\.[a-zA-Z]{2,6})\z/i

    #  Name
    NAME_MIN_LEN = 3
    NAME_MAX_LEN = 50
    NAME_FORMAT_REG_EXP = /\A[a-zA-Z1-9\-\ \(\)\.+]*\z/i
   
    

    # Password
    # should have atleast 1 Character (a to z (both upper and lower case))
    # and 1 Number (1 to 9)
    # and 1 Special Character from (!,@,$,&,*,_)",
    PASSWORD_MIN_LEN = 6
    PASSWORD_MAX_LEN = 50
    PASSWORD_FORMAT_REG_EXP = /\A(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9!@$#&*_\.,;:])/

  end

end