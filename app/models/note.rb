class Note
  attr_reader :onset_time

  def initialize(attrs, single_beat_type, beat_duration)
    @single_beat_type = single_beat_type
    @beat_duration = beat_duration
    @midi_pitch = attrs[:midi_pitch].to_f
    @onset_time = attrs[:onset_time].to_f
    @duration = attrs[:duration].to_f
    @volume = attrs[:volume].to_f
  end

  def name
    "#{type} #{letter_note}/#{octave}"
  end

  def beat_length
    (single_beat_type / num_beats ).round
  end

  def audible?
    volume > 0.001
  end

  private
    attr_reader :midi_pitch, :duration, :beat_duration, :single_beat_type, :volume

    def letter_note
      letter_notes[midi_pitch.round % 12]
    end

    def octave
      (midi_pitch.round / 12) - 1
    end

    def type
      beat_symbols[beat_length]
    end

    def num_beats
      duration / beat_duration
    end

    def letter_notes
      ['C', 'C#', 'D', 'D#', 'E', 'F', 'F#', 'G', 'G#', 'A', 'A#', 'B']
    end

    def beat_symbols
      {16 => ':16', 8 => ':8', 4 => ':q', 2 => ':h', 1 => ':w'}
    end
end
