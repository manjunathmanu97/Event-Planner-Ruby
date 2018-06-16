


APP_ROOT = File.dirname(__FILE__)
$:.unshift( File.join(APP_ROOT,'lib'))
require 'guide'

guide = Guide.new('designer_t.txt','location_t.txt','catering_t.txt','music_t.txt')
guide.launch!

