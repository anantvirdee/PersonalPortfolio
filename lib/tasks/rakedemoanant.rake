task :go_to_store do
  puts "going to store"
end

task :buy_pasta=>[:go_to_store] do
  puts "buying pasta"
end