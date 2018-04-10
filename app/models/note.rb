class Note
  def initialize(attrs)
    @midi_pitch = attrs[:midi_pitch].to_f
    @onset_time = attrs[:onset_time].to_f
    @duration = attrs[:duration].to_f
    @volume = attrs[:volume].to_f
  end

  def name
    "#{letter_note}/#{octave}"
  end

  private
    attr_reader :midi_pitch

    def letter_note
      letter_notes[midi_pitch.round % 12]
    end

    def octave
      (midi_pitch.round / 12) - 1
    end

    def letter_notes
      ['C', 'C#', 'D', 'D#', 'E', 'F', 'F#', 'G', 'G#', 'A', 'A#', 'B']
    end
end
