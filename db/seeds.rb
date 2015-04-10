Company.create name: "TrapSmart",premium:true
User.create name: "Ed Borden",email: "borden.edward@gmail.com",company_id:1,admin:true,password:"password"
User.create name:"Tom",email:"tom@trapsmart.com",company_id:1,admin:true,password:"password"
User.create name:"Jim",email:"jim@trapsmart.com",company_id:1,admin:true,password:"password"
User.create name:"Shelby",email:"shelby@trapsmart.com",company_id:1,admin:true,password:"password"
User.create name:"Janet",email:"janet@trapsmart.com",company_id:1,admin:true,password:"password"
#25.times do
#	trap = Fabricate(:trap,company_id:1)
#end