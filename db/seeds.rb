if Rails.env.development?

  # create stores
  store_1 = Store.create!(store_name: 'Sklep u Jędrzeja', phone_number: '852852852', street_name: 'Wspaniała',
                          building_number: '78A', apartment_number: '13', city: 'Rzeszów', post_code: '11-100',
                          country: 'Poland', nip: '789-852-26-25')
  store_2 = Store.create!(store_name: 'Sklep u Andrzeja', phone_number: '741852963', street_name: 'Oszałamiająca',
                          building_number: '13', apartment_number: nil, city: 'Olsztyn', post_code: '20-222',
                          country: 'Poland', nip: '456-456-25-25')

  # create admin and superadmin
  admin = User.create!(email: 'luke.skywalker@example.com', store_id: nil, password: 'haslo123', password_confirmation: 'haslo123')
  super_admin = User.create!(email: 'obi.wan@example.com', store_id: nil, password: 'haslo123', password_confirmation: 'haslo123')
  admin_role = Role.create!(name: 'admin')
  super_admin_role = Role.create!(name: 'super_admin')
  RolesUser.create!(user_id: admin.id, role_id: admin_role.id)
  RolesUser.create!(user_id: super_admin.id, role_id: super_admin_role.id)
  
  # create users belongs_to store
  User.create!(first_name: 'Jędrzej', last_name: 'Olbrachczyk', phone_number: '456-456-459',
               street_name: 'Krzywa', building_number: '33F', apartment_number: '8', city: 'Orzysz', post_code: '12-251',
               country: 'Poland', email: 'jedrzej.olbrachczyk@kerno.pl', password: "rudalala", store_id: store_1.id,
               active: true)
  User.create!(first_name: 'Andrzej', last_name: 'Kiszony', phone_number: '963-963-963',
               street_name: 'Prosta', building_number: '2', apartment_number: nil, city: 'Olsztyn', post_code: '20-222',
               country: 'Poland', email: 'andrzej.kiszony@kerno.com', password: "rudalala", store_id: store_2.id,
               active: true)

  # create clients belongs_to store
  Client.create!(first_name: 'Czesław', last_name: 'Kilof', phone_number: '456789123', street_name: 'Językowa',
                 building_number: '12', apartment_number: '124', city: 'Leszno', post_code: '12-123', country: 'Poland',
                 store_id: store_1.id)
  Client.create!(first_name: 'Jarek', last_name: 'Zdrowy', phone_number: '445588668', street_name: 'Zielona',
                 building_number: '10', apartment_number: '50', city: 'Augustów', post_code: '16-300', country: 'Poland',
                 store_id: store_2.id)

  # create door_groups
  door_group_1 = DoorGroup.create!(name: "Drzwi Wewnętrzne")
  door_group_2 = DoorGroup.create!(name: "Drzwi Zewnętrzne")

  # create door_collections belongs_to door_group
  door_collection_1 = DoorCollection.create!(collection_name: "PINUS", door_group_id: door_group_1.id)
  door_collection_2 = DoorCollection.create!(collection_name: "FREX", door_group_id: door_group_2.id)

  # create door_model belongs_to door_group and door_collection
  DoorModel.create!(name: "Pinus1", door_group_id: door_group_1.id, door_collection_id: door_collection_1.id)
  DoorModel.create!(name: "Pinus2", door_group_id: door_group_2.id, door_collection_id: door_collection_2.id)

  #create door_type belongs_to door_group
  DoorType.create!(type_name: "Bezprzylgowe", door_group_id: door_group_1.id)
  DoorType.create!(type_name: "Ukryte", door_group_id: door_group_2.id)

  #create door_layout belongs_to door_group
  DoorLayout.create!(layout_name: "Pojedyńcze", door_group_id: door_group_1.id)
  DoorLayout.create!(layout_name: "Dwuskrzydłowe", door_group_id: door_group_2.id)

  #create opening_type belongs_to door_group
  OpeningType.create!(opening_type_name: "Lew/Zew", door_group_id: door_group_1.id)
  OpeningType.create!(opening_type_name: "Praw/Zew", door_group_id: door_group_2.id)
end
