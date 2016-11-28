desc "This task updates news articles in Database"
task :update_articles => :environment do
  puts "Updating articles..."
  Article.update
  puts "done."
end
