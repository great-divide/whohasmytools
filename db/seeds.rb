ben = User.create(username: "ben", email: "ben@gmail.com", password: "123emily")
brian = User.create(username: "brian", email: "brian@gmail.com", password: "123caley")
drill = Tool.create(name: "drill", description: "cordless dewalt")
ben.tools << drill