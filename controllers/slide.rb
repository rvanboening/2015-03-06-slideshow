
get '/slides' do
  erb :homepage
end

get '/allslides' do
  all_slides=Slide.all # this returns an array of hashes
  all_slides.to_json
end


get '/oneslide/:id' do 
  one_slide = Slide.fetch_slide[params(:id)]
  one_slide.to_json
end
