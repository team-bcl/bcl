10.times do  |i|
	TrackList.seed do |track|
		track.id = i + 1
		track.item_id = 1
		track.track_name = "#{i}番目の曲"
	end
end

10.times do  |i|
	TrackList.seed do |track|
		track.id = (i + 10) + 1
		track.item_id = 2
		track.track_name = "#{i}番目の曲"
	end
end

10.times do  |i|
	TrackList.seed do |track|
		track.id = (i + 20) + 1
		track.item_id = 3
		track.track_name = "#{i}番目の曲"
	end
end

10.times do  |i|
	TrackList.seed do |track|
		track.id = (i + 30) + 1
		track.item_id = 4
		track.track_name = "#{i}番目の曲"
	end
end

10.times do  |i|
	TrackList.seed do |track|
		track.id = (i + 40) + 1
		track.item_id = 5
		track.track_name = "#{i}番目の曲"
	end
end