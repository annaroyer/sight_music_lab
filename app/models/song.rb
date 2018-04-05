class Song
  attr_reader :key, :time

  def initialize(melody_attrs, key, tempo, time)
    @key = key
    @time = time
    @tempo = tempo
    
  end

  def notation
    'C-D-E/4 F#/5 | G-A-B/4 F#/5'
  end
end
