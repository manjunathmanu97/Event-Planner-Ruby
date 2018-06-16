require '\Users\MANJUNATH\Desktop\ruby_header\contact_info.rb'

class Designer
  include CONTACT_INFO


   @@filepath = nil

 def self .filepath=(path = nil)
 	@@filepath = File.join(APP_ROOT,path)
 end
  def self .file_exists?
  if @@filepath && File.exists?(@@filepath)
  	return true
  else
  	return false
  end
end
  def self .file_usable?
  	return false unless @@filepath
  	return false unless File.exists?(@@filepath)
  	return false unless File.readable?(@@filepath)
  	return false unless File.writable?(@@filepath)
  	return true
  end

  def self .create_file
     File.open(@@filepath,'w') unless file_exists?
     return file_usable?
  end
  def self.saved_desingers
  	desingers = []
  	if file_usable?
  		file = File.new(@@filepath,'r')
  		file.each_line do |line|
             desingers << Designer.new.import_line(line.chomp)
  		end
  		file.close
  	end
  	return desingers
  end


  def self.build_using_questions
  	args = {}

  	print "designer name :"
  	args[:name] = gets.chomp.strip
  	print "city:"
  	args[:city] = gets.chomp.strip
  	print "state:"
  	args[:state] = gets.chomp.strip
  	print "contact_no:"
  	args[:contact_no] = gets.chomp.strip
  	print "price:"
  	args[:price] = gets.chomp.strip

  	return self.new(args)
  end



  def initialize(args={})
  	@name = args[:name] || ""
  	@city = args[:city] || ""
  	@state = args[:state] || ""
  	@contact_no = args[:contact_no] || ""
  	@price = args[:price] || ""
  end


  def import_line(line)
   #puts "#{line}"
  	line_array = line.split("\t")
  	@name = line_array.shift
    @city = line_array.shift
    @state = line_array.shift
    @contact_no = line_array.shift
    @price = line_array.shift
  	return @name,@city,@state,@contact_no,@price
  end


  def save
  	return false unless Designer.file_usable?
  	File.open(@@filepath,'a') do |file|
  		file.puts "#{[@name,@city,@state,@contact_no,@price].join("\t")}\n"
  	end
  	return true
  end
  def formatted_price
  	number_to_currency(@price)
  end

 end