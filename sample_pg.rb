require 'pg'
connection = PG::connect(dbname: "goya")
connection.internal_encoding = "UTF-8"
begin
  result = connection.exec("select weight, give_for from crops;")
  result.each do |record|
    puts "ゴーヤの大きさ:#{record["weight"]} 売った相手 :#{record["give_for"]}"
    end

    result = connection.exec("select quality from crops where quality = false;")
    result.each do |record|
    puts "品質:#{record["quality"]}"
    end

    result = connection.exec("select give_for from crops where give_for != '自家消費';")
    result.each do |record|
    puts "自家消費以外:#{record["give_for"]}"
    end
    
ensure
  connection.finish
end
