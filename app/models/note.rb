class Note

  def initialize(attrs, beat_duration)
    @beat_duration = beat_duration
    @midi_pitch = attrs[:midi_pitch].to_f
    @onset_time = attrs[:onset_time].to_f
    @duration = attrs[:duration].to_f
    @volume = attrs[:volume].to_f
  end

  def num_beats
    whole_beats.to_s + partial_beat
  end

  def letter
    return 'z' if silent?
    letter = letter_notes[midi_pitch.round % 12]
    abc_format(letter)
  end

  def off_time
    onset_time + duration
  end

  private
    attr_reader :midi_pitch, :duration, :beat_duration, :volume, :onset_time

    def silent?
      volume < 0.01
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

    def whole_beats
      (duration / beat_duration).round
    end

    def partial_beat
      return '/2' if (duration / beat_duration % whole_beats).between?(0.4, 0.6)
      ''
    end
end
