
DATABASE.results_as_hash = true

DATABASE.execute("CREATE TABLE IF NOT EXISTS users (id INTEGER PRIMARY KEY, user_name TEXT,
                  password TEXT, email TEXT)")
                  
DATABASE.execute("CREATE TABLE IF NOT EXISTS slides (id INTEGER PRIMARY KEY, 
                  title TEXT, body TEXT)")