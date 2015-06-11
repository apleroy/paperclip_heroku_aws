task :update_post_slugs => :environment do
  Post.find_each(&:save)
end