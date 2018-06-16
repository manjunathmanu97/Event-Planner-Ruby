require '\Users\MANJUNATH\Desktop\ruby_header\lib\desinger.rb'
require '\Users\MANJUNATH\Desktop\ruby_header\lib\catering.rb'
require '\Users\MANJUNATH\Desktop\ruby_header\lib\loaction.rb'
require '\Users\MANJUNATH\Desktop\ruby_header\lib\musicphoto.rb'



class Guide

    class Confignum
    	@@options = ["1","2","3","4",'quit']
    	def self .options;
    		@@options
    	end
    end

 

 class Config
		@@actions = ['search','add','quit']
		def self .actions;
			@@actions
		end
 end


 def initialize(path1 = nil,path2 = nil,path3 = nil,path4 = nil)
		#locate the event text file at path
		Designer.filepath = path1
		Loaction.filepath = path2
		Catering.filepath = path3
		Musicpht.filepath = path4
		if Designer.file_usable?
			puts "found desinger file"
		#or create a new file
	    elsif Designer.create_file
		  puts "created desinger file"
			
		#exits if create fails
	    else
		 puts "exiting.\n\n"
		 exit!
	   end
	   if Loaction.file_usable?
			puts "found Loaction file"
		#or create a new file
	   elsif Loaction.create_file
		puts "created Loaction file"
			
		#exits if create fails
	   else
		puts "exiting.\n\n"
		exit!
	   end
	   if Catering.file_usable?
			puts "found Catering file"
		#or create a new file
	   elsif Catering.create_file
		puts "created Catering file"
			
		#exits if create fails
	   else
		puts "exiting.\n\n"
		exit!
	   end
	   if Musicpht.file_usable?
			puts "found Musicpht file"
		#or create a new file
	   elsif Musicpht.create_file
		puts "created Musicpht file"
			
		#exits if create fails
	   else
		puts "exiting.\n\n"
		exit!
	    end
  end
	

 def launch!
	introduction
	#actions loop
	result = nil
	until result == :quit #what do you want to do? (search,add,quit)
		action= get_action
		result = do_action(action)
	
	#do that action
	#repeat until user quits
    consulation
 end 
 end

 def introduction
    puts "\t\t>>>>>Welcome to Event Planner>>>>>>>>>>\t\t\n\n"
    puts "\t\t\n\nthis is interactive guide to plan a event\n\n\n"
    
 end

 def consulation
	puts "\n\n\t\t\tThank you,have a wonderful day\n\n\n"
 end

 def do_action(action)
	case action
	when 'search'
		search
	when 'add'
		add
	when 'quit'
		return :quit
	else 
		puts "\n I don't understand that command.\n"
	end
 end
 def get_action
	action = nil
	until Guide::Config.actions.include?(action)
		puts "Actions: " + Guide::Config.actions.join(",") 
		print ">"
		user_response = gets.chomp
		action = user_response.downcase
	end
	return action
 end 
 def search
	puts "\t\t\twhat do you want to search\n"
	puts "\n[1)loaction,2)desinger,3)catering,4)musicphoto,quit]"
    puts "\nplease enter your opion"
	option = nil
	until Guide::Confignum.options.include?(option)
		puts "Options :" + Guide::Confignum.options.join(",")
		print ">"
        search_response = gets.chomp
        option = search_response
    end
    case option
    when "1"
    	loc_search
    when "2"
    	 designer_search
    when "3"
    	catering_search
    when "4"
    	musicphoto_search
    when "quit"
        return :quit 
    else 
    	puts "\n i dont understand that command"
    end
 end

 


def designer_search

	puts "\n\n\t\tenter  disigner name or from which city  or price"
	print ">"
	des = gets.chomp.downcase
     output_action_header(" Results ")
     if des
     desingers = Designer.saved_desingers
    
     found = Designer.saved_desingers.select do |rest|

     	rest.include?(des.downcase) ||
     	rest.include?(des.downcase) ||
     	rest.include?(des.downcase) 
     	
     end
     output_table(found)
 else
 	puts "try using proper city or name \n\n"

 end
 end

def loc_search
	puts "\n\n\t\tenter  where you want to search for loaction"
	print ">"
	locr = gets.chomp.downcase
     output_action_header(" Results ")
     if locr
     loactions = Loaction.saved_loactions

     found = Loaction.saved_loactions.select do |rest|
     	rest.include?(locr.downcase) ||
     	rest.include?(locr.downcase) ||
     	rest.include?(locr.downcase) 
     	
     end
     output_table(found)
     else
     	puts "try using proper city or name \n\n"
     end
 

 end

def catering_search
 	caterings = []
	puts "\n\n\t\tenter  where you want to search for catering or  catering name"
	print ">"
	cat = gets.chomp.downcase
     output_action_header(" Loactions ")
     if cat
     caterings = Catering.saved_catering
     
     found = Catering.saved_catering.select do |rest|
     	rest.include?(cat.downcase) ||
     	rest.include?(cat.downcase) ||
     	rest.include?(cat.downcase) 
     	
     	
      end
      output_table(found)
 end
 
 end



 def musicphoto_search
 	caterings = []
	puts "\n\n\t\tenter  where you want to search for dj or  photo"
	print ">"
	mus = gets.chomp.downcase
     output_action_header(" Results")
     if mus
     musicphts = Musicpht.saved_musicphts
     
     found = Musicpht.saved_musicphts.select do |rest|
     	rest.include?(mus.downcase) ||
     	rest.include?(mus.downcase) ||
     	rest.include?(mus.downcase) 
     	
     	
      end
      output_table(found)
 end
 
 end

 def add
	puts "what do you want to add"
	puts "[1)loaction,2)desinger,3)catering,4)musicphoto,quit]"
    puts "please enter your opion"
	option = nil
	until Guide::Confignum.options.include?(option)
		puts "Options :" + Guide::Confignum.options.join(",")
		print ">"
        search_response = gets.chomp
        option = search_response
    end
    case option
    when "1"
    	loc_add
    when "2"
    	designer_add
    when "3"
    	catering_add
    when "4"
    	musicphoto_add
    when "quit"
        return :quit 
    else 
    	puts "\n i dont understand that command"
    end
 end

 def loc_add
	output_action_header("add a loaction")
	loaction = Loaction.build_using_questions
	if loaction.save
		puts "\n loaction added\n\n"
	else
		puts "\n\n save error : location not added\n\n"
	end
 end


 def designer_add
	output_action_header("add a desinger")
	desinger = Designer.build_using_questions
	if desinger.save
		puts "\n desinger added\n\n"
	else
		puts "\n\n save error : desinger not added\n\n"
	end
 end
 def catering_add
	output_action_header("add a catering")
	catering = Catering.build_using_questions
	if catering.save
		puts "\n catering added\n\n"
	else
		puts "\n\n save error : catering not added\n\n"
	end
 end
 def musicphoto_add
	output_action_header("add a musicphoto company")
	musicphts = Musicpht.build_using_questions
	if musicphts.save
		puts "\n musicphoto added\n\n"
	else
		puts "\n\n save error : musicphoto not added\n\n"
	end
 end

 def output_action_header(text)
 	puts "\n#{text.upcase.center(60)}\n\n"
 end

 def output_table(found = [ ])

     print " " + 'name'.ljust(30)
     print " " + 'city'.ljust(20)
     print " " + 'state'.ljust(20)
     print " " + 'contact_number'.ljust(20)
     print " " + 'price'.rjust(6) + "\n"
     puts "_" * 120
     
     found.each do |rest| 
     	line = rest.shift.ljust(30)+ " " + rest.shift.ljust(20)+ " " + rest.shift.ljust(20)+ " " +rest.shift.ljust(20) +" "+ rest.shift.ljust(6)
     	 
     	
     	puts line
     end

      
     	
       	end
  
 end  
     	
 

