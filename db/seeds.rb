
user1 = User.create(username: "lordgains", password: "Temp444")
user2 = User.create(username: "elaineparie", password: "hithere")

list1 = List.create(name: "School", user_id: 1)
list2 = List.create(name: "Cleaning", user_id: 1)
list3 = List.create(name: "Food", user_id: 1)

list4 = List.create(name: "Work", user: user1)
list5 = List.create(name: "Family", user: user1)
list6 = List.create(name: "Appointments", user: user1)

Task.create(name: "Family reunion this Sunday!", importance: 6, list: list5)
Task.create(name: "Answer all emails", importance: 9, list: list4)
Task.create(name: "Find a Primary Care", importance: 7, list: list6)

Task.create(name: "History Assignment", importance: 10, list: list1)
Task.create(name: "Clear out closet", importance: 5, list: list2)
Task.create(name: "Buy bananas", importance: 5, list: list3)

Task.create(name: "That baby party", importance: 6, list: list5)
Task.create(name: "Call boss and ask for raise", importance: 9, list: list4)
Task.create(name: "Order contacts", importance: 7, list: list6)

Task.create(name: "Math problems 1-10", importance: 10, list: list1)
Task.create(name: "Clean pool", importance: 5, list: list2)
Task.create(name: "Oatmeal", importance: 5, list: list3)
