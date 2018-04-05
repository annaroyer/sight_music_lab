class Note
  def initialize(attrs)
    @pitch = pitch_index[attrs[:midi_pitch]]
    
  end
end
