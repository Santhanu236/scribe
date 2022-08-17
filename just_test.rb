test = BCrypt::Password.create('password!')
p test
if test == "password"
    p "yes"
end
