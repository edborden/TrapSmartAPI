company = Company.create name: "TrapSmart",premium:true
user = User.create name: "Ed Borden",email: "borden.edward@gmail.com",company_id:1,admin:true,password:"password"
25.times do
	trap = Fabricate(:trap,company_id:1)
end