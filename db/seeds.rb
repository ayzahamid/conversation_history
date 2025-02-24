user1 = User.create!(
  first_name: "Alice",
  last_name: "Doe",
  email: "alice@example.com",
  password: "Pas$w0rd2",
  password_confirmation: "Pas$w0rd2"
)

user2 = User.create!(
  first_name: "Bob",
  last_name: "Smith",
  email: "bob@example.com",
  password: "Pas$w0rd2",
  password_confirmation: "Pas$w0rd2"
)

projects = []
5.times do |i|
  projects << Project.create!(
    name: "Project #{i + 1}",
    description: "Description for Project #{i + 1}",
    code: "PRJ#{100 + i}",
    creator_id: user1.id,
    status: i.even? ? "pending" : "in_progress"
  )
end

project1 = projects.first
3.times do |i|
  project1.comments.create!(
    content: "Comment #{i + 1} on Project 1",
    author_id: user2.id,
    creator: user2.first_name
  )
end

puts "Seed data successfully added!"
