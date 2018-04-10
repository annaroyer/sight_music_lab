class Song
  attr_reader :key, :tse, :bpm

  def initialize(attrs, tse='4/4', bpm=150)
    @key = attrs[:key]
    @tse = tse
    @bpm = bpm
    @raw_notes = attrs[:notes].values
  end

  def notes
    raw_notes.map do |raw_note|
      Note.new(raw_note, beat_type, beat_duration)
    end
  end

  private
    attr_reader :raw_notes

    def beats_per_measure
      @beats_per_measure ||= tse.split('/').first.to_i
    end

    def beat_type
      @beat_type ||= tse.split('/').last.to_f
    end

    def beat_duration
      @beat_duration ||= 60.0 / bpm.to_f
    end
end
