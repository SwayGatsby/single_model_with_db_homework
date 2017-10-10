require('pry-byebug')
require_relative('../models/bounty.rb')


bounty1 = Bounty.new({ 'name'=> 'Venom Snake', 'last_known_location'=> 'Siberia', 'danger_level'=> 'medium', 'bounty_value' => 50000})
bounty2 = Bounty.new({ 'name'=> 'Revolver Ocelot', 'last_known_location'=> 'Zanzibar', 'danger_level'=> 'high', 'bounty_value' => 100000})

bounty1.save()

#  INFO: From terminal: psql -d bounties -c 'SELECT * FROM bounties'

bounty1.name = 'Big Boss'
bounty1.update()
#

#
# bounty1.delete()
#
#
#
# bounty2.update()

binding.pry
nil
