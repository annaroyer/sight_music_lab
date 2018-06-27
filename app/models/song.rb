class Song
  attr_reader :beats_per_measure

  def initialize(raw_notes, exercise, bpm=130)
    @key = exercise.key
    @beats_per_measure = exercise.tse.to_i
    @beat_duration = 60.0 / bpm.to_f
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

  private
    attr_reader :raw_notes, :beat_duration
    
end
