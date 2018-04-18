class AttemptSerializer < ActiveModel::Serializer
  attributes :song, :pitch_score, :rhythm_score

  def song
    SongSerializer.new(object.song).attributes
  end

  def pitch_score
    object.pitch_score
  end

  def rhythm_score
    object.rhythm_score
  end
end
