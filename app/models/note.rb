class Note
  def initialize(attrs, beat_duration)
    @beat_duration = beat_duration
    @midi_pitch = attrs[:midi_pitch].to_f
    @onset_time = attrs[:onset_time].to_f
    @duration = attrs[:duration].to_f
    @volume = attrs[:volume].to_f
  end

  def to_abcJS_string
    return '' if num_beats == 0
    " #{letter}#{num_beats}"
  end

  def num_beats
    return "{whole_beats + 2}/2" if partial_beat?
    whole_beats
  end

  def letter
    return 'z' if silent?
    letter = letter_notes[midi_pitch.round % 12]
    abc_format(letter)
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
      ['C', '^C', 'D', '^D', 'E', 'F', '^F', 'G', '^G', 'A', '^A', 'B']
    end

    def abc_format(letter)
      if octave <= 4
        letter <<  ("," * (4 - octave))
      else
        letter.downcase << ("'" * (octave - 5))
      end
    end

    def exact_beat_nums
      duration / beat_duration
    end

    def whole_beats
      (exact_beat_nums).round
    end

    def partial_beat?
      exact_beat_nums.modulo(1).between?(0.4, 0.6)
    end
end
