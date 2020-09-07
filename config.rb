# Activate and configure extensions
# https://middlemanapp.com/advanced/configuration/#configuring-extensions

activate :autoprefixer do |prefix|
  prefix.browsers = "last 2 versions"
end

activate :sprockets

# activate :directory_indexes
activate :relative_assets
set :relative_links, true

# -------------------------------------
#   Layouts
# -------------------------------------
# https://middlemanapp.com/basics/layouts/

page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

# With alternative layout
# page '/path/to/file.html', layout: 'other_layout'

# -------------------------------------
#   Dynamic Pages
# -------------------------------------
# https://middlemanapp.com/advanced/dynamic-pages/

data.projects.each do |project|
  proxy "/projects/#{project.url}.html", "/projects/template.html", :locals => { :project => project }, :ignore => true
end

# proxy(
#   '/this-page-has-no-template.html',
#   '/template-file.html',
#   locals: {
#     which_fake_page: 'Rendering a fake page with a local variable'
#   },
# )

# -------------------------------------
#   Helpers
# -------------------------------------
# Methods defined in the helpers block are available in templates
# https://middlemanapp.com/basics/helper-methods/

helpers do

  def svg(name)
    root = Middleman::Application.root
    file_path = "#{root}/source/assets/images/#{name}"
    return File.read(file_path) if File.exists?(file_path)
    '(not found)'
  end

  def hashify(safebuffer)
    eval(safebuffer.to_str)
  end

end

# Build-specific configuration
# https://middlemanapp.com/advanced/configuration/#environment-specific-settings


# -------------------------------------
#   Development Configuration
# -------------------------------------

configure :development do
  set :css_dir, 'assets/stylesheets'
  set :js_dir, 'assets/javascripts'
  set :images_dir, 'assets/images'
  set :fonts_dir, 'assets/fonts'
  activate :livereload
end

# set :relative_links, true
# set :relative_assets, true

# -------------------------------------
#   Production Configuration
# -------------------------------------

configure :production do
  set :css_dir, 'assets/stylesheets'
  set :js_dir, 'assets/javascripts'
  set :images_dir, 'assets/images'
  set :fonts_dir, 'assets/fonts'
end

# -------------------------------------
#   Build Configuration
# -------------------------------------

configure :build do
   activate :minify_css
   activate :minify_javascript
end

# -------------------------------------
#   Deploy
# -------------------------------------
activate :deploy do |deploy|
  #deploy.build_before   = true
  deploy.deploy_method  = :git
  deploy.branch         = 'gh-pages'
end