user1 = User.create(username: "user1", email: "user1@gmail.com", password: "starlight123")
user2 = User.create(username: "user2", email: "user2@gmail.com", password: "sunshineabc")
drill = Tool.create(name: "drill", description: "cordless dewalt")
user1.tools << drill