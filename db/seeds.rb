articles = Article.create([
  {title: "Primer Articulo", content: " Este es el contenido del articulo. Este es el contenido del articulo."},
  {title: "Segundo Articulo", content: "Este es el contenido del articulo. Este es el contenido del articulo."},
  {title: "Tercer Articulo", content: "Este es el contenido del articulo. Este es el contenido del articulo."},
  {title: "Cuarto Articulo", content: "Este es el contenido del articulo. Este es el contenido del articulo."},
   {title: "Quinto Articulo", content: "Este es el contenido del articulo. Este es el contenido del articulo."}
])


request = OpenStruct.new(
  params: { },
  referer: Faker::Internet.url,
  remote_ip: Faker::Internet.public_ip_v4_address,
  user_agent: Faker::Internet.user_agent,
  original_url: "http://localhost:3000/articles",
)

visit_properties = Ahoy::VisitProperties.new(request, api: nil)
properties = visit_properties.generate.select { |_, v| v }

6.times do |i|

  rand(10).times do |visits_count|
    example_visit = Ahoy::Visit.create!(properties.merge(
    visit_token: SecureRandom.uuid,
    visitor_token: SecureRandom.uuid,
    started_at: DateTime.now - i.days
    ))
    
    example_event = Ahoy::Event.create!(
      visit: example_visit,
      name: 'example_event',
      properties: 'example properties',
      time: DateTime.now - i.days
    )


  end
end