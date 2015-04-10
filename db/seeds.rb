company = Company.create name: "TrapSmart",premium:true
user = User.create name: "Ed Borden",email: "borden.edward@gmail.com",company_id:1,admin:true,password:"password"
user = User.new name:"Tom",email:"tom@trapsmart.com",company_id:1,admin:true
password = user.set_password
user.save
Mailer.new.welcome user,password
user = User.new name:"Jim",email:"jim@trapsmart.com",company_id:1,admin:true
password = user.set_password
user.save
Mailer.new.welcome user,password
user = User.new name:"Shelby",email:"shelby@trapsmart.com",company_id:1,admin:true
password = user.set_password
user.save
Mailer.new.welcome user,password
user = User.new name:"Janet",email:"janet@trapsmart.com",company_id:1,admin:true
password = user.set_password
user.save
Mailer.new.welcome user,password
#25.times do
#	trap = Fabricate(:trap,company_id:1)
#end