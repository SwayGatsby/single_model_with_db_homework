require( 'pg' )

# TODO:  The filename should reflect the class, ie bounty.rb
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

  # def save()
  def save()
    db = PG.connect( {
      dbname: 'bounties',
      host: 'localhost' } )
      sql =
      "INSERT INTO bounties
      (
        name,
        last_known_location,
        danger_level,
        bounty_value
      )
      VALUES
      (
        $1, $2, $3, $4
      )
      RETURNING *"
      values = [@name, @last_known_location, @danger_level, @bounty_value]
      db.prepare("save", sql)
      @id = db.exec_prepared("save", values)[0]["id"].to_i
      db.close()
    end



  # def update()
  def update()
     db = PG.connect( { dbname: 'bounties', host: 'localhost' } )
     sql = "UPDATE bounties
     SET
     (
       name,
       last_known_location,
       danger_level,
       bounty_value
     ) =
     (
     	$1, $2, $3, $4
     )
     WHERE id = $5"

     values = [@name, @last_known_location, @danger_level, @bounty_value, @id]
     db.prepare("update", sql)
     db.exec_prepared("update", values)

     db.close
   end

  # def delete()
  #  ....DELETE


end
