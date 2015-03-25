Company.create name: "TrapSmart"
user = User.create name: "Ed Borden",email: "borden.edward@gmail.com",company_id:1,admin:true
user.password = "password"
user.save