require "open-uri"

puts "Deleting users..."
User.destroy_all

jacome = User.create!(email: "jacome@saavedra.com", password: "123456", first_name: "Jácome", last_name: "Saavedra")
aura = User.create!(email: "aura@lopes.com", password: "123456", first_name: "Aura", last_name: "Lopes")
filipe = User.create!(email: "filipe@laferia.com", password: "123456", first_name: "Filipe", last_name: "La Féria")
joao = User.create!(email: "joao@silva.com", password: "123456", first_name: "João", last_name: "Silva")

puts "Deleting pools..."

file_1 = URI.open('https://res.cloudinary.com/dhyx17ztf/image/upload/v1622544683/swimming_dygm3a.jpg')
pool_1 = Pool.create!(title: "Great for swimming", address: "Avenida Marginal, Lisboa", description: "Huge pool for professional swimmers to train", size: '200 m2', user_id: jacome.id)
pool_1.photo.attach(io: file_1, filename: 'swimming_dygm3a.jpg', content_type: 'image/jpg')

file_2 = URI.open('https://res.cloudinary.com/dhyx17ztf/image/upload/v1622563137/green_ayovuc.jpg')
pool_2 = Pool.create!(title: "Salty", address: "Carvalhal, Zambujeira do Mar", description: "Green salt water pool", size: '45 m2', user_id: aura.id)
pool_2.photo.attach(io: file_2, filename: 'green_ayovuc.jpg', content_type: 'image/jpg')

file_3 = URI.open('https://res.cloudinary.com/dhyx17ztf/image/upload/v1622544682/jacuzzi_mkkdgm.jpg')
pool_3 = Pool.create!(title: "Hot like Jacuzzi", address: "Avenida da Liberdade, Lisboa", description: "Perfect to chill with bubbles", size: '10 m2', user_id: aura.id)
pool_3.photo.attach(io: file_3, filename: 'jacuzzi_mkkdgm.jpg', content_type: 'image/jpg')

file_4 = URI.open('https://res.cloudinary.com/dhyx17ztf/image/upload/v1622563412/oceansview_qm9ans.jpg')
pool_4 = Pool.create!(title: "Ocean's view", address: "Furnas do Guincho, Cascais", description: "Pool by the ocean with infinite view", size: '30 m2', user_id: joao.id)
pool_4.photo.attach(io: file_4, filename: 'oceansview_qm9ans.jpg', content_type: 'image/jpg')

file_5 = URI.open('https://res.cloudinary.com/dhyx17ztf/image/upload/v1622555345/beach_p317ar.jpg')
pool_5 = Pool.create!(title: "Beach side", address: "Costa da Caparica, Setúbal", description: "The best of both sides: a pool and a beach", size: '20 m2', user_id: joao.id)
pool_5.photo.attach(io: file_5, filename: 'beach_p317ar.jpg', content_type: 'image/jpg')

file_6 = URI.open('https://res.cloudinary.com/dhyx17ztf/image/upload/v1622555345/hotel_x4x4nl.jpg')
pool_6 = Pool.create!(title: "Our pateo pool", address: "Santa Catarina, Sines", description: "A pool for all our guests", size: '50 m2', user_id: joao.id)
pool_6.photo.attach(io: file_6, filename: 'hotel_x4x4nl.jpg', content_type: 'image/jpg')

file_7 = URI.open('https://res.cloudinary.com/dhyx17ztf/image/upload/v1622561776/rooftop_pzbekq.jpg')
pool_7 = Pool.create!(title: "Rooftop pool", address: "Marquês de Pombal, Lisboa", description: "Dive at the top of the city", size: '20 m2', user_id: jacome.id)
pool_7.photo.attach(io: file_7, filename: 'rooftop_pzbekq.jpg', content_type: 'image/jpg')

file_8 = URI.open('https://res.cloudinary.com/dhyx17ztf/image/upload/v1622561775/lake_n8njct.jpg')
pool_8 = Pool.create!(title: "Lake dive", address: "Bacelo, Évora", description: "A dive and multiple activities in it", size: '400 m2', user_id: joao.id)
pool_8.photo.attach(io: file_8, filename: 'lake_n8njct.jpg', content_type: 'image/jpg')

file_9 = URI.open('https://res.cloudinary.com/dhyx17ztf/image/upload/v1622631869/douro_dpbji8.jpg')
pool_9 = Pool.create!(title: "Bio Pool", address: "Ericeira", description: "Dip on our natural pool", size: '200 m2', user_id: aura.id)
pool_9.photo.attach(io: file_9, filename: 'douro_dpbji8.jpg', content_type: 'image/jpg')

puts "#{User.count} users where created..."
puts "#{Pool.count} pools where created..."
