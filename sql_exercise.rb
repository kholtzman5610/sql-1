require 'sqlite3'

if File.exists?("maindata.db")
  File.delete("maindata.db")
end


db = SQLite3::Database.new("maindata.db")

db.execute <<-SQL
    create table users(
      id integer primary key,
      email varchar,
      password varchar);
SQL

db.execute("INSERT INTO users(email,password) values(?,?)", ["bob@example.com", "pass123"])
db.execute("INSERT INTO users(email,password) values(?,?)", ["john@example.com", "pass123"])
db.execute("INSERT INTO users(email,password) values(?,?)", ["mary@example.com", "pass123"])

my_array = db.execute("SELECT * FROM users;")

puts my_array