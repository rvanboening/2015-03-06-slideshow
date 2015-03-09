# require "sqlite3"
# require "pry"
# require "sinatra"
# require 'json'
#
# DATABASE = SQLite3::Database.new("slideshow.db")
# require_relative "../database_setup.rb"

class Slide
  attr_reader :id 
  attr_accessor :title, :body
  
 def initialize(options)
   @id    = options["id"]
   @title = options["title"]
   @body  = options["body"]
 end
 
 #Select all slides from Database
 #this returns an array of hashes
 
 def self.fetch_all
   DATABASE.execute("SELECT * FROM slides")
 end
 
 #Select one slides from Database
 #returns an object?
 
 def self.fetch_slide(s_id) 
   #{s_id}.to_i
   DATABASE.execute("SELECT * FROM slides WHERE id = #{s_id}")[0]
   
 end
 
 # Inserts a new slide
 def insert(title, body)
   DATABASE.execute("INSERT INTO slides (title, body) VALUES ('#{title}', '#{body}')")
   @id = DATABASE.last_insert_row_id
 end
 
 def to_hash
    {
      id: id,
      title: title,
      body: body,
    }
  end
end
# binding.pry