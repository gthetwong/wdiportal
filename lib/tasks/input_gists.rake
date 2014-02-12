task :input_gists => :environment do 

	begin
		file = File.read("gists.csv")
		csv = CSV.parse(file)
		csv.each do |row|
			Gist.create(title: row[0], url: row[1], instructor: row[2])
		end

	rescue IOError => e
		puts "Something went wrong #{e.message}"
	end

end