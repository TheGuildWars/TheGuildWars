# Create Regions
["Europe", "North America"].each do |region|
  Region.find_or_create_by_name(region).save
end

# NA Worlds
["Anvil Rock", "Blackgate", "Borlis Pass", "Crystal Desert", "Darkhaven", "Devona's Rest", "Dragonbrand", "Ehmry Bay", "Eredon Terrace",
  "Ferguson's Crossing", "Fort Aspenwood", "Gate of Madness", "Henge of Denravi", "Isle of Janthir", "Jade Quarry", "Kaineng", "Maguuma",
  "Northern Shiverpeaks", "Sanctum of Rall", "Sea of Sorrows", "Sorrow's Furnace", "Stormbluff Isle", "Tarnished Coast", 
  "Yak's Bend"].each do |w|
  world = World.find_or_create_by_name(w)
  world.region_id = Region.find_by_name("North America").id
  world.save
end

# Europe Worlds
["Aurora Glade", "Blacktide", "Desolation", "Far Shiverpeaks", "Fissure of Woe", "Gandara", "Gunnar's Hold", "Piken Square", "Ring of Fire",
  "Ruins of Surmia", "Seafarer's Rest", "Underworld", "Vabbi", "Whiteside Ridge", "Arborstone", "Augury Rock", "Fort Ranik", "Jade Sea",
  "Vizunah Square", "Abaddon's Mouth", "Drakkar Lake", "Dzagonur", "Elona Reach", "Kodash", "Miller's Sound", "Riverside", 
  "Baruch Bay"].each do |w|
world = World.find_or_create_by_name(w)
world.region_id = Region.find_by_name("Europe").id
world.save
end