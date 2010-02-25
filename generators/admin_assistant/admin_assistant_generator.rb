class AdminAssistantGenerator < Rails::Generator::Base
  def manifest
    record do |m|
      # stylesheets
      m.directory 'public/stylesheets/admin_assistant'
      %w[activescaffold default].each do |css_file|
        m.file "stylesheets/#{css_file}.css", "public/stylesheets/admin_assistant/#{css_file}.css"
      end

      # javascripts
      m.file 'javascripts/admin_assistant.js', 'public/javascripts/admin_assistant.js'

      # images
      m.directory 'public/images/admin_assistant'
      %w[sort-asc sort-desc].each do |image_file|
        m.file "images/#{image_file}.png", "public/images/admin_assistant/#{image_file}.png"
      end
    end
  end
end