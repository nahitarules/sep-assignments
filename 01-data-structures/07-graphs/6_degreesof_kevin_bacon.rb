def find_kevin_bacon(start)
  arr = []
  other_arr = []
  count = 0

  start.film_actor_hash.each do |title, actor|
    title.actor.each do |i|
      if i != Kevin_Bacon
        other_arr.push(i)
      elsif i == Kevin_Bacon
        arr.push(title)
        count ++
      end
    end
  end
  other_arr.uniq!

  other_arr.each do |j|
    find_kevin_bacon(j)
  end

  if count < 7
    connection  = arr.join(" -> ")
    puts "#{start} is connected to Kevin Bacon in #{count} steps as follows #{connection}"
  else
    puts "it takes more than 6 steps to connect to Kevin Bacon"
  end
end
