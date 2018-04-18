class AttemptAnalyzer

  def initialize(attrs)
    @user     = User.find_by(email: attrs[:user_email])
    @exercise = Exercise.find(attrs[:exercise_id])
    @upload   = Upload.create(audio: attrs[:audio])
  end

  def generate
    Attempt.create(
      song: song,
      exercise: exercise,
      rhythm_score: (rhythm_score * score_weight).round,
      pitch_score: (pitch_score * score_weight).round,
      user: user
    )
  end

  private
    attr_reader :user, :exercise, :upload

    def song
      @song ||= Song.from_upload(upload.audio.url, exercise.tse)
    end

    def rhythm_score
      comparison.count do |notes|
        notes.first && notes.last && notes.first.end_with?(notes.last.num_beats.to_s)
      end
    end

    def pitch_score
      comparison.count do |notes|
        notes.first && notes.last && notes.first.start_with?(notes.last.letter)
      end
    end

    def comparison
      @comparison ||= exercise.notes.gsub(' |', '').split(' ').zip(song.notes)
    end

    def score_weight
      @score_weight ||= 5.0 / comparison.count
    end
end
