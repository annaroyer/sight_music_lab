class Song
  attr_reader :key, :tse, :bpm

  def initialize(attrs, tse='4/4', bpm=130)
    @key = attrs[:key]
    @tse = tse
    @bpm = bpm
    @raw_notes = attrs[:notes].values
  end

  def notes
    @notes ||= raw_notes.map do |raw_note|
      note = Note.new(raw_note, single_beat_type, beat_duration)
      note if note.audible?
    end.compact
  end

  private
    attr_reader :raw_notes

    def beats_per_measure
      @beats_per_measure ||= tse.split('/').first.to_i
    end

    def single_beat_type
      @single_beat_type ||= tse.split('/').last.to_f
    end

    def beat_duration
      @beat_duration ||= 60.0 / bpm.to_f
    end

    def measure_duration
      @measure_duration ||= beat_duration * beats_per_measure
    end
end
