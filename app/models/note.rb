class Note
  attr_reader :onset_time

  def initialize(attrs, beat_duration)
    @beat_duration = beat_duration
    @midi_pitch = attrs[:midi_pitch].to_f
    @onset_time = attrs[:onset_time].to_f
    @duration = attrs[:duration].to_f
    @volume = attrs[:volume].to_f
  end

  def num_beats
    beats ||= (beat_duration / duration)
    return beats.rationalize.to_s if beats % 1 >= 0.25
    beats.floor
  end

  def letter
    return 'z' if silent?
    letter = letter_notes[midi_pitch.round % 12]
    abc_format(letter)
  end

  private
    attr_reader :midi_pitch, :duration, :beat_duration, :volume

    def silent?
      volume < 0.001
    end

    def octave
      (midi_pitch.round / 12) - 1
    end

    def letter_notes
      ['C', 'C^', 'D', 'D^', 'E', 'F', 'F^', 'G', 'G^', 'A', 'A^', 'B']
    end

    def abc_format(letter)
      if octave <= 4
        letter + (Array.new(4 - octave, ',').join)
      else
        letter.downcase + (Array.new(octave - 5, "'").join)
      end
    end
end
