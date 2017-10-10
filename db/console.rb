require( 'pg' )

class Bounty

  attr_accessor :name, :last_known_location, :danger_level, :bounty_value
  attr_reader :id

  def initialize( options )
    @name = options['name']
    @last_known_location = options['last_known_location']
    @danger_level = options['danger_level']
    @bounty_value = options['bounty_value'].to_i
    @id = options['id'].to_i if options['id']
  end
