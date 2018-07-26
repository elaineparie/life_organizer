
User.create(username: "lordgains", password: "Temp444")
User.create(username: "elaineparie", password: "hithere")

List.create(name: "School", user_id: 1)
List.create(name: "Cleaning", user_id: 1)
List.create(name: "Food", user_id: 1)

List.create(name: "Work", user_id: 2)
List.create(name: "Family", user_id: 2)
List.create(name: "Appointments", user_id: 2)

Task.create(name: "Family reunion this Sunday!", importance: 6, list_id: 5)
Task.create(name: "Answer all emails", importance: 9, list_id: 4)
Task.create(name: "Find a Primary Care", importance: 7, list_id: 6)

Task.create(name: "History Assignment", importance: 10, list_id: 1)
Task.create(name: "Clear out closet", importance: 5, list_id: 2)
Task.create(name: "Buy bananas", importance: 5, list_id: 3)

Task.create(name: "That baby party", importance: 6, list_id: 5)
Task.create(name: "Call boss and ask for raise", importance: 9)
Task.create(name: "Order contacts", importance: 7)

Task.create(name: "Math problems 1-10", importance: 10, list_id: 1)
Task.create(name: "Clean pool", importance: 5, list_id: 2)
Task.create(name: "Oatmeal", importance: 5, list_id: 3)
