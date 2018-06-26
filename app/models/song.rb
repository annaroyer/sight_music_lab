class Song
  attr_reader :key, :tse

  def initialize(raw_notes, exercise, bpm=130)
    @key = exercise.key
    @tse = exercise.tse
    @bpm = bpm
    @raw_notes = raw_notes
  end

  def self.from_upload(audio, exercise, bpm=130)
    raw_notes = SonicApiService.post_file(audio)
    new(raw_notes, exercise, bpm=130)
  end

  def notes
    @notes ||= raw_notes.map do |raw_note|
      Note.new(raw_note, beat_duration)
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

    def beat_duration
      @beat_duration ||= 60.0 / bpm.to_f
    end
end
