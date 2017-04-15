module RoomsHelper

	def get_result(file_name="input.txt")
		file_path = Rails.root.join("public/#{file_name}")
		output_array = []
		lines = File.readlines(file_path)
		lines = lines.collect{|a| a.strip.split(/\s+/)}
		data  = lines[1..lines.length]
		#group by rooms
		rooms = data.group_by{|array| array[1] }
		rooms = rooms.sort_by { |key, val| key }
		rooms.each do |key , value|
			#group by users
			total_time = 0
			users = value.group_by{|array| array[0] }
			users.each do |user_key,data_value|
				#puts "users #{user_key}  #{data_value}"
				input_times = data_value.select{|a| a if a[2] == "I"}.collect{|a| a[3].to_i}.sort
				output_times = data_value.select{|a| a if a[2] == "O"}.collect{|a| a[3].to_i}.sort
				#caluclate time
				input_times.each do |in_time|
					#get nearest out time
					near_out_time = output_times.group_by{|e| e <=> in_time}
					begin
						total_time += near_out_time[1][0] - in_time.to_i
					rescue Exception => e
					end
				end
			end
			average_time = ( total_time/ users.keys.uniq.size.to_f).round
			user_count = users.keys.uniq.size
			output_array << "Room #{key}, #{average_time} minute average visit, #{users.keys.uniq.size} visitor(s) total"
		end
		return output_array
	end
end
