ben = User.create(username: "ben", email: "ben@gmail.com", password: "starlight123")
brian = User.create(username: "brian", email: "brian@gmail.com", password: "sunshineabc")
drill = Tool.create(name: "drill", description: "cordless dewalt")
ben.tools << drill