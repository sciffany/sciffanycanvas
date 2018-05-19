#The environment variable DATABASE_URL should be in the following format:
# => postgres://{user}:{password}@{host}:{port}/path
configure :production, :development do
	#db = URI.parse(ENV['DATABASE_URL'] || 'postgres://localhost/mydb')
	db = URI.parse('postgres://uwyflzkdqerqcp:55dfe7127c6e7be5bca5c3403289adc7680e5e4fced3e299433f72cdf77da724@ec2-107-21-99-176.compute-1.amazonaws.com:5432/path' || 'postgres://localhost/mydb')
	
	ActiveRecord::Base.establish_connection(
			:adapter => db.scheme == 'postgres' ? 'postgresql' : db.scheme,
			:host     => db.host,
			:username => db.user,
			:password => db.password,
			:database => db.path[1..-1],
			:encoding => 'utf8'
	)
end