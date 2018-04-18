class Song
  attr_reader :key, :tse

  def initialize(attrs, tse='4/4', bpm=130)
    @key = attrs[:key].gsub('#', '^')
    @tse = tse
    @bpm = bpm
    @raw_notes = attrs[:notes]
  end

  def self.from_upload(audio, tse='4/4', bpm=130)
    raw_song = SonicApiService.post_file(audio)
    new(raw_song, tse='4/4', bpm=130)
  end

  def notes
    @notes ||= raw_notes.map do |raw_note|
      Note.new(raw_note, eighth_note_duration)
    end
  end

  def measure_duration
    @measure_duration ||= beat_duration * beats_per_measure
  end

  private
    attr_reader :raw_notes, :bpm

    def beats_per_measure
      @beats_per_measure ||= tse.to_i
    end

    def eighth_note_duration
      (tse[-1].to_f / 8) * beat_duration
    end

    def beat_duration
      @beat_duration ||= 60.0 / bpm.to_f
    end
end
