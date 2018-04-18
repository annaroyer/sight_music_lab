class Api::V1::Exercises::AttemptsController < ApiController

  def create
    render json: Attempt.create(song: song,
                                exercise: exercise,
                                rhythm_score: rhythm_score,
                                pitch_score: pitch_score,
                                user: current_user)
  end

  private

    def current_user
      User.find_by(email: params[:user_email])
    end

    def exercise
      @exercise ||= Exercise.find(params[:exercise_id])
    end

    def comparison
      @comparison ||= exercise.notes.gsub(' |', '').split(' ').zip(song.notes)
    end

    def upload
      Upload.create(audio: params[:audio]).audio.url
    end

    def song
      @song ||= Song.from_upload(upload, exercise.tse)
    end

    def rhythm_score
      comparison.count do |notes|
        notes.first.end_with?(notes.last.num_beats.to_s)
      end * score_weight
    end

    def pitch_score
      comparison.count do |notes|
        notes.first.start_with?(notes.last.letter)
      end * score_weight
    end

    def score_weight
      @score_weight ||= 5 / comparison.count
    end
end
