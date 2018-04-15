class Song
  attr_reader :key, :tse

  def initialize(attrs, tse='4/4', bpm=130)
    @key = attrs[:key].gsub('#', '^')
    @tse = tse
    @bpm = bpm
    @raw_notes = attrs[:notes]
  end

  def self.from_upload(file)
    raw_song = SonicApiService.post_file(file)
    new(raw_song)
  end

  def notes
    @notes ||= raw_notes.map do |raw_note|
      note = Note.new(raw_note, beat_duration)
      note if note.audible?
    end.compact
  end

  def beats_per_measure
    @beats_per_measure ||= tse.split('/').first.to_i
  end

  def each_beat
    '1/' + tse.split('/').last
  end

  private
    attr_reader :raw_notes, :bpm

    def beat_duration
      @beat_duration ||= 60.0 / bpm.to_f
    end
end
