

unless ActiveRecord::Base.connection.table_exists?(:users)
 ActiveRecord::Base.connection.create_table :users do |t|
 t.text :user_name
 t.text :password
 t.text :email
 end
end

unless ActiveRecord::Base.connection.table_exists?(:slides)
 ActiveRecord::Base.connection.create_table :slides do |t|
 t.text :title
 t.text :body
 end
end
