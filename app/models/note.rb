class Note
  attr_reader :onset_time

  def initialize(attrs, beat_duration)
    @beat_duration = beat_duration
    @midi_pitch = attrs[:midi_pitch].to_f
    @onset_time = attrs[:onset_time].to_f
    @duration = attrs[:duration].to_f
    @volume = attrs[:volume].to_f
  end

  def name
    "#{letter_note}#{num_beats}"
  end

  def num_beats
    (duration / beat_duration).round
  end

  def audible?
    volume > 0.001
  end

  private
    attr_reader :midi_pitch, :duration, :beat_duration, :volume

    def letter_note
      letter_notes[midi_pitch.round % 12]
    end

    def octave
      (midi_pitch.round / 12) - 1
    end

    def letter_notes
      ['C', 'C^', 'D', 'D^', 'E', 'F', 'F^', 'G', 'G^', 'A', 'A^', 'B']
    end
end
